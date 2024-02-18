//
//  AvailableUserPage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import Combine
import SwiftUI
import Firebase

struct AvailableUserPage: View {
  @StateObject var deviceLocationService = DeviceGeoLocationService.shared
  @State var tokens: Set<AnyCancellable> = []
  @State var coordinates: Coordinates = Coordinates(latitude: 0, logitude: 0)
  @State var userNameFromFirebase: String = ""
  let userName: String
  let dummyPoint: Coordinates = Coordinates(latitude: 35.196529, logitude: 136.879950)
  let userRepository: UserRepository = UserRepository()
  
  init(userName: String) {
    self.userName = userName
  }

  var body: some View {
    VStack(alignment: .leading) {
      Text("\(userName)")
      Text("distance is \(deviceLocationService.getDistance(point1: coordinates, point2: dummyPoint))m")
      Text("Latitude: \(coordinates.latitude)").font(.largeTitle)
      Text("Longitude: \(coordinates.longitude)").font(.largeTitle)
    }.onAppear {
      // Subscribe observers at first.
      observeCoordinateUpdates()
      observeLocationAccessDenied()
      deviceLocationService.requestLocationUpdates()
      userRepository.showUserAllData()
    }
  }

  func observeCoordinateUpdates() {
    deviceLocationService.coordinatesPublisher.receive(on: DispatchQueue.main)
      .sink {
        completion in
        if case .failure(let error) = completion {
          print(error)
        }
      } receiveValue: { coordinates in
        self.coordinates = Coordinates(latitude: coordinates.latitude, logitude: coordinates.longitude)
      }.store(in: &tokens)
  }

  func observeLocationAccessDenied() {
    deviceLocationService.deniedLocationAccessPublisher.receive(on: DispatchQueue.main)
      .sink {
        // Todo: Lost geolocation data error handling
        print("Show some kind of alert to the user")
      }.store(in: &tokens)
  }
}

#Preview {
  AvailableUserPage(userName: "dummy")
}
