//
//  SellerAddDetailsViewModel.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import Firebase
import UIKit

class SellerAddDetailViewModel :  ObservableObject{
    
    private var locationManager : LocationManager
    public var sellItemId : String = "30E99346-D818-425D-85BF-3452F6820FB6"
    @Published var geoLocation : String = ""
    @Published var currentSellItem : SellItem?
    
    private let sellItemService = SellItemService()
    
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
    private var uid : String = ""
    
    func  createAdvertiesment(price: String, landOrHouse :String, district : String, landSize : String
                              ,location : String, townOrVilage :String, imageSl : UIImage
    ){
        
        let data = ["price" : price,
                    "landOrHouse" : landOrHouse.lowercased(),
                    "district" : district,
                    "landSize" : landSize,
                    "location" : location,
                    "townOrVilage" : townOrVilage,
                    "itemImageURL" : ""]
        
        if(uid == ""){
            self.uid = NSUUID().uuidString
            
        }else{
            self.uid = ""
            self.uid = NSUUID().uuidString
            
        }
        Firestore.firestore()
            .collection("advertiesment")
            .document(self.uid)
            .setData(data) { _error in
                // this is a completion function.
                // TODO - handle errors
                print("DEBUG: advertiesment data create successfully \n\n")
                self.uploadItemImage(imageSl,uidUP: self.uid)
            }
    }
    
    func uploadItemImage(_ image : UIImage, uidUP:String){
        //guard let uid = tempUserSession?.uid else{return}
        ImageUploader.uploadImage(image: image) { itemImageURL in
            Firestore.firestore().collection("advertiesment")
                .document(uidUP)
                .updateData(["itemImageURL" : itemImageURL]) { _ in
                    //self.userSession = self.tempUserSession
                }
        }
    }
    
    func fetchSelectedSellItem(uid:String){
        print("DEBUG Sell Item Fetch id \(uid)")
        // guard var uid = uid
        sellItemService.fetchSellItem(withUid: uid) { sellItem in
            self.currentSellItem = sellItem
            print("DEBUG Sell Item Fetch succesfull \("")")
        }
    }
    
    func fetchAllItems(){
        sellItemService.fetchSellItems(){ sellItem in
            print("DEBUG Sell Item Fetch succesfull \("")")
        }
    }
}



