//
//  PeripheralController.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/18.
//

import Foundation
import CoreBluetooth

class PeripheralManager: NSObject, CBPeripheralManagerDelegate {
  var peripheralManager: CBPeripheralManager!
  var service: CBMutableService?
  let serviceUUID = FileTransferService.serviceUUID
  let usernameCharacteristicUUID = FileTransferService.usernameCharacteristicUUID
  let dataCharacteristicUUID = FileTransferService.dataCharacteristicUUID
  var dataCharacteristic: CBMutableCharacteristic?
  override init() {
    super.init()
  }
  
  // CBPeripheralManagerDelegate
  func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
      if peripheral.state == .poweredOn {
          createService()
      } else {
          print("Bluetooth is not available")
      }
  }
  
  func createService() {
      dataCharacteristic = CBMutableCharacteristic(
          type: dataCharacteristicUUID,
          properties: [.read, .write, .notify],
          value: nil,
          permissions: [.readable, .writeable]
      )
      
      service = CBMutableService(type: serviceUUID, primary: true)
      service?.characteristics = [dataCharacteristic!]
      
      peripheralManager.add(service!)
  }
  
  func peripheralManager(_ peripheral: CBPeripheralManager, central: CBCentral, didSubscribeTo characteristic: CBCharacteristic) {
      print("Central subscribed to characteristic: \(characteristic.uuid)")
  }
  
  func peripheralManager(_ peripheral: CBPeripheralManager, didReceiveRead request: CBATTRequest) {
      if request.characteristic.uuid == dataCharacteristicUUID {
          if let data = "Hello, Central!".data(using: .utf8) {
              request.value = data
              peripheralManager.respond(to: request, withResult: .success)
          } else {
              peripheralManager.respond(to: request, withResult: .attributeNotFound)
          }
      } else {
          peripheralManager.respond(to: request, withResult: .attributeNotFound)
      }
  }
  
  func peripheralManagerIsReady(toUpdateSubscribers peripheral: CBPeripheralManager) {
      if let data = "Hello, Central!".data(using: .utf8) {
          peripheralManager.updateValue(data, for: dataCharacteristic!, onSubscribedCentrals: nil)
      }
  }
}
