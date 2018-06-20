//
//  SocialLoginViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SocialLoginViewController: UIViewController {
    
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
        imageView.canPerformAction(#selector(sortUIByDeviceType), withSender: self)
        return imageView
    }()

    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        
        sortUIByDeviceType()
        
    }
    
    // Initiate all he SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(fpLogo)
    }
    
    @objc func sortUIByDeviceType() {
        
        print("run function ---> sortUIByDeviceType")
        
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
    
    func uiConfigSocialLoginSetup(loginRects: [String: Array<CGRect>]) {
        fpLogo.frame             = loginRects["fpLogo"]![0]

//        topLineView.frame           = loginRects["topLineView"]![0]
//        topLeftLine.frame           = loginRects["topLineView"]![1]
//        lblSignInWith.frame         = loginRects["topLineView"]![2]
//        topRightLine.frame          = loginRects["topLineView"]![3]
//
//        midBtnView.frame            = loginRects["midBtnView"]![0]
//        imgFbLogo.frame             = loginRects["midBtnView"]![1]
//        btnFacebook.frame           = loginRects["midBtnView"]![2]
//        imgGoogleLogo.frame         = loginRects["midBtnView"]![3]
//        btnGoogle.frame             = loginRects["midBtnView"]![4]
//        //        grayButton.frame            = loginRects["midBtnView"]![5]
//        grayButton.isHidden = true
//
//        botLineView.frame           = loginRects["botLineView"]![0]
//        botLeftLine.frame           = loginRects["botLineView"]![1]
//        lblOR.frame                 = loginRects["botLineView"]![2]
//        botRightLine.frame          = loginRects["botLineView"]![3]
//
//        btnRegister.frame           = loginRects["btnRegister"]![0]
//
//        btnSignIn.frame             = loginRects["signInView"]![0]
//        btnSignInUnderLine.frame    = loginRects["signInView"]![1]
    }

}
