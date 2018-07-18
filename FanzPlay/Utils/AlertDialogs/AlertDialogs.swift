//
//  AlertDialogs.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/27/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

class AlertDialogs: NSObject {
    
    
    ///////  alertController for ViewController with PARAMETERS /////////////
    func showAlertDialog(title: String, msg: String, viewController: UIViewController) -> Void {
        let alertController = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            viewController.navigationController?.dismiss(animated: true, completion: nil)
            
        })
        alertController.addAction(ok)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
    
}
