//
//  LocationManager.swift
//  iOSArchitecture_MVVM
//
//  Created by Mandeep Singh on 5/7/20.
//  Copyright © 2020 Surjeet Singh. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

extension AppDelegate : CLLocationManagerDelegate {
    
    /* This function is using for Location Manager serverices and check the authorization status.
    //MARK:- Location Manager Services
    func setupLocationManagerServices() {
        
        if CLLocationManager.locationServicesEnabled() {
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
            self.locationManager.requestAlwaysAuthorization()
            self.locationManager.startUpdatingLocation()
        } else {
            self.isAllowLocation = false
            self.presentLocationViewController()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.isAllowLocation = true

        guard let locationInfo = manager.location else {return}
        
        guard let coordinates = manager.location?.coordinate else {
            return
        }
        
        if locations.count > 0 {
            Methods.sharedInstance.userLiveLocation = CLLocation(latitude: locationInfo.coordinate.latitude, longitude:locationInfo.coordinate.longitude)
        }
        
        guard let userInfo = Methods.sharedInstance.getUserInfoData() else {
            return
        }
        
        let coordinate₀ = CLLocation(latitude: CLLocationDegrees(userInfo.latitude), longitude: CLLocationDegrees(userInfo.longitude))
        let coordinate₁ = CLLocation(latitude: locationInfo.coordinate.latitude, longitude: locationInfo.coordinate.longitude)
        let distanceInMiles = calculateDistanceBetweenTwooCoordinates(location1: coordinate₀, location2: coordinate₁)
        if distanceInMiles < 1 {
            // check same lat long
            if coordinate₀ == coordinate₁ {
                print("Return gya")
                return
            }else{
                // self.showAlertAppDelegate(message: "Update Location Api hit")
                // self.updateUserLocationToServer(coordinates: coordinates)
            }
        } else {
            print("lat is \(coordinates.latitude) and long is \(coordinates.longitude)")
        }
        self.locationManager.stopUpdatingLocation()
    }
    
    func calculateDistanceBetweenTwooCoordinates(location1:CLLocation, location2: CLLocation) -> Double {
        
        let distanceInMeters = location1.distance(from: location2)
        let distanceInMiles = distanceInMeters/1609.344
        return distanceInMiles
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .denied:
            if let block = Methods.sharedInstance.locationCallBack {
                block(appConstants.locationError as AnyObject)
            }
         self.isAllowLocation = false
         self.presentLocationViewController()
        case .authorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
        case .notDetermined:
            self.locationManager.startUpdatingLocation()
        default:
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func presentLocationViewController() {
        
        let userStatus = DefaultsStructure.sharedInstance.setLoginSession
        
        if (UserDefaults.standard.value(forKey: appConstants.isLocationAllow) == nil) && userStatus == true {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                let destinationVC = Constants.StoryBoardCons.mainInstance.instantiateViewController(withIdentifier: "EnableLocationViewController") as! EnableLocationViewController
                destinationVC.completionBlock = { (responseObject) in
                   UserDefaults.standard.setValue(true, forKey: appConstants.isLocationAllow)
                }
                self.window?.rootViewController?.present(destinationVC, animated: true, completion: nil)
            }
        }
    }
 */
}
