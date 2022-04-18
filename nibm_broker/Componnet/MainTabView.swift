//
//  MainTabView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/18/22.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var viewModel : SignInViewModel
    var body: some View {
        VStack(alignment: .leading){
            HStack{Spacer()}
            HStack{
                
                NavigationLink
                {
                    //if(viewModel.userSession?.uid != nil){
                    UserHomeView()
                }label: {
                    
                    VStack{
                        Image(systemName: "house.fill")
                        Text("Home")
                    }.font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 88, height: 50)
                        .background(Color(.systemYellow))
                        .clipShape(Rectangle())
                        .padding(.bottom,10)
                }.shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
                NavigationLink
                {
                    if(viewModel.userSession?.uid != nil){
                    //if(true){
                        SettingsView()
                    }else{
                        SignInView()
                    }
                }label: {
                    
                    VStack{
                        Image(systemName: "circle.grid.3x3.fill")
                        Text("Setting")
                    }.font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 88, height: 50)
                        .background(Color(.systemYellow))
                        .clipShape(Rectangle())
                        .padding(.bottom,10)
                }.shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
                
                NavigationLink
                {
                    SellerAddDetailsView()
                }label: {
                    VStack{
                        Image(systemName: "dollarsign.circle.fill")
                        Text("Sell")
                    }.font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 88, height: 50)
                        .background(Color(.systemYellow))
                        .clipShape(Rectangle())
                        .padding(.bottom,10)
                }.shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
                
                NavigationLink
                {
                    SignInView()
                }label: {
                    VStack{
                        Image(systemName: "person.crop.circle.fill")
                        Text("Sign In")
                    }.font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 88, height: 50)
                        .background(Color(.systemYellow))
                        .clipShape(Rectangle())
                        .padding(.bottom,10)
                }.shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
            }
            Divider().foregroundColor(Color(.systemYellow))
        }
        .frame(height:65)
        .padding(.leading)
        .background(.white)
        .foregroundColor(.white)
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
