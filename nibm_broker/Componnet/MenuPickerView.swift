//
//  MenuPickerView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/14/22.
//

import SwiftUI

struct MenuPickerView: View {
    let typeText: String
    var options = ["House","Land"]
    @State private var selectedOption = 0
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(typeText) :")
                Picker(selection: $selectedOption, label: Text("Selected")) {
                    ForEach(0..<options.count) {
                        Text(self.options[$0])
                    }
                }
                
                //Text("selected: \(self.options[selectedOption])")
            }
            .pickerStyle(MenuPickerStyle())
            Divider().foregroundColor(.black)
        }
        .frame(height:65)
        .padding(.leading)
    }
}

struct MenuPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MenuPickerView(typeText: "")
    }
}
