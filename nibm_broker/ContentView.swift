//
//  ContentView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/12/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 16 ){
            Text("NIBM_Brokes")
                .padding()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
