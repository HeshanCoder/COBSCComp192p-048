//
//  SellItem.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/17/22.
//

// using this FirebaseFirestoreSwift package we can decode the firebase data into models
import FirebaseFirestoreSwift

// we can map fething data to this object (Model) then we can use that object through the application
struct SellItem : Identifiable, Decodable{
    
    @DocumentID var id : String?
    let price : String
    let landOrHouse :String
    let district : String
    let landSize : String
    let location : String
    let townOrVilage : String
    let itemImageURL : String
}
