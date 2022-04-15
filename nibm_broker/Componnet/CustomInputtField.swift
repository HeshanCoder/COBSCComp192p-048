//
//  CustomInputtField.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

// a reusable component for a text field
struct CustomInputtField: View {
    let imageName :String
    let placeHolderText : String
    var isSecureField:Bool = false
    @Binding var text : String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                
                if isSecureField ?? false{
                    SecureField(placeHolderText,text: $text)
                }else{
                    TextField(placeHolderText,text: $text)
                }
                
            }
            Divider()
                .background(Color(.darkGray))
            
        }
    }
}

struct CustomInputtField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputtField(imageName: "envelope", placeHolderText: "Email",isSecureField: false , text: .constant(""))   }
}
