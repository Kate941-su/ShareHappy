//
//  UserRepository.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/14.
//

import Foundation
import Firebase

// read from Firestore
struct UserRepository {

  func showUserAllData() {
    Firestore.firestore().collection("user").getDocuments(){ (success, error) in
      if let error = error {
        print(error)
      } else {
        let data = success!.documents.compactMap{$0.data()}
        print(data)
      }
    }

  }
  
}

