//
//  UserEntity.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import Foundation
import SwiftUI

struct UserEntity {
  let uuid: UUID
  let name: String
  // TODO: fetch from Network Image
  let icon: Image
}

let mockedUserentity: [UserEntity] = [
  UserEntity(
    uuid: UUID(),
    name: "Alice in wonderland",
    icon: Image(.iconUserSampleSquare)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Bobby william",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Cart raccel",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Dragon dance",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Alice in wonderland",
    icon: Image(.iconUserSampleSquare)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Bobby william",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Cart raccel",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Dragon dance",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Alice in wonderland",
    icon: Image(.iconUserSampleSquare)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Bobby william",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Cart raccel",
    icon: Image(.iconUserSample)
  ),
  UserEntity(
    uuid: UUID(),
    name: "Dragon dance",
    icon: Image(.iconUserSample)
  ),
]
