//
//  FileTransferConstant.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/18.
//

import Foundation
import CoreBluetooth


struct FileTransferService {
  private init() {}
  static let serviceUUID = CBUUID(string: "E20A39F4-73F5-4BC4-A12F-17D1AD07A960")
  static let usernameCharacteristicUUID = CBUUID(string: "08590F7E-DB05-467E-8757-72F6FAEB13D0")
  static let dataCharacteristicUUID = CBUUID(string: "08590F7E-DB05-467E-8757-72F6FAEB13D1")
}
