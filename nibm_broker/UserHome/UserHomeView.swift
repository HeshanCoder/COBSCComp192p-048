//
//  UserHome.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct UserHomeView: View {
    var body: some View {
        VStack{
            HeaderBarView()
            ScrollView{
                LazyVStack{
                    ForEach(0...20, id: \.self){ _ in
                        AddRowView()
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
