//
//  HeaderView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/18/22.
//

import SwiftUI

struct HeaderView: View {
    @Environment(\.presentationMode) var mode
    
    var body: some View {
        VStack{
            //GeometryReader{proxy -> AnyView in
               // let height = proxy.frame(in: .global).height
                
               // return AnyView(
                    ZStack{
                        Circle().fill(Color("dark"))
                            .offset(x: getRec().width / 2, y: 0)
                        Circle().fill(Color("dark"))
                            .offset(x: -getRec().width / 2, y: 0)
                        Circle().fill(Color("lightBlue"))
                    }
              //  )
                
           // }.frame(maxHeight: getRec().width)
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

extension View{
    func getRec() ->CGRect {
        return UIScreen.main.bounds
    }
}
