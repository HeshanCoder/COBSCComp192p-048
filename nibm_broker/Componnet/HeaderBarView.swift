//
//  HeaderBarView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/14/22.
//

import SwiftUI

struct HeaderBarView: View {
    var body: some View {
        // Header View
        VStack(alignment: .leading){
            HStack{Spacer()}
            HStack{
            NavigationLink{
                SettingsView()
            }label :{
                Text("Setting")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 88, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.bottom,10)
                    
            }
            .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
            
            NavigationLink{
                SellerAddDetailsView()
                
            }label :{
                Text("Sell $")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 88, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding(.bottom,10)
                    
            }
            .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
                NavigationLink{
                    SignInView()
                }label :{
                    Text("Sign In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 88, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding(.bottom,10)
                        
                }
                .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                
                
            }
            
            
            
            Divider().foregroundColor(.black)
        }
        .frame(height:65)
        .padding(.leading)
        .background(.white)
        .foregroundColor(.white)
    }
}

struct HeaderBarView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderBarView()
    }
}
