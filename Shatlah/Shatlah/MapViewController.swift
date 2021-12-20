//
//  MapViewController.swift
//  Shatlah
//
//  Created by mac on 19/12/2021.
//

import UIKit
import MapKit

class MapVC: UIViewController , CLLocationManagerDelegate {
    let mapView = MKMapView()
    let locationvol = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        mapView.frame = CGRect(x: 0, y: 0, width: 400, height: 850)
        view.addSubview(mapView)

        
    
        let initialLoc = CLLocation(latitude: 24.8538977, longitude: 46.7128922)
    
        setStartingLocation(location: initialLoc, distance: 100)
        addAnnotation()
    }
    
    
    
   
     func setStartingLocation(location: CLLocation, distance: CLLocationDistance){
        let region = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: distance, longitudinalMeters: distance)
         mapView.setRegion(region, animated: true)
          mapView.setCameraBoundary(MKMapView.CameraBoundary(coordinateRegion: region), animated: true)
         let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 300000)
         mapView.setCameraZoomRange(zoomRange, animated: true)
     }
    
    
    func addAnnotation(){
        let pain = MKPointAnnotation()
        pain.coordinate = CLLocationCoordinate2D(latitude: 24.8538977, longitude: 46.7128922)
        pain.title = "موقع المبادرة"
        pain.subtitle = "اكاديميه طويق"
        mapView.addAnnotation(pain)
    }
}


