//
//  EmailSignUpViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SignUpViaEmail: UIViewController {
    
    
    
    // UIView for NewAccountViewController
    lazy var viewController: UIView = {
        let viewView = UIView()
        viewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewView.backgroundColor = UIColor.darkGray
        return viewView
    }()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
