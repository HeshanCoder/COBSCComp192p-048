//
//  ResetPasswordView.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/17/22.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService{
    
    func fetchUser(withUid uid : String, completion : @escaping (User) -> Void){
        Firestore.firestore().collection("users")
            .document(uid)
            .getDocument { snapshot, _ in
                guard let snapshot = snapshot else{return}
                
                // creating user object by decording firebase data into UserModel
                guard let user = try? snapshot.data(as : User.self) else {return}
                
                print("DEBUG : Fetch user data  Username : \(user.username)")
                print("DEBUG : Fetch user data  Mobile : \(user.mobile)")
                
                completion(user)
            }
    }
}
