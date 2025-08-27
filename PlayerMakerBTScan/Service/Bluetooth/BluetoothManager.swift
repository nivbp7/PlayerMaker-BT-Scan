//
//  BluetoothManager.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation
import CoreBluetooth
import Combine

final class BluetoothManager: NSObject {
    
    struct DiscoveredPeripheral {
        let name: String?
        let rssi: NSNumber
    }
    
    private var central: CBCentralManager!
    private var isScanning = false
    private var authorization: AuthorizationStatus = .unknown
    private var peripherals: [UUID: DiscoveredPeripheral] = [:]

    private let discoverySubject = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var bluetoothDevices: [BluetoothDevice] = []

    enum AuthorizationStatus {
        case allowed
        case denied
        case poweredOff
        case unknown
    }
    
    override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: .main)
        
        discoverySubject
            .debounce(for: .milliseconds(30), scheduler: DispatchQueue.main)
            .sink { [weak self] in self?.publishDevices() }
            .store(in: &cancellables)
    }
    
    func startScan() {
        beginScanning()
    }
    
    func stopScan() {
        guard isScanning else { return }
        central.stopScan()
        isScanning = false
    }
    
    private func publishDevices() {
        let mapped = peripherals.map { (uuid, peripheral) in
            let name = peripheral.name ?? "N/A"
            return BluetoothDevice(id: uuid.uuidString, name: name, rssi: peripheral.rssi.intValue)
        }
        
        bluetoothDevices = mapped.sorted {
            $0.name < $1.name
        }
    }
    
    private func beginScanning() {
        guard central.state == .poweredOn, !isScanning else { return }
        isScanning = true
        peripherals.removeAll()
        bluetoothDevices.removeAll()
        central.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey: true])
    }
}

extension BluetoothManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn: authorization = .allowed
        case .unauthorized: authorization = .denied
        case .poweredOff: authorization = .poweredOff
        case .unknown, .resetting, .unsupported:
            authorization = .unknown
     
        @unknown default:
            authorization = .unknown
        }
        beginScanning()
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let name = peripheral.name ?? (advertisementData[CBAdvertisementDataLocalNameKey] as? String)
        peripherals[peripheral.identifier] = DiscoveredPeripheral(name: name, rssi: RSSI)
        discoverySubject.send(())
    }
}
