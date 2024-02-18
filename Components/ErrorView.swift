//
//  ErrorView.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/15.
//

import SwiftUI

struct ErrorView: View {
  let error: Error
  let retryAction: () -> Void
    var body: some View {
        Text("An Error Occured")
        .font(.title)
        .multilineTextAlignment(.center)
        .padding(.bottom, 40)
        .padding()
      Text("error message: \(error.localizedDescription)")
      Button(action: retryAction, label: {Text("Retry").bold()})
    }
}

#Preview {
  ErrorView(error: NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Something went wrong"]), retryAction: {})
}
