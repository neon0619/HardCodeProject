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
    
    let apiParser = ApiParser()
    let activityIndicator = ActivityIndicator()

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
        
        self.activityIndicator.show(uiView: selectedViewController)
        
        googleUser = delegate.googleUser
        
        email = googleUser.profile.email
        providerKey = googleUser.userID
        registrationToken = insTanceIdToken
        externalLoginProvider = "Google"
        
        externalLogin()
        GIDSignIn.sharedInstance().signOut()
    }
    
    func externalLogin() {
        
        let parameters = [
            "Email": self.email,
            "ProviderKey": self.providerKey,
            "RegistrationToken": self.registrationToken,
            "ExternalLoginProvider": self.externalLoginProvider
        ]
        print("\(self.className) GOOGLE LOGIN SUCCESSFUL")
        print("\(className) ----parameters---->>>>> \(parameters)")
        
        
        apiParser.request(url: "http://54.68.7.104:88/api/user/registerexternal", method: "POST", params: parameters as [String : AnyObject], myStruct: CurrentUser.self) { (postStruct) in
            if postStruct.Status == "Success" {
                print("\(self.className) status \(postStruct.Status!)")
                
                // Saving Id and Token to NSUserDefault
                let idToken: [String:String] = ["Id": (postStruct.Data?.Id)!, "Token": (postStruct.Data?.Token)!]
                UserDefaults.standard.setValue(idToken, forKey: "idToken")
                
                self.activityIndicator.stop(uiView: self)
                self.showMainVC(uiVC: self.selectedViewController)
            }else {
                print("\(self.className) status not yet done")
            }

        }
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
