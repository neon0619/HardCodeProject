
//
//  Segue.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/9/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit


class Segue: UIViewController {
    
    func showViewController(uiVC: UIViewController) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.35) {
            let svc = uiVC
            svc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve
            uiVC.present(svc, animated: true, completion: nil)
        }
    }
    
    
}
