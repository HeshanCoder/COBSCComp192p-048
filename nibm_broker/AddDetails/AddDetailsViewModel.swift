//
//  AddDetailsViewModel.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import Firebase
import UIKit

class AddDetailsViewModel :  ObservableObject{
    @Published var currentSellItem : SellItem?
    let sellItemId : String = ""
    private let sellItemService = SellItemService()
    init(){
        
        //self.sellItemId = sellItemId
        //self.fetchSelectedSellItem(uid: sellItemId)
    }
    
    func fetchSelectedSellItem(uid:String){
        print("DEBUG Sell Item Fetch id \(uid)")
        // guard var uid = uid
        sellItemService.fetchSellItem(withUid: uid) { sellItem in
            self.currentSellItem = sellItem
            print("DEBUG Sell Item Fetch succesfull \("")")
        }
    }
    
}
