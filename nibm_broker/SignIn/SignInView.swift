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
    
    @Environment(\.presentationMode) var presentationModesn
    @EnvironmentObject var viewModel : SignInViewModel
    
    var body: some View {
        VStack{
            
            // Header View
            VStack(alignment: .leading){
                HStack{Spacer()}
                
                Button{
                    presentationModesn.wrappedValue.dismiss()
                    
                }label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20 , height: 16)
                        .foregroundColor(.white)
                        .offset(x: 1, y: 12)
                }
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Wlcome Back")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:260)
            .padding(.leading)
            .background(.white)
            .foregroundColor(.black)
            
            VStack(spacing : 40){
                //TextField("Email",text: $email)
                //TextField("Password",text: $password)
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Password", isSecureField: true,  text: $password)
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink{
                    ResetPasswordView()
                    
                } label : {
                    Text("Forget Password?")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemYellow))
                        .padding(.top)
                        .padding(.trailing, 24)
                    //.frame(width: 360, height: 40)
                }
            }
            Button{
                viewModel.login(withemail: email, password: password)
                presentationModesn.wrappedValue.dismiss()
            } label : {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemYellow))
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
            .foregroundColor(Color(.systemYellow))
            
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
