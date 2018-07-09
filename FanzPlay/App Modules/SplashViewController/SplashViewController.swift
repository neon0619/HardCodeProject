//
//  SplashViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/18/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import GoogleSignIn
import FirebaseAuth

class SplashViewController: UIViewController {
    
//    let reverseGeoCoder = ReverseGeoCoder()
    
    let userDefault = UserDefaults.standard.value(forKey: "isInitialLogin") as! String
    
    let className = "------SplashViewController---->>>"
    
    var googleUser: GIDGoogleUser = GIDGoogleUser()
    let delegate: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    
    // UIView for MainViewController
    lazy var viewController: UIView = {
        let viewView = UIView()
        viewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewView.backgroundColor = UIColor.lightGray
        return viewView
    }()
    
    
    // UIIMageView for Background
    lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.image = UIImage(named: "bg_splash")
        return imageView
    }()
    
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        
        // Get Reverse GeoLocation on the background
//        reverseGeoCoder.getReverseGeoLoc()
        
        if userDefault != "installed" {
            print("\(className) app initial install")
            self.showSocialLoginVC()
        }else {
            print("\(className) app already installed")
            NotificationCenter.default.addObserver(self, selector: #selector(checkCurrentUser), name: NSNotification.Name("GoogleSignInNotif"), object: nil)
            checkCurrentUser()
        }
    }
    
    @objc func checkCurrentUser() {
        print("\(className) checkCurrentUser() called")
        
        googleUser = delegate.googleUser
        
        if googleUser.userID != nil {
            print("\(self.className) User was already logged in \(googleUser.userID)")
            self.showMainVC()
        }else {
            print("\(self.className) User was NOT logged in \(googleUser.userID)")
            self.showSocialLoginVC()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        if FBSDKAccessToken.current() != nil {
//            print("\(className) Already LoggedIn ")
//        }
//        else {
//            print("\(className) Please Login")
//            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                self.showSocialLoginVC()
//            }
//        }
        
        GIDSignIn.sharedInstance().signInSilently()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
//            if user != nil {
//                if UserDefaults.standard.string(forKey: "uid") != nil && Auth.auth().currentUser != nil {
//                    print("\(self.className) user Already signedIn --->> \(String(describing: user))")
//                    self.showMainVC()
//
//                }else {
//                    print("\(self.className) No user is signed in --->> \(String(describing: user))")
//                    self.showSocialLoginVC()
//                }
//
//            }else {
//                print("\(self.className) user is NIL")
//                self.showSocialLoginVC()
//            }
//
//            UserDefaults.standard.setValue(user?.uid, forKeyPath: "uid")
//            print("\(self.className) userDefault \(UserDefaults.standard.setValue(user?.uid, forKeyPath: "uid"))")
            
//            Auth.auth().addStateDidChangeListener { (auth, user) in
//                if user != nil {
//                    if UserDefaults.standard.string(forKey: "uid") != nil && Auth.auth().currentUser != nil {
//                        //User was already logged in
//                        print("\(self.className) User was already logged in")
//                        self.showMainVC()
//                    }
//                    UserDefaults.standard.setValue(user?.uid, forKeyPath: "uid")
//                }else {
//                    print("\(self.className) User was NOT logged in")
//                    self.showSocialLoginVC()
//                }
//            }

            
//            if let user = user {
//                // User is signed in. Show home screen
//                print("\(self.className) user Already signedIn --->> \(String(describing: user))")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.showMainVC()
//                }
//
//            }else {
//                // No User is signed in. Show user the login screen
//                print("\(self.className) No user is signed in --->> \(String(describing: user))")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.showSocialLoginVC()
//                }
//            }
            
//            if Auth.auth().currentUser != nil {
//                // User is signed in.
//                print("\(self.className) user Already signedIn --->> \(String(describing: Auth.auth().currentUser))")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.showMainVC()
//                }
//            }else {
//                // No user is signed in.
//                print("\(self.className) No user is signed in --->> \(String(describing: Auth.auth().currentUser))")
//                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//                    self.showSocialLoginVC()
//                }
//
//            }
            
        }
        
    }
    
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
    }
    
    
    @objc func showSocialLoginVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("\(self.className) SocialLoginViewController called")
            let svc = SocialLoginViewController()
            svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    @objc func showMainVC() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            print("\(self.className) MainViewController called")
            let svc = MainViewController()
            svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(svc, animated: true, completion: nil)
        }
        
    }

}
