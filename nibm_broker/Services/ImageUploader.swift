//
//  ImageUploader.swift
//  nibm_broker
//
//  Created by HeshanHH on 4/16/22.
//

import Firebase
import UIKit

struct ImageUploader{
    
    // common function to upoad an image to firebase and then get back the image URL.
    static func uploadImage(image : UIImage ,completion : @escaping (String) -> Void){
        // compressionQuality: 0.5 is to cut the image quality by half from its own.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        
        //create a filename and create a bucket in firestore with filename and the folder
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/item_image/\(filename)")
        
        ref.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG : Faild to upload image with error \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { imageURL, _ in
                guard let imageURL = imageURL?.absoluteString else {return}
                completion(imageURL)
            }
        }
        
    }
}
