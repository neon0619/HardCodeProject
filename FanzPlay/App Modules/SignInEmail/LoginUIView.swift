//
//  LoginUIView.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit


class LoginUIView: UIViewController {
    
}


struct VIEW_CONFIG_SIGNINEMAILVIEW {
    
    struct iPhone_5 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack": [CGRect(x: 0, y: 20, width: 25, height: 50)],
                                                             
                                                             "fpLogo":  [CGRect(x: 87, y: 50, width: 162.0, height: 162.0)],
                                                             
                                                             "signInWith": [CGRect(x: 35, y: 212, width: 250, height: 34)],
                                                             
                                                             "lblError": [CGRect(x: 35, y: 247, width: 250, height: 0)],           // lblError
            
        
                                                             "emailAddView": [CGRect(x: 0, y: 242, width: 320, height: 60),        // EmailAddress View
                                                                              CGRect(x: 43, y: 23, width: 24, height: 24),         // imgEmail Icon
                                                                              CGRect(x: 75,  y: 15, width: 210, height: 40),       // emailTxtFld
                                                                              CGRect(x: 268, y: 17, width: 16, height: 40),        // imgErrorIcon
                                                                              CGRect(x: 35, y: 55, width: 250, height: 1)],        // emailLineView
            
                                                             "passWordView": [CGRect(x: 0, y: 302, width: 320, height: 60),        // PassWord View
                                                                              CGRect(x: 43, y: 23, width: 24, height: 24),         // imgPassIcon
                                                                              CGRect(x: 75,  y: 15, width: 210, height: 40),       // passwordTxtFld
                                                                              CGRect(x: 268, y: 17, width: 16, height: 40),        // showPassContainerView
                                                                              CGRect(x: 35, y: 55, width: 250, height: 1)],        // passWordLineView
            
                                                             "forgotPassword": [CGRect(x: 35, y: 362, width: 250, height: 30)],
            
            
                                                             "btnLogin":       [CGRect(x: 35, y: 420, width: 250, height: 45)],
            
            
                                                             "btnCreateRegister":  [CGRect(x: 68,  y: 518, width: 184, height: 50),
                                                                                    CGRect(x: 207, y: 552, width: 45.5, height: 0.8)]]   // registerBotLine
        
        
        
        
    }
    
    struct iPhone_6_7 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 4, y: 25, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 110, y: 80, width: 180.0, height: 180.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 262, width: 375, height: 34)],
                                                             
                                                             "lblError":          [CGRect(x: 35, y: 298, width: 304, height: 0)],
                                                             
                                                             
                                                             "emailAddView":      [CGRect(x: 0, y: 292, width: 320, height: 41),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 210, height: 40),
                                                                                   CGRect(x: 312, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 304, height: 1)],
                                                             
                                                             "passWordView":      [CGRect(x: 0, y: 352, width: 320, height: 128),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 210, height: 40),
                                                                                   CGRect(x: 312, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 304, height: 1)],
                                                             
                                                             
                                                             
                                                             "forgotPassword":    [CGRect(x: 35, y: 412, width: 304, height: 30)],
                                                             
                                                             
                                                             "btnLogin":          [CGRect(x: 35, y: 470, width: 304, height: 45)],
                                                             
                                                             
                                                             "btnCreateRegister": [CGRect(x: 80, y: 618, width: 215, height: 50),
                                                                                   CGRect(x: 229, y: 653, width: 53, height: 1)]]
        
    }
    
    
    struct iPhone_6P_7P {
        
        ///   here   ///
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 4, y: 25, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 105, y: 70, width: 225.0, height: 225.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 296, width: 414, height: 50)],
                                                             
                                                             "lblError":          [CGRect(x: 35, y: 342, width: 343, height: 0)],
                                                             
                                                             
                                                             "emailAddView":      [CGRect(x: 0, y: 336, width: 414, height: 56),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 249, height: 40),
                                                                                   CGRect(x: 312 + 39, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 343, height: 1)],
                                                             
                                                             "passWordView":      [CGRect(x: 0, y: 396, width: 414, height: 56),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 249, height: 40),
                                                                                   CGRect(x: 312 + 39, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 343, height: 1)],
                                                             
                                                             
                                                             
                                                             "forgotPassword":    [CGRect(x: 35, y: 456, width: 343, height: 30)],
                                                             
                                                             
                                                             "btnLogin":          [CGRect(x: 35, y: 555, width: 343, height: 45)],
                                                             
                                                             
                                                             "btnCreateRegister": [CGRect(x: 92, y: 683, width: 230, height: 50),
                                                                                   CGRect(x: 252, y: 718, width: 54, height: 1)]]
        
    }
    
    struct iPhone_X {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 5, y: 28, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 105, y: 110, width: 190.0, height: 190.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 262 + 54, width: 375, height: 34)],
                                                             
                                                             "lblError":          [CGRect(x: 35, y: 298 + 54, width: 304, height: 0)],
                                                             
                                                             
                                                             "emailAddView":      [CGRect(x: 0, y: 292 + 54, width: 320, height: 41),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 210, height: 40),
                                                                                   CGRect(x: 312, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 304, height: 1)],
                                                             
                                                             "passWordView":      [CGRect(x: 0, y: 352 + 54, width: 320, height: 128),
                                                                                   CGRect(x: 43, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 75,  y: 15, width: 210, height: 40),
                                                                                   CGRect(x: 312, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 35, y: 55, width: 304, height: 1)],
                                                             
                                                             
                                                             
                                                             "forgotPassword":    [CGRect(x: 35, y: 412 + 54, width: 304, height: 30)],
                                                             
                                                             
                                                             "btnLogin":          [CGRect(x: 35, y: 510 + 40, width: 304, height: 45)],
                                                             
                                                             
                                                             "btnCreateRegister": [CGRect(x: 80,  y: 658 + 85, width: 215, height: 50),
                                                                                   CGRect(x: 229, y: 693 + 85, width: 53, height: 1)]]
        
    }
    
    struct iPad_Pro_9 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 4, y: 25, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 265, y: 115, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 426, width: 768, height: 50)],
                                                             
                                                             "lblError":          [CGRect(x: 126, y: 477, width: 518, height: 0)],
                                                             
                                                             
                                                             "emailAddView":      [CGRect(x: 0,   y: 476, width: 768, height: 56),
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],
                                                             
                                                             "passWordView":      [CGRect(x: 0,   y: 546, width: 768, height: 56),
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],
                                                             
                                                             
                                                             
                                                             "forgotPassword":    [CGRect(x: 118, y: 606, width: 518, height: 30)],
                                                             
                                                             
                                                             "btnLogin":          [CGRect(x: 126, y: 770, width: 518, height: 60)],
                                                             
                                                             
                                                             "btnCreateRegister": [CGRect(x: 234, y: 958, width: 300, height: 50),
                                                                                   CGRect(x: 441, y: 998, width: 70, height: 1)]]
        
    }
    
    struct iPad_Pro_10 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 4, y: 25, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 288, y: 140, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 426, width: 834, height: 50)],
                                                             
                                                             "lblError":          [CGRect(x: 159, y: 477, width: 518, height: 0)],
                                                             
                                                             
                                                             "emailAddView":      [CGRect(x: 38,   y: 476, width: 768, height: 56),
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],
                                                             
                                                             "passWordView":      [CGRect(x: 38,   y: 546, width: 768, height: 56),
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],
                                                             
                                                             "forgotPassword":    [CGRect(x: 159, y: 606, width: 518, height: 30)],
                                                             
                                                             
                                                             "btnLogin":          [CGRect(x: 159, y: 790, width: 518, height: 60)],
                                                             
                                                             
                                                             "btnCreateRegister": [CGRect(x: 234 + 33, y: 978, width: 300, height: 50),
                                                                                   CGRect(x: 474, y: 1018, width: 70, height: 1)]]
        
        
    }
    
    struct iPad_Pro_12 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["btnBack":           [CGRect(x: 4, y: 25, width: 25, height: 50)],
                                                             
                                                             "fpLogo":            [CGRect(x: 380, y: 250, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "signInWith":        [CGRect(x: 0, y: 426 + 150, width: 1024, height: 50)],
                                                             
                                                             "lblError":          [CGRect(x: 159 + 95, y: 477 + 150, width: 518, height: 0)],       // lblError
            
            
                                                             "emailAddView":      [CGRect(x: 38 + 95,  y: 476 + 150, width: 768, height: 56),        // EmailAddress View
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),          // imgEmail Icon
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),         // emailTxtFld
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),          // errIconView
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],         // emailLineView
            
                                                             "passWordView":      [CGRect(x: 38 + 95,   y: 546 + 150, width: 768, height: 56),        // PassWord View
                                                                                   CGRect(x: 126, y: 23, width: 24, height: 24),          // imgPassIcon
                                                                                   CGRect(x: 158, y: 15, width: 424, height: 40),         // passwordTxtFld
                                                                                   CGRect(x: 609, y: 15, width: 26, height: 40),          // showPassContainerView
                                                                                   CGRect(x: 118, y: 55, width: 518, height: 1)],         // passWordLineView
            
                                                             "forgotPassword":    [CGRect(x: 159 + 95, y: 606 + 150, width: 518, height: 30)],
            
            
                                                             "btnLogin":          [CGRect(x: 159 + 95, y: 790 + 150, width: 518, height: 60)],
            
            
                                                             "btnCreateRegister": [CGRect(x: 234 + 33 + 95, y: 978 + 150, width: 300, height: 50),
                                                                                   CGRect(x: 474 + 95, y: 1018 + 150, width: 70, height: 1)]]         // registerBotLine
    }
    
    
}
