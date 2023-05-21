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
            guard result != nil && error == nil else {
                completion(false)
                return
            }

            UserDefaults.standard.set(result?.user.uid, forKey: "userid")
            completion(true)
        }
    }
    
    public func logoutFunc(completion: (Bool)->Void){
        do{
            try auth.signOut()
            UserDefaults.standard.removeObject(forKey: "level")
            UserDefaults.standard.removeObject(forKey: "goal")
            UserDefaults.standard.removeObject(forKey: "equipment")
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
        user: UserModel,
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
                "dob": Date(timeIntervalSince1970: user.dob),
                "equipment": user.equipment,
                "firstname": user.firstName,
                "lastname": user.lastName,
                "gender": user.gender,
                "goal": user.goal,
                "height": user.height,
                "weight": user.weight,
                "level": user.level,
                "userid": userid
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

