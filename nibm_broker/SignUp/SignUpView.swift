//
//  SignUpView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var gender: String = ""
    @State private var dob: String = ""
    @State private var name: String = ""
    @State private var mobile: String = ""
    @State private var password: String = ""
    @State private var cmPassword: String = ""
    @State private var location: String = ""
    @Environment(\.presentationMode) var presentationModeSu
    @EnvironmentObject var viewModel : SignInViewModel
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{Spacer()}
                NavigationLink{
                    SignInView()
                    
                }label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20 , height: 16)
                        .foregroundColor(.white)
                        .offset(x: 1, y: 12)
                }
                Text("Hello..!,")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                Text("Create Your Account")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:260)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            
            VStack(spacing : 20){
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
                CustomInputtField(imageName: "person", placeHolderText: "Usernmae", text: $username)
                
                CustomInputtField(imageName: "person.2.fill", placeHolderText: "Gender", text: $gender)
                
                CustomInputtField(imageName: "calendar", placeHolderText: "Date of Birth", text: $dob)
                
                CustomInputtField(imageName: "person", placeHolderText: "Name", text: $name)
                
                CustomInputtField(imageName: "phone", placeHolderText: "Mobile", text: $mobile)
                
                CustomInputtField(imageName: "location", placeHolderText: "Location", text: $location)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Password", isSecureField: true, text: $password)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Confirm Passrod", isSecureField: true,  text: $cmPassword)
             
                
            }
            .padding(32)
            
            Button{
                viewModel.register(withemail: email, password: password, username: username, gender: gender, birthDate: dob, name: name, mobile: mobile, location: location)
            } label : {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(Color(.systemBlue))
                    .clipShape(Capsule())
                    .padding()
                    
            }
            .shadow(color: .gray.opacity(0.5), radius:10 , x: 0, y: 0)
            
            
            	
            Spacer()
            
            Button{
                presentationModeSu.wrappedValue.dismiss()
            } label:{
                HStack{
                    Text("Already hasva an account? ")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding(.bottom,30)
            .foregroundColor(Color(.systemBlue))
            
        }
        .navigationBarHidden(false)
        .ignoresSafeArea()
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
