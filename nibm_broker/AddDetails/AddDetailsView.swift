//
//  AddDetailsView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct AddDetailsView: View {
    
    public var numberOfImages = 6
    public let timer = Timer.publish(every: 3,  on: .main,in: .common).autoconnect()
    @State public var currentIndex = 0
    @Environment(\.presentationMode) var mode
    
    public var sellitem : SellItem
    func previouse(){
        withAnimation{
            currentIndex = currentIndex > numberOfImages ? currentIndex - 1 : numberOfImages - 1
        }
    }
    
    func next(){
        withAnimation{
            currentIndex = currentIndex < numberOfImages ? currentIndex + 1 : 0
        }
    }
    
    var controls : some View{
        HStack{
            Button{
                previouse()
            }label: {
                Image(systemName : "chevron.left")
            }
            Spacer()
                .frame(width: 10)
                .padding()
            Button{
                next()
            }label: {
                Image(systemName : "chevron.right")
            }
        }
    }
    
    var body: some View {
        GeometryReader{ proxy in
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
                    Text("Adverticement")
                        .font(.largeTitle)
                        .fontWeight(.semibold)
                }
                .frame(height:150)
                .padding(.leading)
                .background(Color(.systemBlue))
                .foregroundColor(.white)
                
                VStack{
                    
                    TabView(selection: $currentIndex){
                        ForEach(0..<numberOfImages){ num in
                            Image("\(num)")
                                .resizable()
                                .scaledToFit()
                                .overlay(Color.black.opacity(0.3))
                                .tag(num)
                            
                        }
                        
                    }
                    .tabViewStyle(PageTabViewStyle())
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(width: proxy.size.width, height: proxy.size.height/3)
                    
                    .padding(.bottom, 10)
                    .padding(.top,0)
                    //.padding(.leading,3)
                    //.padding(.trailing,3)
                    .onReceive(timer, perform: {_ in
                        withAnimation{
                            next()
                        }
                    })
                    controls
                }
                
                Divider()
                VStack{
                    HStack{
                        Text("Price :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                        Text(sellitem.price)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                    }
                    HStack{
                        Text("Geo Location :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                        Text(sellitem.location)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                    }
                    HStack{
                        Text("Land / House :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                        Text(sellitem.landOrHouse)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                    }
                    HStack{
                        Text("District :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                        Text(sellitem.district)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                    }
                    HStack{
                        Text("Town / Village :")
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                        Text(sellitem.townOrVilage)
                            .font(.title2)
                            .fontWeight(.bold)
                            .padding(.leading , 10)
                    }
                }
                
            }
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}
/*
 struct AddDetailsView_Previews: PreviewProvider {
 static var previews: some View {
 AddDetailsView()
 }
 }
 */
