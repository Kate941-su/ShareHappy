//
//  FirebaseAuthService.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/09.
//

//import Firebase
//import Foundation
//import FirebaseAuth
//import FirebaseCore
//import GoogleSignIn
//
//class FirebaseAuthService: ObservableObject {
//  @Published var isAuthenticated = false
//  
//  init() {
//    observeAuthChanges()
//  }
//  
//  private func observeAuthChanges() {
//    Auth.auth().addStateDidChangeListener { [weak self] _, user in
//      DispatchQueue.main.async { [weak self] in
//        guard let self else { return }
//        isAuthenticated = user != nil
//      }
//    }
//  }
//  
//  func signUpWithEmailAndPassword(email: String, password: String) {
//    Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//      DispatchQueue.main.async { [weak self] in
//        guard let self else { return }
//        if result != nil, error == nil {
//          isAuthenticated = true
//        }
//      }
//    }
//  }
//  
//  func signUpWithGoogle() {
//    guard let clientID = FirebaseApp.app()?.options.clientID else {return}
//
//    // Create Google Sign In configuration object.
//    let config = GIDConfiguration(clientID: clientID)
//    
//    // As you’re not using view controllers to retrieve the presentingViewController, access it through
//    // the shared instance of the UIApplication
//    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//    guard let rootViewController = windowScene.windows.first?.rootViewController else { return }
//
//    // Start the sign in flow!
//    GIDSignIn.sharedInstance.signIn(with: config, presenting: rootViewController) { [unowned self] user, error in
//
//      if let error = error {
//          print("Error doing Google Sign-In, \(error)")
//          return
//      }
//
//      guard
//        let authentication = user?.authentication,
//        let idToken = authentication.idToken
//      else {
//        print("Error during Google Sign-In authentication, \(error)")
//        return
//      }
//
//      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
//                                                     accessToken: authentication.accessToken)
//        
//        
//        // Authenticate with Firebase
//        Auth.auth().signIn(with: credential) { authResult, error in
//            if let e = error {
//                print(e.localizedDescription)
//            }
//           
//            print("Signed in with Google")
//        }
//    }
//}
//    
//  }
//  
//  func signUpWithApple() {}
//
//  func signInWithEmainAndPassword(email: String, password: String) {
//    Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
//      DispatchQueue.main.async { [weak self] in
//        guard let self else { return }
//        if result != nil, error == nil {
//          isAuthenticated = true
//        }
//      }
//    }
//  }
//  
//  func signInWithGoggle() {}
//  
//  func signInWithApple() {}
//  
//  func logout() {
//    do {
//      try Auth.auth().signOut()
//      isAuthenticated = false
//    } catch let signOutError as NSError {
//      print("Error signout: %@", signOutError)
//    }
//  }
//}
