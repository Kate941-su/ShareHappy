//
//  CentralController.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/18.
//

import Foundation
import CoreBluetooth

class CentralManagerController: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
  
  var centralManager: CBCentralManager!
  var discoveredPeripherals: [CBPeripheral] = []
  var selectedPeripheral: CBPeripheral?
  var selectedUsernameCharacteristic: CBCharacteristic?
  var dataToSend: String = "Hello, Peripheral!"
  let serviceUUID = FileTransferService.serviceUUID
  let usernameCharacteristicUUID = FileTransferService.usernameCharacteristicUUID
  let dataCharacteristicUUID = FileTransferService.dataCharacteristicUUID
  
  override init() {
    super.init()
    centralManager = CBCentralManager(delegate: self, queue: nil)
  }

  // Notify changing state of central bluetooth state
  func centralManagerDidUpdateState(_ central: CBCentralManager) {
    if central.state == .poweredOn {
      centralManager.scanForPeripherals(withServices: [serviceUUID], options: nil)
    } else {
      // TODO: use combine and affect screen
      print("Blutetoothe is not available")
    }
  }
  
  // Notify discovering peripheral device.
  func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
      print("Discovered Peripheral: \(peripheral)")
      if !discoveredPeripherals.contains(peripheral) {
          discoveredPeripherals.append(peripheral)
      }
      print("Discovered Peripherals: \(discoveredPeripherals)")
  }
  
  // Notify connecting peripheral device.
  func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
      print("Connected to Peripheral: \(peripheral)")
      selectedPeripheral = peripheral
      peripheral.delegate = self
      peripheral.discoverServices([serviceUUID])
  }
  
  // CBPeripheralDelegate
  func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
      if let error = error {
          print("Error discovering services: \(error.localizedDescription)")
          return
      }
      for service in peripheral.services ?? [] {
          peripheral.discoverCharacteristics(nil, for: service)
      }
  }
  
  func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
      if let error = error {
          print("Error updating value for characteristic: \(error.localizedDescription)")
          return
      }
      if let value = characteristic.value {
          let receivedData = String(data: value, encoding: .utf8)!
          print("Received data from Peripheral: \(receivedData)")
          if characteristic == selectedUsernameCharacteristic {
              // Display username list
              print("Selected username: \(receivedData)")
              // Here you can implement UI to display username list
              // User selects a username, then call sendDataToPeripheral() with selectedPeripheral and selectedUsernameCharacteristic
              sendDataToPeripheral(peripheral: selectedPeripheral!, characteristic: dataCharacteristicUUID, data: dataToSend)
          }
      }
  }
  
  func sendDataToPeripheral(peripheral: CBPeripheral, characteristic: CBUUID, data: String) {
      if let service = peripheral.services?.first(where: { $0.uuid == serviceUUID }) {
          if let characteristic = service.characteristics?.first(where: { $0.uuid == characteristic }) {
              peripheral.writeValue(data.data(using: .utf8)!, for: characteristic, type: .withResponse)
          }
      }
  }
  
}
