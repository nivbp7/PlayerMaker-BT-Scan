//
//  BluetoothManager.swift
//  PlayerMakerBTScan
//
//  Created by niv ben-porath on 26/08/2025.
//

import Foundation
import CoreBluetooth

final class BluetoothManager: NSObject {
    private var central: CBCentralManager!
    private var authorization: AuthorizationStatus = .unknown
    private var isScanning = false

    enum AuthorizationStatus {
        case allowed
        case denied
        case poweredOff
        case unknown
    }
    
    override init() {
        super.init()
        central = CBCentralManager(delegate: self, queue: .main)
    }
    
    func startScan() {
        beginScanning()
    }
    
    private func beginScanning() {
        guard central.state == .poweredOn, !isScanning else { return }
        isScanning = true
        central.scanForPeripherals(withServices: nil)
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
        print(peripheral.name)
    }
}
