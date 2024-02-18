//
//  BluetoothChoicePage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/18.
//

import SwiftUI

struct BluetoothChoicePage: View {
    var body: some View {
      NavigationStack{
        VStack {
          NavigationLink(destination: CentralPage(), label:{ Text("Central")})
            .padding()
          NavigationLink(destination: PeripheralPage(), label:{ Text("Peripheral")})
            .padding()
        }
      }
    }
}

#Preview {
    BluetoothChoicePage()
}
