//
//  MapviewController.swift
//  eggmap3
//
//  Created by Mei on 29/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import MapKit
import CoreLocation

class MapviewController: UIViewController, CLLocationManagerDelegate {
  
  @IBOutlet weak var mapContainerView: UIView!
  var addressString: String? {
    didSet{
      locationManager.delegate = self
      locationManager.requestWhenInUseAuthorization()
      locationManager.startUpdatingLocation()
      locationManager.startUpdatingLocation()
    }
  }
  
  let mapView = GMSMapView()
  let locationManager = CLLocationManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    locationManager.startUpdatingLocation()
  }
  
  fileprivate func setupViews() {
    mapContainerView.addSubview(mapView)
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.topAnchor.constraint(equalTo: mapContainerView.topAnchor, constant: 0).isActive = true
    mapView.leftAnchor.constraint(equalTo: mapContainerView.leftAnchor, constant: 0).isActive = true
    mapView.bottomAnchor.constraint(equalTo: mapContainerView.bottomAnchor, constant: 0).isActive = true
    mapView.rightAnchor.constraint(equalTo: mapContainerView.rightAnchor, constant: 0).isActive = true

  }
}

extension MapviewController {
  
  func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    let location = locations[0]
    let center = location.coordinate
    let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 18)
    mapView.animate(to: camera)
    guard let address = addressString else {return}
    geoCodeAddress(address: address, userPoint: center)
  }
  
  private func geoCodeAddress(address: String, userPoint: CLLocationCoordinate2D) {
    var coordinates = CLLocationCoordinate2D()
    let geocoder = CLGeocoder()
    
    geocoder.geocodeAddressString(address) { (placemarks, error) in
      if error != nil {
        //put an alert here for no placemarks found
        print("GEOCODER: No Placemarks Found!")
      } else {
        guard let unwrappedCoord = placemarks?.first?.location?.coordinate else {return}
        coordinates = unwrappedCoord
        
        //to calculate the distance
        //                let userPoint = MKMapPointForCoordinate(userPoint)
        //                let addressPoint = MKMapPointForCoordinate(coordinates)
        //                let distance = MKMetersBetweenMapPoints(userPoint, addressPoint)
        //                if distance < 100000 {
        let newMarker = GMSMarker(position: coordinates)
        newMarker.title = address
        newMarker.map = self.mapView
        self.mapView.animate(toLocation: coordinates)
        //to display user's coordinates
        //                    self.mapView.isMyLocationEnabled = true
        //                }
      }
    }
  }
}
