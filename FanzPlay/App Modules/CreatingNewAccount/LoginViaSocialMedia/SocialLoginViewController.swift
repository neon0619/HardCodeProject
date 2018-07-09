//
//  SocialLoginViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import GoogleSignIn

class SocialLoginViewController: UIViewController {
    
    private let className = "--- SocialLoginViewController: ------->>>"
    
    let logInViaFaceBook = LoginViaFacebook()
    let logInViaGoogle = LoginViaGoogle()
    
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
    
        logInViaGoogle.initiateGoogleLogin(uiViewController: self)
        
    }
    
    @objc func signInViaFacebook() {
        logInViaFaceBook.faceBookLogin { (fbParams) in
            
            self.userDataModel.postMethod(url: "http://54.68.7.104:88/api/user/registerexternal", params: fbParams)
        }
    }
    
    @objc func signInViaGoogle() {
        GIDSignIn.sharedInstance().signIn()
    }
    
    
    @objc func registerViaEmail() {
        print("Register Selected")
        
    }
    
    
    @objc func signInViaEmail() {
        print("Signin Selected")
    }
    
   

}
