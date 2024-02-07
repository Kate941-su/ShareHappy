//
//  UserCard.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import SwiftUI

struct UserCard: View {
  let uuid: UUID
  let name: String
  let iconImage: Image
  
  init(uuid: UUID, name: String, iconImage: Image) {
    self.uuid = uuid
    self.name = name
    self.iconImage = iconImage
  }
  
  var body: some View {
    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
      iconImage
        .resizable()
        .backgroundStyle(Color.white)
        .frame(width: 30, height: 30)
        .padding(.all, 20)
        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
      Spacer()
      Text(name)
        .foregroundStyle(Color.black)
        .fontWeight(.bold)
        .padding(.all, 20)
    }
    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
    .background(Color(red: 0.8, green: 0.8, blue: 0.8))
    .modifier(UserCardModifier())
    .padding(.top, 10)
  }
}

struct UserCardModifier: ViewModifier {
  func body(content: Content) -> some View {
    content
      .cornerRadius(20)
//      .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 0)
  }
}

#Preview {
  UserCard(
    uuid: mockedUserentity[0].uuid,
    name: mockedUserentity[0].name,
    iconImage: mockedUserentity[0].icon)
}
