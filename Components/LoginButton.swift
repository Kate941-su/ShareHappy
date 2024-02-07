//
//  LoginButton.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/06.
//

import SwiftUI

struct LoginButton: View {
  let action: () -> Void
  let icon: Image
  let label: String

  init(icon: Image, label: String, action: @escaping () -> Void) {
    self.action = action
    self.icon = icon
    self.label = label
  }

  var body: some View {
    Button(
      action: action,
      label: {
          icon
          .resizable()
          .frame(width: 48, height: 48)
          .padding()
        Text(label)
      }
    )
  }
}

#Preview {
  LoginButton(
    icon: Image(.iconGoogle),
    label: "Sign in with Google",
    action: { print("Button Tapped")
    }
  )
}
