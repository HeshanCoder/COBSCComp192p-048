//
//  nibm_brokerApp.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/12/22.
//

import SwiftUI
import Firebase

@main
struct nibm_brokerApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            //ContentView()
            NavigationView{
                UserHomeView()
                //AddDetailsView()
            }
        }
    }
}
