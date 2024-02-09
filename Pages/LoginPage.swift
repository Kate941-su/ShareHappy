//
//  Login.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/06.
//

import SwiftUI

struct LoginPage: View {
  var body: some View {
    NavigationView {
      VStack {
        Image(.iconUserSampleSquare).resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        LoginButton(
          icon: Image(.iconGoogle),
          label: "Sign in with Google",
          action: { print("Button tapped!")
          }
        )
        LoginButton(
          icon: Image(.iconApple),
          label: "Sign in with Apple",
          action: { print("Button tapped!")
          }
        )
        NavigationLink(destination: AvailableUserPage()) {
            Text("Go to Second View")
        }
      }
      .navigationBarTitle("LoginPage")
    }
  }
}

#Preview {
  LoginPage()
}
