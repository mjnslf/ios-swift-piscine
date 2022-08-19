//
//  MapViewController.swift
//  kanto
//
//  Created by Мадина Кадырова on 8/18/22.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,UITabBarControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var currentPin: Pin?
    var locationManager = CLLocationManager()
    private var currentLocation: CLLocation? = nil
    private var allAnnotations: [MKAnnotation] = []
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        addPins()
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        zoomToPin(ix: 0)
    }
    
    private func addPins() {
        for (i, _) in locationData.enumerated() {
            mapView.addAnnotation(locationData[i])
        }
    }
    
    private func zoomToPin(ix: Int) {
        let pin = locationData[ix]
        var zoomRect = MKMapRect.null
        let annotationPoint = MKMapPoint(pin.coordinate)
        let pointRect = MKMapRect(x: annotationPoint.x, y: annotationPoint.y, width: 1, height: 1);
        zoomRect = zoomRect.union(pointRect);
        self.mapView.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 500, left: 500, bottom: 500, right: 500), animated: true)
    }
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 1: mapView.mapType = .satellite
        case 2: mapView.mapType = .hybrid
        default:
            mapView.mapType = .standard
        }
    }

    func showPin(pinNum: Int) {
        self.tabBarController?.selectedIndex = 0
        zoomToPin(ix: pinNum)
        print(pinNum)
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "")

        switch annotation.title!! {
        case locationData[0].title:
            annotationView.markerTintColor = UIColor(red: (255.0/255), green: (95.0/255), blue: (170.0/255), alpha: 1.0)
            annotationView.glyphImage = UIImage(named: "park")
        default:
            annotationView.markerTintColor = UIColor.green
        }
        return annotationView
    }
}
