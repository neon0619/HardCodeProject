//
//  UITextField.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/16/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {
    func placeholderColor(_ color: UIColor){
        var placeholderText = ""
        if self.placeholder != nil {
            placeholderText = self.placeholder!
        }
        self.attributedPlaceholder = NSAttributedString(string: placeholderText, attributes: [NSAttributedStringKey.foregroundColor : color])
    }
}


//extension String {
//    func api(path: String) -> String {
//        return path.appendingFormat("")
//    }
//}

extension String {
    mutating func api(str: String) -> String {
        self = self + str
        return str
    }
}
