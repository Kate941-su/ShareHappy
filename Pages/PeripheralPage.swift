//
//  PeripheralPage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/18.
//

import SwiftUI

struct PeripheralPage: View {
  
    let peripheralManagerController = PeripheralManagerController()
    @State var isOn = false
  
    var body: some View {
        Text("Peripheral Page")
      Toggle(isOn: $isOn) {
        Text("Advertising: " + (isOn == true ? "ON" : "OFF"))
      }
      .toggleStyle(.switch)
      .padding()
    }
}

#Preview {
    PeripheralPage()
}
