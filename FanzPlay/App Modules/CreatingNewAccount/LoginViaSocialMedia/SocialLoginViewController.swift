//
//  SocialLoginViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import FacebookLogin
import FBSDKLoginKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import FirebaseMessaging

class SocialLoginViewController: UIViewController, GIDSignInUIDelegate {
    
    private let className = "--- SocialLoginViewController: ------->>>"
    
    var email = ""
    var provKey = ""
    var regToken = ""
    var logProv = ""
    
    // UIView for SocialLoginViewController
    lazy var viewController: UIView = {
        let viewView = UIView()
        viewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewView.backgroundColor = UIColor.darkGray
        return viewView
    }()
    
    // UIIMageView for Background
    lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.image = UIImage(named: "bg_main")
        return imageView
    }()
    
    // UIIMageView for FPLogo
    lazy var fpLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fp_logo")
        return imageView
    }()
    
    // UIImage for topLeftView
    lazy var topLeftLine: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    // UILabel for LblSignIn
    lazy var lblSignInWith: UILabel = {
        let label = UILabel()
        label.text = "SIGN IN WITH"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        return label
    }()
    
    // UIImage for topRightView
    lazy var topRightLine: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    // UIImage for imgFbLogo
    lazy var imgFbLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btn_icon_facebook")
        return imageView
    }()
    
    // UIButton for btnFacebook
    lazy var btnFacebook: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(hex: 0x3b5998)
        button.setTitle("Sign In with Facebook", for: .normal)
        button.addTarget(self, action: #selector(signInViaFacebook), for: .touchUpInside)
        return button
    }()
    
    // UIImage for imgGoogleLogo
    lazy var imgGoogleLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "btn_icon_google")
        return imageView
    }()
    
    // UIButton for btnGoogle
    lazy var btnGoogle: UIButton! = {
        let button = UIButton()
        button.backgroundColor = UIColor.white
        button.setTitle("Sign In with Google+", for: .normal)
        button.setTitleColor(UIColor(hex: 0x3C3B3A), for: .normal)
        button.addTarget(self, action: #selector(signInViaGoogle), for: .touchUpInside)
        return button
    }()
    
    // UIImage for botLeftView
    lazy var botLeftLine: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    // UILabel for LblSignIn
    lazy var lblOR: UILabel = {
        let label = UILabel()
        label.text = "OR"
        label.adjustsFontSizeToFitWidth = true
        label.textColor = UIColor.white
        return label
    }()
    
    // UIImage for botRightView
    lazy var botRightLine: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    // UIButton for btnRegister
    lazy var btnRegister: UIButton = {
        let button = UIButton()
        button.setTitle("Register with Email", for: .normal)
        button.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(registerViaEmail), for: .touchUpInside)
        return button
    }()
    
    // UIButton for btnSignIn
    lazy var btnSignIn: UIButton = {
        let button = UIButton()
        button.titleLabel!.font = UIFont(name: "OpenSans", size: 5)
        button.setTitle("Already have an Account? Sign In", for: .normal)
        button.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(signInViaEmail), for: .touchUpInside)
        return button
    }()
    
    // UIImage for btnSignInUnderLine
    lazy var btnSignInUnderLine: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor.white
        return imageView
    }()
    
    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SOCIALLOGINVIEW.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    
    // Configure frames method
    func uiConfigSocialLoginSetup(loginRects: [String: Array<CGRect>]) {
        fpLogo.frame                = loginRects["fpLogo"]![0]
        
        topLeftLine.frame           = loginRects["topLineView"]![0]
        lblSignInWith.frame         = loginRects["topLineView"]![1]
        topRightLine.frame          = loginRects["topLineView"]![2]
        
        imgFbLogo.frame             = loginRects["midBtnView"]![0]
        btnFacebook.frame           = loginRects["midBtnView"]![1]
        imgGoogleLogo.frame         = loginRects["midBtnView"]![2]
        btnGoogle.frame             = loginRects["midBtnView"]![3]
        
        botLeftLine.frame           = loginRects["botLineView"]![0]
        lblOR.frame                 = loginRects["botLineView"]![1]
        botRightLine.frame          = loginRects["botLineView"]![2]
        
        btnRegister.frame           = loginRects["btnRegister"]![0]
        
        btnSignIn.frame             = loginRects["signInView"]![0]
        btnSignInUnderLine.frame    = loginRects["signInView"]![1]
    }
    
    
    // Initiate all the SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(fpLogo)
        view.addSubview(topLeftLine)
        view.addSubview(lblSignInWith)
        view.addSubview(topRightLine)
        view.addSubview(imgFbLogo)
        view.addSubview(btnFacebook)
        view.addSubview(imgGoogleLogo)
        view.addSubview(btnGoogle)
        view.addSubview(botLeftLine)
        view.addSubview(lblOR)
        view.addSubview(botRightLine)
        view.addSubview(btnRegister)
        view.addSubview(btnSignIn)
        view.addSubview(btnSignInUnderLine)
    }
    
    let userDataModel = UserDataModel()
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        sortUIByDeviceType()
        
        userDataModel.postMethod(url: "http://54.68.7.104:88/api/user/registerexternal", email: "", providerKey: "", registrationToken: "", loginProvider: "")
        
    }
    
    @objc func signInViaFacebook() {
        
        print("\(className) signInViaFacebook triggered")
        
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
                self.getFBUserData()
                fbLoginManager.logOut()
            }
        }
    }
    
    func getFBUserData() {
        
        if ConnectionDetector.isConnectedToNetwork() {
//            FBSDKLoginManager().logIn(withReadPermissions: ["public_profile", "email"], from: self) { (result, error) in
            
                FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                    
                    let dictionary = result as! NSDictionary
                    guard let currentUser = Auth.auth().currentUser else { return }
                    
                    switch true {
                    case error != nil:
                        print("\(self.className) error!._code \(error!._code)")
                        self.handleError(error!)
                        return
                    case currentUser.email == nil:
                        self.email = "\(String(describing: dictionary["last_name"]!))\(String(describing: dictionary["first_name"]!))@gmail.com"
                        print("\(self.className) currentUser.email is NIL")
                    case dictionary["email"] == nil :
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
                    
                    print("\(self.className)--------->>>>>> FACEBOOK LOGIN SUCCESSful")
                    
                    self.email = dictionary["email"] as! String
                    self.provKey = dictionary["id"] as! String
                    self.regToken = insTanceIdToken
                    self.logProv = "Facebook"
                    
                    print("\(self.className) email == \(self.email), provKey == \(self.provKey), regToken == \(self.regToken), logProv == \(self.logProv)")
                    
                })
                
//                guard let accessToken = FBSDKAccessToken.current() else {
//                    print("Failed to get access token")
//                    return
//                }
                
//                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.tokenString)
                
                // Perform login by calling Firebase APIs
//                Auth.auth().signIn(with: credential, completion: { (user, error) in
//
//                    print("\(self.className) fbApp triggered")
//
//                    if let error = error {
//                        print("Login error: \(error.localizedDescription)")
//                        let alertController = UIAlertController(title: "Login Error", message: error.localizedDescription, preferredStyle: .alert)
//                        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
//                        alertController.addAction(okayAction)
//                        self.present(alertController, animated: true, completion: nil)
//
//                        return
//                    }
//
//                    // Present the main view
//                    //                if let viewController = self.storyboard?.instantiateViewController(withIdentifier: "MainView") {
//                    //                    UIApplication.shared.keyWindow?.rootViewController = viewController
//                    //                    self.dismiss(animated: true, completion: nil)
//                    //                }
//
//
//                })
//            }
            
        }else {
            print("\(className) No Internet Connection")
        }
        
    }
    
    
    @objc func signInViaGoogle(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!, withError error: Error!) {
        
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().signIn()
        
        if error != nil {
            
            return
        }
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        print("credentials --->>> \(credential)")
        
        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if error != nil {
                // ...
                return
            }
            print("authResult ---->>> \(String(describing: authResult))")
        }
    }
    
    @objc func registerViaEmail() {
        print("Register Selected")
    }
    
    
    @objc func signInViaEmail() {
        print("Signin Selected")
    }
    
    
    
    @objc func signOut() {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
    }


}
