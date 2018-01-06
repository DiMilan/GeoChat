//
//  MapViewController.swift
//  GeoChat
//
//  Created by iMac27 on 05/01/2018.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {

    //location manager to get users location
            let locationManager = CLLocationManager()
            var currentUserLatitude = 0.00
            var currentUserLongitude = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            //API Key AIzaSyB5ZMEkjT0JLUHAAm6Q3HKavU1Hj8zaPnA
        
            GMSServices.provideAPIKey("AIzaSyB5ZMEkjT0JLUHAAm6Q3HKavU1Hj8zaPnA")
        
        //Hogent 51.031400, 3.701301
        
        let latitude = 51.031400
        let longitude = 3.701301
        
        //get user GPS location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.startUpdatingLocation()

        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        //marker
        
        let currentLocation = CLLocationCoordinate2DMake(latitude, longitude)
        let marker = GMSMarker(position: currentLocation)
        marker.title = "You"
        marker.snippet = "your location"
        marker.map = mapView
        
        let circleCenter : CLLocationCoordinate2D  = CLLocationCoordinate2DMake(latitude, longitude);
        let distance = 1000.0 //in meters
        let circ = GMSCircle(position: circleCenter, radius: distance)
        circ.fillColor = UIColor(red: 0.0, green: 0.7, blue: 0, alpha: 0.1)
        circ.strokeColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 0.5)
        circ.strokeWidth = 2.5;
        circ.map = mapView;
        
       
        
    }

    //location retrieved
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[locations.count-1]
        if location.horizontalAccuracy > 0 {
            locationManager.stopUpdatingLocation()
            currentUserLatitude = location.coordinate.latitude
            currentUserLongitude = location.coordinate.longitude
            print("user latitude: \(currentUserLatitude)")
            print("user longitude: \(currentUserLongitude)")
        }
    }
    
    //failed to get location
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    

    

}
