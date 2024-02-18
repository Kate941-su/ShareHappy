//
//  ShareHappyApp.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import FirebaseCore
import SwiftUI
import GoogleSignIn
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool
  {
    AppCheck.setAppCheckProviderFactory(MyAppCheckProviderFactory())
    FirebaseApp.configure()
    return true
  }
}

@main
struct ShareHappyApp: App {
  // register app delegate for Firebase setup
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  var body: some Scene {
    WindowGroup {
      LaunchPage()
        .onOpenURL(perform: { url in
          // TODO: check signIn status prevent signIn everytime.
          GIDSignIn.sharedInstance.handle(url)
        })
//          AvailableUserPage()
    }
  }
}
