//
//  pins.swift
//  kanto
//
//  Created by Мадина Кадырова on 8/18/22.
//

import Foundation
import MapKit
import CoreLocation

let locationData: [Pin] = [
    Pin(
        title: "42",
        coordinate: CLLocationCoordinate2D(latitude: 48.864716, longitude: 2.349014)
    ),
    Pin(
        title: "Saint Quen",
        coordinate: CLLocationCoordinate2D(latitude: 48.912331, longitude: 2.334250)
    ),
    Pin(
        title: "Grenoble",
        coordinate: CLLocationCoordinate2D(latitude: 45.171547, longitude: 5.722387)
    ),
    Pin(
        title: "Reims",
        coordinate: CLLocationCoordinate2D(latitude: 49.262798, longitude: 4.034700)
    ),
    Pin(
        title: "Moldavie",
        coordinate: CLLocationCoordinate2D(latitude: 47.003670, longitude: 28.907089)
    ),
]

class Pin: NSObject, MKAnnotation {
  let title: String?
  let coordinate: CLLocationCoordinate2D

  init(
    title: String?,
    coordinate: CLLocationCoordinate2D
  ) {
    self.title = title
    self.coordinate = coordinate

    super.init()
  }
}
