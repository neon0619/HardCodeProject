//
//  SplashViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/18/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    
//    let reverseGeoCoder = ReverseGeoCoder()
    
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.showMainVC()
        }
    }
    
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
    }
    
    
    @objc func showMainVC() {
        let svc = MainViewController()
        svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
        self.present(svc, animated: true, completion: nil)
    }

}
