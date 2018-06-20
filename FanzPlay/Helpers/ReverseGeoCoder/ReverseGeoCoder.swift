//
//  ReverseGeoCoder.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/18/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import CoreLocation



class ReverseGeoCoder: NSObject  {
    
    var locationManager = CLLocationManager()
    
    func getReverseGeoLoc() {
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
}


extension ReverseGeoCoder: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lat = locations.last?.coordinate.latitude, let long = locations.last?.coordinate.longitude {
            
            let location = CLLocation(latitude: lat, longitude: long)
            
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                
                if error != nil {
                    print("Reverse geocoder failed with error" + (error?.localizedDescription)!)
                    return
                }
                if (placemarks?.count)! > 0 {
                    let pm = placemarks![0]
                    print("locality ---->>>>  \(String(describing: pm.locality!))")
                    
                    // Parse Theme via current State and Save to NSUserDefault
                    
                }
                else {
                    print("Problem with the data received from geocoder")
                }
            })
        } else {
            print("No coordinates")
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}

























