//
//  UserHomeViewModel.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import Foundation

class UserHomeViewModel : ObservableObject{
    @Published var sellItems = [SellItem]()
    
    let sellItemService = SellItemService()
    
    init(){
        fetchSlItems()
    }
    
    func fetchSlItems(){
        sellItemService.fetchSellItems { sellItems in
            self.sellItems = sellItems
            print("DEBUG : Fetched Sell Items \(sellItems)")
        }
    }
}
