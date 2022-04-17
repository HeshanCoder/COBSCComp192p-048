//
//  SellItemService.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/17/22.
//

import Firebase
import FirebaseFirestoreSwift

struct SellItemService{
    
    func fetchSellItem(withUid uid : String, completion : @escaping (SellItem) -> Void){
        Firestore.firestore().collection("advertiesment")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else{return}
                
                // creating sellitem object by decording firebase data into UserModel
                guard let sellItem = try? snapshot.data(as : SellItem.self) else {return}
                
                print("DEBUG : Fetch user data  Username : \(sellItem.price)")
                print("DEBUG : Fetch user data  Mobile : \(sellItem.landOrHouse)")
                
                completion(sellItem)
            }
    }
    
    func fetchSellItems(completion : @escaping ([SellItem]) -> Void){
        print("DEBUG : Fetch sellitems data Hit")
        Firestore.firestore().collection("advertiesment")
            .getDocuments { snapshot, _ in
                print("DEBUG : Fetch sellitems data Hit2")
                guard let documents = snapshot?.documents else{ return }
                
                // creating selitems object by decording firebase data into UserModel
                let sellItems = documents.compactMap({try? $0.data(as : SellItem.self)})
         
                
                print("DEBUG : Fetch user data  Username : \(sellItems)")
                completion(sellItems)
            }
    }
}
