//
//  DeviceGeoLocationService.swift
//  ShareHappy
//
//  Created by KaitoKitaya on 2024/02/08.
//

import Combine
import CoreLocation
import Foundation

class DeviceGeoLocationService: NSObject, CLLocationManagerDelegate, ObservableObject {
  // Notify event
  var coordinatesPublisher = PassthroughSubject<CLLocationCoordinate2D, Error>()
  
  var deniedLocationAccessPublisher = PassthroughSubject<Void, Never>()
  
  override private init() {
    super.init()
  }
  
  static let shared = DeviceGeoLocationService()
  
  private lazy var locationManager: CLLocationManager = {
    let manager = CLLocationManager()
    manager.desiredAccuracy = kCLLocationAccuracyBest
    manager.delegate = self
    return manager
  }()
  
  func requestLocationUpdates() {
    switch locationManager.authorizationStatus {
    case .notDetermined:
      locationManager.requestWhenInUseAuthorization()
    case .authorizedWhenInUse, .authorizedAlways:
      locationManager.startUpdatingLocation()
    default:
      deniedLocationAccessPublisher.send()
    }
  }
  
  func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
    print("\(manager.authorizationStatus)")
    switch manager.authorizationStatus {
    case .authorizedWhenInUse, .authorizedAlways:
      manager.startUpdatingLocation()
    default:
      manager.stopUpdatingLocation()
      deniedLocationAccessPublisher.send()
    }
  }
  
  
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    guard let location = locations.last else { return }
    coordinatesPublisher.send(location.coordinate)
  }
  
  func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    coordinatesPublisher.send(completion: .failure(error))
  }
}
