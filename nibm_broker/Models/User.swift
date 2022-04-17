//
//  User.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/17/22.
//

// using this FirebaseFirestoreSwift package we can decode the firebase data into models
import FirebaseFirestoreSwift

// we can map fething data to this object (Model) then we can use that object through the application
struct User : Identifiable, Decodable{
    
    @DocumentID var id : String?
    let email : String
    let birthDate :String
    let gender : String
    let name : String
    let location : String
    let mobile : String
    let username : String
}
