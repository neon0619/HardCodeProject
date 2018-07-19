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
    
    let className = "------SplashViewController---->>>"
    
//    let reverseGeoCoder = ReverseGeoCoder()
    
    let userDefault = UserDefaults.standard.value(forKey: "isInitialLogin") as! String
    var googleUser: GIDGoogleUser = GIDGoogleUser()
    let delegate: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    let apiParser = ApiParser()
    let alertDialog = AlertDialogs()
    
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
        
        // Check app if Currently Installed
        if userDefault != "installed" {
            self.showSocialLoginVC()
        }else {
            NotificationCenter.default.addObserver(self, selector: #selector(checkCurrentUser), name: NSNotification.Name("GoogleSignInNotif"), object: nil)
            checkCurrentUser()
            
        }
    }
    
    
    // Check User if Currently LoggedIn
    @objc func checkCurrentUser() {
        print("\(className) checkCurrentUser() called")
        if UserDefaults.standard.value(forKey: "idToken") != nil {
            getCurrentUserDetails()
            print("\(className) idToken is NOT nil")
        }else {
            showSocialLoginVC()
            print("\(className) idToken is nil")
        }
    }
    
    @objc func getCurrentUserDetails() {
        
        apiParser.request(url: baseApiUrl+"api/user/getuserdetails", method: "GET", params: [String : AnyObject](), myStruct: CurrentUser.self) { (postStruct) in
            
            switch postStruct.Status {
            case "Success":
                print("\(self.className) status \(postStruct.Status!)")
                self.showMainVC()
            case "Error":
                print("\(self.className) errMessage \(postStruct.Message![0])")
                self.alertDialog.showAlertDialog(title: "FanzPlay", msg: postStruct.Message![0], viewController: self)
            default:
                self.alertDialog.showAlertDialog(title: "FanzPlay", msg: "Fetching details failed. Please try again.", viewController: self)
            }
            
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            print("\(self.className) MainViewController called")
            let svc = MainViewController()
            svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            self.present(svc, animated: true, completion: nil)
        }
        
    }

}
