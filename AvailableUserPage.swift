//
//  AvailableUserPage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import SwiftUI

struct AvailableUserPage: View {
  var body: some View {
    VStack(alignment: .leading) {
      List(mockedUserentity, id: \.uuid) { userEntity in
        UserCard(uuid: userEntity.uuid,
                 name: userEntity.name,
                 iconImage: userEntity.icon)
      }
    }
  }
}

#Preview {
  AvailableUserPage()
}
