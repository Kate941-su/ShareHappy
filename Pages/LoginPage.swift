//
//  Login.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/06.
//

import SwiftUI
import Combine

struct LoginPage: View {
  @State var inputName = ""
  var body: some View {
    NavigationView {
      VStack {
        Image(.iconUserSampleSquare).resizable().frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
        // TODO: Email Auth
//        LoginButton(
//          icon: Image(.iconGoogle),
//          label: "Sign in with Google",
//          action: { print("Button tapped!")
//          }
//        Text("or")
//        LoginButton(
//          icon: Image(.iconGoogle),
//          label: "Sign in with Google",
//          action: { print("Button tapped!")
//          }
//        )
//        LoginButton(
//          icon: Image(.iconApple),
//          label: "Sign in with Apple",
//          action: { print("Button tapped!")
//          }
//        )
        Text(inputName).font(.largeTitle).padding()
        TextField("Input your name", text: $inputName).padding()
        NavigationLink(destination: AvailableUserPage(userName: inputName).navigationBarBackButtonHidden(true)) {
            Text("Go to Second View")
        }
      }
    }
    .navigationBarTitle("LoginPage")
  }
}

#Preview {
  LoginPage()
}

class TextFieldPublisher: ObservableObject{
  
  
  
}
