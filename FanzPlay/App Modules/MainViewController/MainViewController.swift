//
//  ViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit


class MainViewController: UIViewController {
    
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
    
    
    // Set initial Theme base on Device Location
    @objc func setInitialTheme() {
        
    }
    
    // ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.hideSideMenu))
        viewController.addGestureRecognizer(tap)
    }
    
    
    // Initiate all he SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(menuBtn)
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
    
}

