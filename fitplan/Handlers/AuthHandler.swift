//
//  AuthHandler.swift
//  fitplan
//
//  Created by user230748 on 5/14/23.
//

import Foundation
import FirebaseAuth

final class AuthHandler{
    
    static let shared = AuthHandler()
    public let auth = Auth.auth()
    
    init(){}
    
    public var signedIn: Bool {
        return auth.currentUser != nil
    }
    
    public func loginFunc(email:String, password:String, completion: @escaping (Bool)->Void){
        
        if(email.isEmpty || password.isEmpty){
            return
        }
        
        auth.signIn(withEmail: email, password: password) { result, error in
            if(result == nil && error != nil){
                completion(false)
                return
            }
            
            completion(true)
        }
    }
    
    public func logoutFunc(completion: (Bool)->Void){
        do{
            try auth.signOut()
            completion(true)
        }
        catch{
            print(error)
            completion(false)
        }
    }
    
    public func registerFunc(
        email: String,
        password: String,
        firstname: String,
        lastname: String,
        dob: TimeInterval,
        gender: String,
        completion: @escaping (Bool) -> Void
    ) {
        
        auth.createUser(withEmail: email, password: password) { authResult, error in
            guard authResult != nil, error == nil else {
                completion(false)
                return
            }
            
            guard let userid = authResult?.user.uid else {
                completion(false)
                print("No userid")
                return
            }
            
            let userData: [String:Any] = [
                "userid": userid,
                "firstname": firstname,
                "lastname": lastname,
                "dob": dob,
                "gender": gender
            ]
            
            FirebaseDBHandler.shared.addUser(user: userData, userid: userid) { success in
                
                guard success else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
            
        }
    }
}

