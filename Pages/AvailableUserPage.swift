//
//  AvailableUserPage.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/05.
//

import Combine
import SwiftUI

struct AvailableUserPage: View {
  @StateObject var deviceLocationService = DeviceGeoLocationService.shared

  @State var tokens: Set<AnyCancellable> = []
  @State var coordinates: (lat: Double, lon: Double) = (0, 0)

  var body: some View {
    VStack(alignment: .leading) {
      Text("Latitude: \(coordinates.lat)").font(.largeTitle)
      Text("Longitude: \(coordinates.lon)").font(.largeTitle)
    }.onAppear {
      // Subscribe observers at first.
      observeCoordinateUpdates()
      observeLocationAccessDenied()
      deviceLocationService.requestLocationUpdates()
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
        self.coordinates = (coordinates.latitude, coordinates.longitude)
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
  AvailableUserPage()
}
