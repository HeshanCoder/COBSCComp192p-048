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
    @EnvironmentObject var AuthViewModel : SignInViewModel
    
    
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
                        .foregroundColor(.black)
                        .offset(x: 1, y: 12)
                }
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:150)
            .padding(.leading)
            .background(.white)
            .foregroundColor(.black)
           
            
            if let user = AuthViewModel.currentUser{
                VStack(spacing : 20){
                    CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email).onAppear{
                        // binding to text field
                        self.email = user.email
                    }.disabled(true)
                    
                    CustomInputtField(imageName: "person", placeHolderText: "Usernmae", text: $username).onAppear{
                        // binding to text field
                        self.username = user.username
                    }.disabled(true)
                    
                    CustomInputtField(imageName: "person.2.fill", placeHolderText: "Gender", text: $gender).onAppear{
                        // binding to text field
                        self.gender = user.gender
                    }.disabled(true)
                    
                    CustomInputtField(imageName: "calendar", placeHolderText: "Date of Birth", text: $dob).onAppear{
                        // binding to text field
                        self.dob = user.birthDate
                    }.disabled(true)
                    
                    CustomInputtField(imageName: "person", placeHolderText: "Name", text: $name).onAppear{
                        // binding to text field
                        self.name = user.name
                    }.disabled(true)
                    
                    CustomInputtField(imageName: "phone", placeHolderText: "Mobile", text: $mobile)
                        .onAppear{
                            // binding to text field
                            self.mobile = user.mobile
                        }
                    
                    CustomInputtField(imageName: "location", placeHolderText: "Location", text: $location)
                        .onAppear{
                            // binding to text field
                            self.location = user.location
                        }
                    /*
                    CustomInputtField(imageName: "lock", placeHolderText: "Old Password", text: $password)
                    
                    CustomInputtField(imageName: "lock", placeHolderText: "New Password", text: $newPassword)
                    
                    CustomInputtField(imageName: "lock", placeHolderText: "Confirm Passrod", text: $newCmPassword)
                    
                    */
                }
                .padding(.horizontal,32)
                .padding(.top,44)
                
            }
            
            else{
            VStack(spacing : 20){
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email).disabled(true)
                
                CustomInputtField(imageName: "person", placeHolderText: "Usernmae", text: $username).disabled(true)
                
                CustomInputtField(imageName: "person.2.fill", placeHolderText: "Gender", text: $gender).disabled(true)
                
                CustomInputtField(imageName: "calendar", placeHolderText: "Date of Birth", text: $dob).disabled(true)
                
                CustomInputtField(imageName: "person", placeHolderText: "Name", text: $name).disabled(true)
                
                CustomInputtField(imageName: "phone", placeHolderText: "Mobile", text: $mobile)
                
                CustomInputtField(imageName: "location", placeHolderText: "Location", text: $location)
                /*
                CustomInputtField(imageName: "lock", placeHolderText: "Old Password", text: $password)
                
                CustomInputtField(imageName: "lock", placeHolderText: "New Password", text: $newPassword)
                
                CustomInputtField(imageName: "lock", placeHolderText: "Confirm Passrod", text: $newCmPassword)
                
                */
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            }
            
            HStack{
                Spacer()
            }
            Button{
                AuthViewModel.updateUser(withemail: email, username: username, gender: gender, birthDate: dob, name: name, mobile: mobile, location: location)
                
            } label : {
                Text("Update Account")
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
                ResetPasswordView()
                //mode.wrappedValue.dismiss()
            } label: {
                HStack{
                    Text("")
                        .font(.footnote)
                    Text("Reset / Change Password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    
                }
            }
            .padding()
            .foregroundColor(Color(.systemYellow))
            
            
            Button{
                AuthViewModel.signOut()
                mode.wrappedValue.dismiss()
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
            .foregroundColor(Color(.systemYellow))
            
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
