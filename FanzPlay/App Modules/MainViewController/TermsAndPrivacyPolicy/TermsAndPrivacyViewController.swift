//
//  TermsAndPrivacyViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/10/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import WebKit

class TermsAndPrivacyViewController: UIViewController {
    
    // UIView for TermsAndPrivacyViewController
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
    
    
    // UIButton for BackArrow
    lazy var btnBack: UIButton = {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect(x: 8, y: 20, width: 30, height: 50)
        btn.setImage(UIImage(named: "btn_white_back_arrow"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
        btn.addTarget(self, action: #selector(dismissTerms), for: .touchUpInside)
        return btn
    }()
    
    
    // UILabel for Terms and Privacy
    lazy var lblTermsTitle: UILabel = {
        let lblLabel = UILabel()
        lblLabel.frame = CGRect(x: 38, y: 30, width: 282, height: 30)
        lblLabel.text = "Terms and Privacy"
        lblLabel.textColor = UIColor.white
        return lblLabel
    }()
    
    
    override func viewDidLoad() {
        
        initiateSubViews()
        
        if let pdfURL = Bundle.main.url(forResource: "Fanzplay_PRIVACY_POLICY", withExtension: "pdf", subdirectory: nil, localization: nil)  {
            do {
                let data = try Data(contentsOf: pdfURL)
                let webView = WKWebView(frame: CGRect(x: 0, y: 80, width: self.view.frame.size.width, height: self.view.frame.size.height - 85))
                webView.load(data, mimeType: "application/pdf", characterEncodingName:"", baseURL: pdfURL.deletingLastPathComponent())
                self.view.addSubview(webView)
                
            }
            catch {
                // catch errors here
            }
        }

    }
    
    
    func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(btnBack)
        view.addSubview(lblTermsTitle)
    }
    
    
    @objc func dismissTerms() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
