//
//  SelectOptionView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/14/22.
//

import SwiftUI

struct SelectOptionView: View {
    @State private var selectedText : String = "Land"
    var body: some View {
        VStack(alignment: .leading){
            HStack{
            Text("Options")
                .contextMenu {
                    Button {
                        print("Change to house")
                        self.selectedText = "House"
                    } label: {
                        Label("House", systemImage: "house")
                    }

                    Button {
                        print("Change to land")
                        self.selectedText = "Land"
                    } label: {
                        Label("Land", systemImage: "l.square.fill")
                    }
                }.shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
                Text(selectedText).padding(.leading,20)
            }
           
           
            
            
            Divider().foregroundColor(.black)
        }
        .frame(height:65)
        .padding(.leading)
        //.background(.white)
        //.foregroundColor(.white)
    }
    
}

struct SelectOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectOptionView()
    }
}
