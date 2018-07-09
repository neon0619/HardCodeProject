//
//  LoginViaGoogle+.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
//import Firebase
//import FirebaseAuth
import GoogleSignIn


class LoginViaGoogle: UIViewController, GIDSignInUIDelegate {
    
    private let className = "--- LoginViaGoogle: ------->>>"
    
    var googleUser: GIDGoogleUser = GIDGoogleUser()
    let delegate: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    var selectedViewController = UIViewController()
    
    var email = ""
    var providerKey = ""
    var registrationToken = ""
    var externalLoginProvider = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    func initiateGoogleLogin(uiViewController: UIViewController) {
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // GoogleSignIn Observer
        NotificationCenter.default.addObserver(self, selector: #selector(googleSignIn), name: NSNotification.Name("GoogleSignInNotif"), object: nil)
        selectedViewController = uiViewController
    }
    
    @objc func googleSignIn() {
        
        googleUser = delegate.googleUser
        
        email = googleUser.profile.email
        providerKey = googleUser.userID
        registrationToken = insTanceIdToken
        externalLoginProvider = "Google"
        
        externalLogin()
        GIDSignIn.sharedInstance().signOut()
        
    }
    
    func externalLogin() {
        
        // Put Progress Dialog Here
        
        let parameters = [
            "Email": self.email,
            "ProviderKey": self.providerKey,
            "RegistrationToken": self.registrationToken,
            "ExternalLoginProvider": self.externalLoginProvider
        ]
        print("\(self.className) GOOGLE LOGIN SUCCESSFUL")
        print("\(className) ----parameters---->>>>> \(parameters)")
        showMainVC(uiVC: selectedViewController)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @objc func showMainVC(uiVC: UIViewController) {
        // put viewController Params on postCompleted Google Signin
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            print("\(self.className) MainViewController called")
            let svc = MainViewController()
            svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            uiVC.present(svc, animated: true, completion: nil)
        }
    }


}
