//
//  SignInViewModel.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/13/22.
//

import SwiftUI
import Firebase

class SignInViewModel :  ObservableObject{
    // any view that use SignInViewModel can access this userSession because it is set as @Published
    @Published var userSession : Firebase.User?
    
    init(){
        self.userSession = Auth.auth().currentUser
        print("DEBUG: User session is \(self.userSession?.uid) \n\n")
    }
    
    func login(withemail email: String, password : String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: User signIn failed with error : \(error.localizedDescription) \n\n")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            
            print("DEBUG: User signin successfully \n\n")
        }
    }
    
    
    func register(withemail email: String, password : String, username : String,
                  gender : String , birthDate : String, name : String , mobile : String, location : String
    ){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: User registration failed with error : \(error.localizedDescription) \n\n")
                return
            }
            
            /*
             Google - In Swift, we use the guard statement to transfer program control out of scope when certain         conditions are not met. The guard statement is similar to the if statement with one major
             difference. The if statement runs when a certain condition is met. However, the guard
             statement runs when a certain condition is not met.
             */
            guard let user = result?.user else {return}
            self.userSession = user
            
            print("DEBUG: User Registered Successfully \n\n")
            print("DEBUG: User Register \(self.userSession) \n\n")
            
            let data = ["email" : email,
                        "username" : username.lowercased(),
                        "gender" : gender,
                        "birthDate" : birthDate,
                        "name" : name,
                        "mobile" : mobile,
                        "location" : location]
            
            Firestore.firestore()
                .collection("users")
                .document(user.uid)
                .setData(data) { _error in
                    // this is a completion function.
                    // TODO - handle errors
                    print("DEBUG: User data create successfully \n\n")
                    
                }
        }
        
    }
    func signOut(){
        self.userSession = nil
        try? Auth.auth().signOut()
    }
}
