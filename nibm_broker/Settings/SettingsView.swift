//
//  SettingsView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI

struct SettingsView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var gender: String = ""
    @State private var dob: String = ""
    @State private var name: String = ""
    @State private var mobile: String = ""
    @State private var password: String = ""
    @State private var newPassword: String = ""
    @State private var newCmPassword: String = ""
    @State private var location: String = ""
    @Environment(\.presentationMode) var mode
    
    var body: some View {
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
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:150)
            .padding(.leading)
            .background(Color(.systemBlue))
            .foregroundColor(.white)
            
            VStack(spacing : 20){
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email).disabled(true)
                
                CustomInputtField(imageName: "person", placeHolderText: "Usernmae", text: $username).disabled(true)
                
                CustomInputtField(imageName: "person.2.fill", placeHolderText: "Gender", text: $gender).disabled(true)
                
                CustomInputtField(imageName: "calendar", placeHolderText: "Date of Birth", text: $dob).disabled(true)
                
                CustomInputtField(imageName: "person", placeHolderText: "Name", text: $name).disabled(true)
                
                CustomInputtField(imageName: "phone", placeHolderText: "Mobile", text: $mobile)
                
                CustomInputtField(imageName: "location", placeHolderText: "Location", text: $location)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Old Password", text: $password)
                
                CustomInputtField(imageName: "lock", placeHolderText: "New Password", text: $newPassword)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Confirm Passrod", text: $newCmPassword)
             
                
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
            }
            Button{
                print("Update Account Button Click")
            } label : {
                Text("Update Account")
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
                    Text("")
                        .font(.footnote)
                    Text("Log out")
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
