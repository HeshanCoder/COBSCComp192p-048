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
    @StateObject var viewModel = SignInViewModel()
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                UserHomeView()
                   
            } .environmentObject(viewModel)
        }
    }
}
