//
//  ViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import FirebaseAuth
import FacebookLogin
import GoogleSignIn


class MainViewController: UIViewController, GIDSignInUIDelegate {
    
    private let className = "--- MainViewController: ------->>>"
    
    
    let sideMenu = SideMenu()
    var isSideMenuOpen = false

    
    // UIView for MainViewController
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
        imageView.image = UIImage(named: "bg_splash")
        return imageView
    }()
    
    // ShadowImage for SideView is Open
    lazy var shadowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        imageView.isHidden = true
        return imageView
    }()

    // UIButton for BurgerMenu
    lazy var menuBtn: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 8, y: 20, width: 50, height: 50)
        btn.setImage(UIImage(named: "burger_menu"), for: .normal)
        btn.imageView?.contentMode = UIViewContentMode.scaleToFill
        btn.addTarget(self, action: #selector(toggleSideMenu), for: .touchUpInside)
        return btn
    }()
    
    // UIIMageView for FPLogo
    lazy var fpLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fp_logo")
        return imageView
    }()
    
    // UIButton for Play
    lazy var btnPlay: UIButton = {
        let button = UIButton()
        button.setTitle("Play", for: .normal)
        button.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.backgroundColor = UIColor(hex: 0x00133D)
        button.layer.cornerRadius = 3.5
        button.layer.borderWidth = 1.1
        button.layer.borderColor = UIColor.white.cgColor
        button.addTarget(self, action: #selector(play), for: .touchUpInside)
        return button
    }()
    
    // UIButton for GameRules
    lazy var btnGameRules: UIButton = {
        let button = UIButton()
        button.setTitle("Game Rules", for: .normal)
        button.setTitleColor(UIColor(hex: 0x55C40E), for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(openGameRules), for: .touchUpInside)
        return button
    }()
    
    // UIButton for Terms and Privacy Policy
    lazy var btnTermPolicy: UIButton = {
        let button = UIButton()
        button.setTitle("Terms and Privacy Policy", for: .normal)
        button.setTitleColor(UIColor(hex: 0xFFFFFF), for: .normal)
        button.titleLabel!.adjustsFontSizeToFitWidth = true
        button.addTarget(self, action: #selector(showTermsAndPrivacy), for: .touchUpInside)
        return button
    }()
    
    
    // UIView for GameRulesView
    lazy var viewGamerules: UIView = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor(hex: 0x2F2F2F).withAlphaComponent(0.95)
        viewView.isHidden = true
        return viewView
    }()
    
    // UILabel for GameRulesView
    lazy var lblGameRules: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "Game Rules"
        lblLabel.textColor = UIColor(hex: 0x55C40E)
        return lblLabel
    }()
    
    // UIButton for GameRules close Popup
    lazy var btnClosePopUp: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "btn_icon_close_white"), for: .normal)
        button.addTarget(self, action: #selector(closeGameRules), for: .touchUpInside)
        return button
    }()
    
    // UITextView for GameRules
    lazy var txtVRulesContent: UITextView = {
        let txtView = UITextView()
        txtView.backgroundColor = UIColor.clear
        txtView.textColor = UIColor.white
        txtView.font = UIFont(name: "Helvetica", size: 11)
        txtView.isEditable = false
        txtView.isSelectable = false
        txtView.text = "Rival Mode :\n\nThe Fanzplay® Rival mode is played either live (on-location) or remotely (in your home or anywhere) over a number of rounds set by the admin.\nThe user must select the team they want to play for.\nFor the on-location game play, the Jumbotron will display details that Fanzplay® game is about to commence.\nFor the remote players, upon selecting the team to play, event details such as event name, location, date, and time can be seen on the device screen. They will be notified that a game is about to start.\nPoints are added to the team with correct answer and is calculated each round.\nThe winner is determined upon the computed average score of the correct answer over the number of users playing on each round.\n\nNote: The winner is determined by the number questions correctly answered by all the users playing on particular team.\n\n\nElimination Game:\nThe Fanzplay® Elimination mode is played live on the event location. It is triggered when the device detects that the user is on the radius of event location.\nThe user must answer number of questions set by the admin correctly to proceed to another round. If fail to do so, he/she will be eliminated from the game.\nWinners are determined by a points system, which is based from the number of questions correctly answered and the speed of answering those questions.\n\n* Apple, Apple Trademark and Apple Logo is NOT affiliated with any contest nor rewards within the FanzPlay app."
        return txtView
    }()
    
    
    // UIView for Wrapper Rewards
    lazy var viewRewards: UIView = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.clear
        viewView.layer.borderWidth = 2.0
        viewView.layer.borderColor = UIColor.gray.cgColor
        viewView.layer.cornerRadius = 7.0
        return viewView
    }()
    
    // UIIMageView for Wrapper Rewards
    lazy var imgRewardsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_rewards")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // UILabel for Wrapper Rewards
    lazy var lblRewards: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "Rewards"
        lblLabel.textColor = UIColor.white
        lblLabel.textAlignment = .center
        lblLabel.font = UIFont(name: "HelveticaNeue", size: 15)

        return lblLabel
    }()

    

    
    // UIView for Wrapper Stats
    lazy var viewStats: UIView = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.clear
        viewView.layer.borderWidth = 2.0
        viewView.layer.borderColor = UIColor.gray.cgColor
        viewView.layer.cornerRadius = 7.0
        return viewView
    }()
    
    // UIIMageView for Wrapper Stats
    lazy var imgStatsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "icon_stats")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // UILabel for Wrapper Stats
    lazy var lblStats: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "Stats"
        lblLabel.textColor = UIColor.white
        lblLabel.textAlignment = .center
        lblLabel.font = UIFont(name: "HelveticaNeue", size: 15)
        return lblLabel
    }()
    
    
    // Set initial Theme base on Device Location
    @objc func setInitialTheme() {
        
    }
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        sortUIByDeviceType()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
        viewController.addGestureRecognizer(tap)
        
        // SignOut Observer
        NotificationCenter.default.addObserver(self, selector: #selector(signOut), name: NSNotification.Name("triggerSignOut"), object: nil)
        
        // Open RewardsViewController
        let rewardsGesture = UITapGestureRecognizer(target: self, action: #selector(showRewardsVC))
        viewRewards.addGestureRecognizer(rewardsGesture)
        
        // Open StatsViewController
        let statsGesture = UITapGestureRecognizer(target: self, action: #selector(showStatsVC))
        viewStats.addGestureRecognizer(statsGesture)
        
        print("\(className) view == \(self.view.frame.width)")
        print("\(className) rect/2 == \((self.view.frame.width / 2))")
        print("\(className) rect == \((self.view.frame.width / 2) - 80)")
        print("\(className) CurrentUser)")
        
    }
    
    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_EXLOGINVIEW.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    // Configure frames method
    func uiConfigMainVcSetup(loginRects: [String: Array<CGRect>]) {
        
        fpLogo.frame                = loginRects["fpLogo"]![0]
        btnPlay.frame               = loginRects["btnPlay"]![0]
        btnGameRules.frame          = loginRects["btnGameRules"]![0]
        btnTermPolicy.frame         = loginRects["btnTermsPolicy"]![0]
        
        viewRewards.frame           = loginRects["viewRewards"]![0]
        imgRewardsIcon.frame        = loginRects["viewRewards"]![1]
        lblRewards.frame            = loginRects["viewRewards"]![2]
        
        viewStats.frame             = loginRects["viewStats"]![0]
        imgStatsIcon.frame          = loginRects["viewStats"]![1]
        lblStats.frame              = loginRects["viewStats"]![2]
        
        viewGamerules.frame         = loginRects["gameRules"]![0]
        lblGameRules.frame          = loginRects["gameRules"]![1]
        btnClosePopUp.frame         = loginRects["gameRules"]![2]
        txtVRulesContent.frame      = loginRects["gameRules"]![3]
        
    }
    
    
    // Initiate all the SubViews
    private func initiateSubViews() {
        
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(menuBtn)
        view.addSubview(fpLogo)
        view.addSubview(btnPlay)
        
        view.addSubview(viewRewards)
        viewRewards.addSubview(imgRewardsIcon)
        viewRewards.addSubview(lblRewards)
        
        view.addSubview(viewStats)
        viewStats.addSubview(imgStatsIcon)
        viewStats.addSubview(lblStats)
        
        view.addSubview(viewGamerules)
        viewGamerules.addSubview(lblGameRules)
        viewGamerules.addSubview(btnClosePopUp)
        viewGamerules.addSubview(txtVRulesContent)
        
        view.addSubview(btnGameRules)
        view.addSubview(btnTermPolicy)
        
        view.addSubview(shadowImage)
        view.addSubview(sideMenu.viewController)
        view.addSubview(sideMenu.sideMenuTable)
        view.addSubview(sideMenu.titleLbl)
    
    }
    
    // Toggle SideMenu
    @objc func toggleSideMenu() {
        UIView.animate(withDuration: 0.48) {
            if self.isSideMenuOpen {
                self.isSideMenuOpen = false
                print("Hide SideMenu")
                self.shadowImage.isHidden = true
                self.sideMenu.hideSideMenuDown()
            }else {
                self.isSideMenuOpen = true
                print("Show SideMenu")
                self.shadowImage.isHidden = false
                self.sideMenu.showSideMenuUp()
            }
            self.view.layoutIfNeeded()
        }
    }
    
    // Hide SideMenu when touch outside
    @objc func hideSideMenu() {
        UIView.animate(withDuration: 0.40) {
            if self.isSideMenuOpen {
                self.isSideMenuOpen = false
                print("Hide SideMenu")
                self.shadowImage.isHidden = true
                self.sideMenu.hideSideMenuDown()
            }
        }
    }
    
    
    @objc func showRewardsVC() {
        print("\(className) Open Rewards VC")
    }
    
    @objc func showStatsVC() {
        print("\(className) Open Stats VC")
    }
    
    
    @objc func openGameRules() {
        UIView.animate(withDuration: 0.30) {
            self.view.bringSubview(toFront: self.viewGamerules)
            self.shadowImage.isHidden = false
            self.viewGamerules.isHidden = false
            self.menuBtn.isUserInteractionEnabled = false
        }
    }
    
    @objc func closeGameRules() {
        UIView.animate(withDuration: 0.30) {
            self.shadowImage.isHidden = true
            self.viewGamerules.isHidden = true
            self.menuBtn.isUserInteractionEnabled = true
        }
    }
    
    @objc func play() {
        print("\(className) play triggered")
    }
    
    
    @objc func showTermsAndPrivacy() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            let svc = TermsAndPrivacyViewController()
            svc.modalTransitionStyle = .coverVertical
            self.present(svc, animated: true, completion: nil)
        }
    }
    
    @objc func signOut() {
        hideSideMenu()
        
        print("\(className) signOut called")
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        GIDSignIn.sharedInstance().signOut()
        LoginManager().logOut()
        UserDefaults.standard.setValue(nil, forKey: "idToken")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            let svc = SocialLoginViewController()
            svc.modalTransitionStyle = .crossDissolve
            self.present(svc, animated: true, completion: nil)
        }
        
    }

    
}

