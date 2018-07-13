//
//  LoginViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
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
    
    
    // UIIMageView for FPLogo
    lazy var fpLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fp_logo")
        return imageView
    }()
    
    // UIButton for BackArrow
    lazy var btnBack: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 8, y: 20, width: 30, height: 50)
        btn.setImage(UIImage(named: "btn_white_back_arrow"), for: .normal)
        btn.imageView?.contentMode = .scaleToFill
        btn.addTarget(self, action: #selector(dismissLogin), for: .touchUpInside)
        return btn
    }()
    
    // UiLabel for lblSignInWithEmail
    lazy var lblSignInWithEmail: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "Sign in with email"
        lblLabel.textColor = UIColor.white
        lblLabel.textAlignment = .center
        lblLabel.font = UIFont(name: "HelveticaNeue", size: 20)
        return lblLabel
    }()
    
    
    // UILabel for lblError
    lazy var lblError: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "The username and password you entered did not match our records. Please double check and try again."
        lblLabel.textColor = UIColor.red
        lblLabel.textAlignment = .center
        lblLabel.font = UIFont(name: "HelveticaNeue", size: 10)
        return lblLabel
    }()
    
    // UIView for EmailAddressWrapper
    lazy var viewEmailAddress: UIView  = {
        let viewView = UIView()
        return viewView
    }()
    
    
    // UIIMageView for imgEmailIcon
    lazy var imgEmailIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_email")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // UITextField for emailAddress
    lazy var txtEmailAdd: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Email Address"
        txtField.text = "Email Address"
        txtField.textColor = UIColor.white
        txtField.font = UIFont(name: "HelveticaNeue-ThinItalic", size: 15)
        return txtField
    }()
    
    
    // UIIMageView for imgEmailIcon
    lazy var imgEmailErrorIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_error")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // UIView for EmailLineView
    lazy var viewLineEmail: UIView  = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.white
        return viewView
    }()
    
    
    // UIView for PasswordWrapper
    lazy var viewPassword: UIView  = {
        let viewView = UIView()
        return viewView
    }()
    
    
    // UIIMageView for imgPasswordIcon
    lazy var imgPasswordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_password")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // UITextField for txtPassword
    lazy var txtPassword: UITextField = {
        let txtField = UITextField()
        txtField.placeholder = "Password"
        txtField.text = "Password"
        txtField.textColor = UIColor.white
        txtField.font = UIFont(name: "HelveticaNeue-ThinItalic", size: 15)
        return txtField
    }()
    
    
    // UIIMageView for imgPasswordIcon
    lazy var imgShowPasswordIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_show_password")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    // UIView for ViewPasswordLine
    lazy var viewLinePassword: UIView  = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.white
        return viewView
    }()
    
    
    // UIButton for btnForgotPass
    lazy var btnForgotPass: UIButton = {
        let button = UIButton()
        button.setTitle("Forgot Password", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.contentHorizontalAlignment = .right
        
        //        button.addTarget(self, action: #selector(closeGameRules), for: .touchUpInside)
        return button
    }()

    // UIButton for btnLogin
    lazy var btnLogin: UIButton = {
        let button = UIButton()
        button.setTitle("LOGIN", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue-Medium", size: 20)

        //        button.addTarget(self, action: #selector(closeGameRules), for: .touchUpInside)
        return button
    }()
    
    
    // UIButton for btnForgotPass
    lazy var btnCreateAccount: UIButton = {
        let button = UIButton()
        button.setTitle("Create and account? Register", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 12)
        button.contentHorizontalAlignment = .right
        
        //        button.addTarget(self, action: #selector(closeGameRules), for: .touchUpInside)
        return button
    }()
    
    // UIView for viewCreateAccountLine
    lazy var viewCreateAccountLine: UIView  = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.white
        return viewView
    }()

    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigSocialLoginSetup(loginRects: VIEW_CONFIG_SIGNINEMAILVIEW.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    
    // Configure frames method
    func uiConfigSocialLoginSetup(loginRects: [String: Array<CGRect>]) {
        
        btnBack.frame             = loginRects["btnBack"]![0]
        fpLogo.frame              = loginRects["fpLogo"]![0]
        
        lblSignInWithEmail.frame  = loginRects["signInWith"]![0]
        lblError.frame            = loginRects["lblError"]![0]
        
        viewEmailAddress.frame       = loginRects["emailAddView"]![0]
        imgEmailIcon.frame           = loginRects["emailAddView"]![1]
        txtEmailAdd.frame            = loginRects["emailAddView"]![2]
        imgEmailErrorIcon.frame      = loginRects["emailAddView"]![3]
        viewLineEmail.frame          = loginRects["emailAddView"]![4]

        viewPassword.frame           = loginRects["passWordView"]![0]
        imgPasswordIcon.frame        = loginRects["passWordView"]![1]
        txtPassword.frame            = loginRects["passWordView"]![2]
        imgShowPasswordIcon.frame    = loginRects["passWordView"]![3]
        viewLinePassword.frame       = loginRects["passWordView"]![4]

        btnForgotPass.frame         = loginRects["forgotPassword"]![0]
        btnLogin.frame               = loginRects["btnLogin"]![0]

        btnCreateAccount.frame      = loginRects["btnCreateRegister"]![0]
        viewCreateAccountLine.frame        = loginRects["btnCreateRegister"]![1]
        

    }
    
    
    // Initiate all the SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(fpLogo)
        view.addSubview(btnBack)
        view.addSubview(lblSignInWithEmail)
        
        view.addSubview(viewEmailAddress)
        viewEmailAddress.addSubview(imgEmailIcon)
        viewEmailAddress.addSubview(txtEmailAdd)
        viewEmailAddress.addSubview(viewLineEmail)
        viewEmailAddress.addSubview(imgEmailErrorIcon)
        
        view.addSubview(viewPassword)
        viewPassword.addSubview(imgPasswordIcon)
        viewPassword.addSubview(txtPassword)
        viewPassword.addSubview(viewLinePassword)
        viewPassword.addSubview(imgShowPasswordIcon)
        
        view.addSubview(btnForgotPass)
        view.addSubview(btnLogin)
        view.addSubview(btnCreateAccount)
        view.addSubview(viewCreateAccountLine)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        sortUIByDeviceType()
    }
    
    
    @objc func dismissLogin() {
        self.dismiss(animated: true, completion: nil)
    }

}
