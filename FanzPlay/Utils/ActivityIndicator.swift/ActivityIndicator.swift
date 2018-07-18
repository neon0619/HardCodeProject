//
//  ActivityIndicator.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/9/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit


class ActivityIndicator: UIViewController {
    
    let activityIndicator = UIActivityIndicatorView()
    let shadowImage = UIImageView()
    
    func show(uiView: UIViewController) {
        
        shadowImage.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        shadowImage.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        
        activityIndicator.center = view.center
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        uiView.view.addSubview(activityIndicator)
        uiView.view.addSubview(shadowImage)
    
        
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stop(uiView: UIViewController) {
        
        UIView.animate(withDuration: 0.1) {
            self.activityIndicator.stopAnimating()
            UIApplication.shared.endIgnoringInteractionEvents()
            self.shadowImage.isHidden = true
        }
    }
    
}
