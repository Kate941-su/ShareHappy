//
//  CheatSheat.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import SwiftUI

struct CheatSheat: View {
  var body: some View {
    VStack{
      Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        .font(.headline)
        .foregroundStyle(Color.green)
        .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
        .padding()
        .lineLimit(nil)
    }
    
    Button(action: {}, label: {Text("Click Me")})
  }
}

#Preview {
  CheatSheat()
}
