//
//  ContentView.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import SwiftUI
import URLImageModule

struct ContentView: View {
  
  @State var a: Int = 0
  
  var body: some View {
    VStack {
      // fetch image from url
      // AsyncImage()
      Button(action: increment, label: { /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/})
      Text("Hello, world! conunt is : \(a)").font(.largeTitle).padding()
    }
    .padding()
  }
  
  private func increment() {
    a = a + 1
  }
  
  
}

#Preview {
    ContentView()
}



