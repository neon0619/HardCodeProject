//
//  SponsorViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/19/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SponsorViewController: UIViewController {
    
    
//    @IBOutlet weak var imgBg: UIImageView!
//    @IBOutlet weak var lblDesc: UILabel!
//    @IBOutlet weak var rewardCollectionView: UICollectionView!
//    @IBOutlet weak var imgLogo: UIImageView!
//    @IBOutlet weak var btnMain: UIButton!
    
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
    
    // UiLabel for lblTitle
    lazy var lblTitle: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "FANz are playing for a reward from one of these great brands:"
        lblLabel.textColor = UIColor.white
        lblLabel.textAlignment = .center
        lblLabel.contentMode = .scaleToFill
        lblLabel.numberOfLines = 4
        lblLabel.adjustsFontSizeToFitWidth = true
        lblLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        return lblLabel
    }()
    
    // UICollectionView for SponsorList
    lazy var cvSponsors: UICollectionView = {
        let collView = UICollectionView()
        
        collView.scrollDi
        
        return collView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        sortUIByDeviceType()
    }
    
    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    // Configure frames method
    func uiConfigMainVcSetup(loginRects: [String: Array<CGRect>]) {
        
        lblTitle.frame              = loginRects["lblTitle"]![0]
//        cvSponsors.frame              = loginRects["cvSponsors"]![0]
//        fpLogo.frame                = loginRects["fpLogo"]![0]
//        btnMainMenu.frame           = loginRects["btnMainMenu"]![0]
    
        
    }
    
    
    // Initiate all the SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(lblTitle)
    }
    
    

}
