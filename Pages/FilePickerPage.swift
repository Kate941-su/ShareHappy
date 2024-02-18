//
//  FilePickerPage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/15.
//

import SwiftUI

struct FilePickerPage: View {
  @State private var text = ""
  @State private var error: Error?
  @State private var isImporting = false
  
  var body: some View {
    VStack(alignment: .center) {
      Button("Import") {
        isImporting = true
      }
      .fileImporter(isPresented: $isImporting,
                    // Ad chance?
                    // If the user watch some ads, you can send any file types
                    // but only once.
                    allowedContentTypes: [.text,.image,.mp3,.pdf]) { result in
        switch result {
        case .success(let file):
          print(file.absoluteString)
        case .failure(let error):
          print(error.localizedDescription)
        }
      }
    }
    .toolbar {
      HStack {
        Text("Hello")
        Text("Hello")
        Text("Hello")
      }
    }
  }
}

#Preview {
    FilePickerPage()
}
