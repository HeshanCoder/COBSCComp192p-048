//
//  SellerAddDetailsView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct SellerAddDetailsView: View {
    @State private var price: String = ""
    @State private var landorHousee: String = ""
    @State private var district: String = ""
    @State private var location: String = ""
    @State private var landSize: String = ""
    @State private var images: String = ""
    @State private var townOrvillage: String = ""
   
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack{
            
            // Header View
            VStack(alignment: .leading){
               
                
                HStack{Spacer()}
                Button{
                    mode.wrappedValue.dismiss()
                    
                }label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20 , height: 16)
                        .foregroundColor(.white)
                        .offset(x: 1, y: 12)
                }
                Text("Sell a Property")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:150)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
          
            
            VStack(spacing : 20){
                
                
                Rectangle()
                    .frame(width: 250, height: 250)
                    .foregroundColor(Color(.systemBlue))
                    
                
                
                
                CustomInputtField(imageName: "dollarsign.circle", placeHolderText: "Price", text: $price)
                
                CustomInputtField(imageName: "bookmark.fill", placeHolderText: "Land / House", text: $landorHousee)
                
                CustomInputtField(imageName: "safari", placeHolderText: "District", text: $district)
                
                CustomInputtField(imageName: "square.and.arrow.up.on.square.fill", placeHolderText: "Land Size", text: $landSize)
                
                CustomInputtField(imageName: "house", placeHolderText: "Town / Vilage", text: $townOrvillage)
                
                CustomInputtField(imageName: "location", placeHolderText: "Location", text: $location)
                
                CustomInputtField(imageName: "tray.and.arrow.down.fill", placeHolderText: "Upload Images", text: $images)

            }
            .padding(.horizontal,32)
            .padding(.top,2)
            
            HStack{
                Spacer()
            }
            Button{
                print("Update Account Button Click")
            } label : {
                Text("Add Advertiesment")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                
            }
            .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
            Spacer()
            
            
            
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct SellerAddDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SellerAddDetailsView()
    }
}
