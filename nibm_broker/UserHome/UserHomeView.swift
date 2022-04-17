//
//  UserHome.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct UserHomeView: View {
    private var district = ["Colombo","Kurunegala","Kandy","Galle"]
    private var itemType = ["House", "Land"]
    
    @ObservedObject var userhomeViewModel  = UserHomeViewModel()
    @EnvironmentObject var viewModel : SignInViewModel
    
    var body: some View {
        VStack{
            HeaderBarView()
            HStack{
                MenuPickerView(typeText:"House/Land", options: itemType)
                MenuPickerView(typeText:"District",options: district)
            }
            ScrollView{
                LazyVStack{
                    ForEach(userhomeViewModel.sellItems){ sellitem in

                            NavigationLink{
                                if(viewModel.userSession == nil){
                                    
                                    SignInView()
                                    
                                }else{
                                    
                                    AddDetailsView(sellitem: sellitem)
                                }
                        } label: {
                            AddRowView(sellItem: sellitem)
                        }
                       
                    }
                }
            }.navigationBarHidden(true)
        }
    }
}

struct UserHome_Previews: PreviewProvider {
    static var previews: some View {
        UserHomeView()
    }
}
