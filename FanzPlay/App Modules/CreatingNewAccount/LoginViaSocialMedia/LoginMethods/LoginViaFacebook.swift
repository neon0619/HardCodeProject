//
//  LoginViaFacebook.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import Firebase
//import FirebaseAuth
//import FirebaseMessaging

class LoginViaFacebook: UIViewController {
    
    private let className = "--- LoginViaFacebook: ------->>>"
    
    var email = ""
    var providerKey = ""
    var registrationToken = ""
    var externalLoginProvider = ""

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func faceBookLogin(postCompleted: @escaping (_ fbParams: [String : AnyObject]?) -> ()) {
        
        let fbLoginManager : LoginManager = LoginManager()
        
        if let currentAccessToken = FBSDKAccessToken.current(), currentAccessToken.appID != FBSDKSettings.appID() {
            fbLoginManager.logOut()
        }
        
        fbLoginManager.logIn(readPermissions: [.publicProfile], viewController : self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print("\(self.className) error --->> \(error)")
            case .cancelled:
                print("\(self.className) User cancelled login.")
            case .success( _, _, _):
                print("\(self.className) Logged in!")
                self.getFBUserData(postCompleted: { (fbUserData) in
                    postCompleted(fbUserData)
                })
                fbLoginManager.logOut()
            }
        }
    }
    
    func getFBUserData(postCompleted: @escaping (_ fbUserData: [String : AnyObject]?) -> ()) {
        
        if ConnectionDetector.isConnectedToNetwork() {
            
            guard let accessToken = FBSDKAccessToken.current() else {
                print("Failed to get access token")
                return
            }
            
            let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
            
            Auth.auth().signIn(with: credential, completion: { (user, error) in
                
                guard let currentUser = Auth.auth().currentUser else { return }
                
                switch true {
                case error != nil:
                    print("\(self.className) error!._code \(error!._code)")
                    self.handleError(error!)
                    return
                case currentUser.email == nil:
                    self.email = "\(String(describing: user!.displayName!.replacingOccurrences(of: " ", with: "")))@gmail.com"
                    print("\(self.className) currentUser.email is NIL")
                case user!.email == nil :
                    if currentUser.email != nil {
                        self.email = currentUser.email!
                    }else {
                        print("\(self.className) dictionary[email] && currentUser.email is NIL")
                    }
                case self.email == "" :
                    print("\(self.className) Login Failed. Please Relogin")
                default:
                    print("\(self.className) Default: Login Failed. Please Relogin")
                    break
                }
                
                print("\(self.className)--------->>>>>> FACEBOOK LOGIN SUCCESSFUL")
                
                let parameters = [
                    "Email": user!.email!,
                    "ProviderKey": user!.uid,
                    "RegistrationToken": insTanceIdToken,
                    "ExternalLoginProvider": "Facebook"
                ]
                
                postCompleted(parameters as [String : AnyObject])
                
                
            })
            
        }else {
            print("\(className) No Internet Connection")
        }
    }

}
