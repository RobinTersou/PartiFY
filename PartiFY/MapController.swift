//
//  MapController.swift
//  PartiFY
//
//  Created by Robin Tersou on 26/06/2019.
//  Copyright © 2019 Robin Tersou. All rights reserved.
//

import UIKit
import MapKit

class MapController: UIViewController, MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    let initialLocation = CLLocation(latitude: 52.3740300, longitude: 4.8896900)
    let searchRadius: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initMap()
        
    }
    
    func initMap() {
        mapView.delegate = self
        
        let coordinateRegion = MKCoordinateRegion.init(center: initialLocation.coordinate, latitudinalMeters: searchRadius * 2.0, longitudinalMeters: searchRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
        
        
    }
    
    
    
    
}
