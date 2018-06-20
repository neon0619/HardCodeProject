//
//  UIColor.swift
//  UMPSHealth
//
//  Created by IOS Dev on 4/17/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int) {
        let r = hex / 0x10000
        let g = (hex - r*0x10000) / 0x100
        let b = hex - r*0x10000 - g*0x100
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}
