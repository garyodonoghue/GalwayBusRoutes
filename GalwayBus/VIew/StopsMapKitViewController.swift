//
//  StopsMapKitViewController.swift
//  GalwayBus
//
//  Created by Gary O'Donoghue on 20/02/2017.
//  Copyright © 2017 Gary O'Donoghue. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation
import MapKit

class StopsMapKitViewController : UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var mapView : MKMapView!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locValue:CLLocationCoordinate2D = manager.location!.coordinate 
        
        let center = CLLocationCoordinate2D(latitude: locValue.latitude, longitude: locValue.longitude)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: center, span: span)
        
        self.mapView.setRegion(region, animated: true)
    }
}
