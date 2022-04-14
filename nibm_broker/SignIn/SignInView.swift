//
//  SignInView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack{
            
            // Header View
            VStack(alignment: .leading){
                HStack{Spacer()}
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Wlcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            
            VStack(spacing : 40){
                //TextField("Email",text: $email)
                //TextField("Password",text: $password)
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Password", text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink{
                    Text("Reset Pasword")
                    
                } label : {
                    Text("Forget Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemBlue))
                        .padding(.top)
                        .padding(.trailing, 24)
                        //.frame(width: 360, height: 40)
                }
            }
            Button{
                print("Sign in button click")
            } label : {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                    
            }
            .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
            Spacer()
    
            NavigationLink{
                SignUpView()
                    //.navigationBarHidden(true)
            } label: {
                HStack{
                    Text("Dont hava an account? ")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom,50)
            .foregroundColor(Color(.systemBlue))
           
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
            .previewDevice("iPhone 11")
    }
}
