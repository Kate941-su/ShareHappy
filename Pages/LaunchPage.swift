//
//  Splash.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/07.
//

import SwiftUI

// Get screen width
let containerWidth: CGFloat = UIScreen.main.bounds.width

struct LaunchPage: View {
  @State var state = LaunchStateObject().state
  var body: some View {
    if state == .fetching {
      VStack(alignment: .center) {
        Image(.iconSplashShareHappySvg).resizable().aspectRatio(1, contentMode: .fit).frame(width: containerWidth * 0.5)
      }.onAppear {
        Task {
          try await Task.sleep(for: .seconds(2))
          state = .login
        }
      }
    } else if state == .login {
      FilePickerPage()
//      LoginPage()
    } else {
      AvailableUserPage(userName: "")
    }
  }
}

#Preview {
  LaunchPage()
}

class LaunchStateObject: ObservableObject {
  @Published var state: LaunchState = .fetching
}

enum LaunchState {
  case fetching
  case login
  case main
}
