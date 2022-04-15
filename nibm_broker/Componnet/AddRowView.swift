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
    
    var body: some View {
        Group{
            addRowMainInterfaceView
        }
    }
}

struct AddRowView_Previews: PreviewProvider {
    static var previews: some View {
        AddRowView()
    }
}

extension AddRowView {
    var addRowMainInterfaceView : some View{
        VStack(alignment: .leading){
            HStack(alignment: .top, spacing: 30){
                // Image
                Rectangle()
                    .frame(width: 110, height: 110)
                    .foregroundColor(Color(.systemBlue))
                // info
                VStack{
                    HStack{
                        Text("120000 LKR")
                            .font(.title3)
                            .bold()
                        
                        Text(" | ")
                            .font(.title3)
                            .bold()
                        
                        Text("House")
                            .font(.title3)
                            .bold()
                    }
                    Spacer()
                    HStack{
                        Text("Colombo")
                            .font(.title3)
                            .bold()
                        
                        Text(" | ")
                            .font(.title3)
                            .bold()
                        
                        Text("40 purch")
                            .font(.title3)
                            .bold()
                    }
                    Spacer()
                    HStack{
                        Text("Town")
                            .font(.title3)
                            .bold()
                        
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
                        
                    }
                }
                .frame(height:100)
            }
            HStack  {
                Spacer()
            }
            Divider()
        }
        .padding(.leading)
        .padding(.top)
        
    }
}
