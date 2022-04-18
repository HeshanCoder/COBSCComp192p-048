//
//  ResetPasswordView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/17/22.
//

import SwiftUI

struct ResetPasswordView: View {
    @State private var email = ""
    @State private var errorString :String?
    @State private var showAlert : Bool = false
    @Environment(\.presentationMode) var presentationModesn
    @EnvironmentObject var viewModel : SignInViewModel
    
    var body: some View {
        VStack{
            
            // Header View
            VStack(alignment: .leading){
                HStack{Spacer()}
                
                Button{
                    self.presentationModesn.wrappedValue.dismiss()
                    
                }label:{
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 20 , height: 16)
                        .foregroundColor(.black)
                        .offset(x: 1, y: 12)
                }
                //Text("Hello")
                  //  .font(.largeTitle)
                   // .fontWeight(.semibold)
                
                Text("Reset Password")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            }
            .frame(height:260)
            .padding(.leading)
            .background(.white)
            .foregroundColor(.black)
            
            VStack(spacing : 40){
                CustomInputtField(imageName: "envelope", placeHolderText: "Email", text: $email)
                
            }
            .padding(.horizontal,32)
            .padding(.top,44)
            
            HStack{
                Spacer()
                
                
                
            }
            Button{
                viewModel.resetPassword(email: email){ (result) in
                    switch result {
                    case .failure(let error) :
                        self.errorString = error.localizedDescription
                        print("DEBUG : Reset password error \(error) ")
                    case .success( _):
                        print("DEBUG : Reset password succesfull ")
                        break
                    }
                    self.showAlert = true
                }
            } label : {
                Text("Reset Password")
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
            } label: {
                HStack{
                    Text("Dont have an account? ")
                        .font(.footnote)
                    Text("Sign Up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }
            .padding(.bottom,70)
            .foregroundColor(Color(.systemYellow))
        }
        .ignoresSafeArea()
        .navigationBarHidden(true)
        .alert(isPresented: $showAlert){
            Alert(title: Text("Password Reset"),
                  message: Text(self.errorString ?? "Password Reset Successfully! Check your email.."), dismissButton: .default(Text("OK")){
                self.presentationModesn.wrappedValue.dismiss()
            })
        }
    }
}
struct ResetPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPasswordView()
    }
}
