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
    
    private var signedIn: Bool {
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
    
    public func registerFunc(email:String, password:String, confPassword:String, completion: @escaping (Bool)->Void){
        if(
            email.isEmpty ||
            password.isEmpty ||
            password.count < 8 ||
            password != confPassword)
        {
            completion(false)
            return
        }
        
        auth.createUser(withEmail: email, password: password){result, error in
            if(result == nil || error != nil){
                completion(false)
                return
            }
            
            completion(true)
        }
        
        
    }
}

