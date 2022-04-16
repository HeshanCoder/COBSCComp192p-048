//
//  SignUpViewModel.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import Foundation

class SignUpViewModel : ObservableObject{
    
    private var locationManager : LocationManager
    @Published var geoLocation : String = ""
    
    init(){
        locationManager = LocationManager()
        self.setGeoLocation()
    }
    
       var userLatitude: String {
           return "\(locationManager.lastLocation?.coordinate.latitude ?? 0)"
       }
       
       var userLongitude: String {
           return "\(locationManager.lastLocation?.coordinate.longitude ?? 0)"
       }
    
    func getGeoLocation() -> String{
        return  "userLatitude : \(locationManager.lastLocation?.coordinate.latitude ?? 0) and userLongitude \(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
    
    func setGeoLocation(){
        self.geoLocation = "la : \(locationManager.lastLocation?.coordinate.latitude ?? 0) and lo \(locationManager.lastLocation?.coordinate.longitude ?? 0)"
    }
}
