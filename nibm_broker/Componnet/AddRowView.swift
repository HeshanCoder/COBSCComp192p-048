//
//  AddRowView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/14/22.
//

import SwiftUI

struct AddRowView: View {
    @State private var price = ""
    @State private var landOrHouse = ""
    @State private var landSize = ""
    @State private var district = ""
    @State private var townOrVillage = ""
    
    // Envirenment objects can usen in whole applicaton
    // Initialized it when app start time.
    @EnvironmentObject var viewModel : SignInViewModel
    let sellItem : SellItem
    
    var body: some View {
        Group{
            addRowMainInterfaceView
        }
    }
}

struct AddRowView_Previews: PreviewProvider {
    static var previews: some View {
        //AddRowView( sellItem: SellItem)
        let add = SellItem(id: "123", price: "120,000.00", landOrHouse: "Land", district: "Colombo", landSize: "20 ph", location: "1234444,-244444", townOrVilage: "Town", itemImageURL: "N?A")
        return AddRowView(sellItem: add)
    }
}

extension AddRowView {
    var addRowMainInterfaceView : some View{
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 30){
                // Image
                Image("0")
                    .resizable()
                    .frame(width: 130, height: 130)
                //.foregroundColor(Color(.systemBlue))
                // info
                VStack{
                    HStack{
                        Text(sellItem.price + " LKR")
                            .font(.title3)
                            .bold()
                        Spacer()
  
                    }
                    HStack{
                        Text(sellItem.landOrHouse)
                            .font(.title3)
                            .bold()
                            Spacer()
                    }

                    HStack{
                        Text(sellItem.district)
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    HStack{
                        Text(sellItem.landSize)
                            .font(.title3)
                            .bold()
                        Spacer()
                    }
                    HStack{
                        Text(sellItem.townOrVilage)
                            .font(.title3)
                            .bold()
                        Spacer()
                        /*
                         NavigationLink{
                         if(viewModel.userSession == nil){
                         SignInView()
                         }else{
                         AddDetailsView()
                         }
                         } label:{
                         Text("View")
                         }
                         .font(.headline)
                         .foregroundColor(.white)
                         .frame(width: 60, height: 22)
                         .background(Color(.systemBlue))
                         .clipShape(Capsule())
                         .padding(.leading)
                         */
                    }
                }
                .frame(height:120)
            }

            Divider()
        }
        .padding(.leading)
        .padding(.top)
        .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
    }
}
