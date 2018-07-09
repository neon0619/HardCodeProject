//
//  SignUpUIView.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/9/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

class SignUpUIView: UIViewController {
    
    
    
}

struct VIEW_CONFIG_SIGNUPVIEW {
    
    struct iPhone_5 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 87, y: 50, width: 162.0, height: 162.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 36, y: 20 + 203, width: 73, height: 1),
                                                                             CGRect(x: 117,  y: 4 + 198, width: 86, height: 40),
                                                                             CGRect(x: 211, y: 20 + 203, width: 73, height: 1)],
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 36, y: 14 + 240, width: 45, height: 45),
                                                                            CGRect(x: 80, y: 14 + 240, width: 204, height: 45),
                                                                            CGRect(x: 36, y: 70 + 240, width: 45, height: 45),
                                                                            CGRect(x: 80, y: 70 + 240, width: 204, height: 45),
                                                                            CGRect(x: 36, y: 70 + 240, width: 204 + 45, height: 45)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 36,  y: 20 + 365, width: 73, height: 1),
                                                                             CGRect(x: 117 + 30, y: 3  + 375, width: 20, height: 14),
                                                                             CGRect(x: 211, y: 20 + 365, width: 73, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 405, width: 248, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 68,  y: 518, width: 184, height: 50),
                                                                             CGRect(x: 213, y: 552, width: 38, height: 1)]]
        
        
        
        
    }
    
    struct iPhone_6_7 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 110, y: 80, width: 180.0, height: 180.0)],
                                                             
                                                             "topLineView": [CGRect(x: 36,  y: 276 + 20, width: 90, height: 1),
                                                                             CGRect(x: 134,   y: 276 + 3, width: 375, height: 34),
                                                                             CGRect(x: 248, y: 276 + 20, width: 90, height: 1)],
                                                             
                                                             "midBtnView": [CGRect(x: 36, y: 14 + 310, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 14 + 310, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75 + 310, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 75 + 310, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75 + 310, width: 254 + 50, height: 50)],
                                                             
                                                             "botLineView": [CGRect(x: 36, y: 20 + 442, width: 125, height: 1),
                                                                             CGRect(x: 175,  y: 3 + 442, width: 375, height: 34),
                                                                             CGRect(x: 214, y: 20 + 442, width: 125, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 510, width: 303, height: 45)],
                                                             
                                                             "signInView":  [CGRect(x: 80, y: 618, width: 215, height: 50),
                                                                             CGRect(x: 247, y: 653, width: 45, height: 1)]
        ]
        
    }
    
    
    struct iPhone_6P_7P {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 105, y: 70, width: 225.0, height: 225.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 36, y: 20 + 296, width: 105, height: 1),
                                                                             CGRect(x: 154,  y: 4 + 296, width: 414, height: 34),
                                                                             CGRect(x: 273, y: 20 + 296, width: 105, height: 1)],
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 36, y: 14 + 335, width: 56, height: 56),
                                                                            CGRect(x: 91, y: 14 + 335, width: 288, height: 56),
                                                                            CGRect(x: 36, y: 81 + 335, width: 56, height: 56),
                                                                            CGRect(x: 91, y: 81 + 335, width: 288, height: 56),
                                                                            CGRect(x: 36, y: 81 + 335, width: 288 + 56, height: 56)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 36, y: 20 + 484, width: 142, height: 1),
                                                                             CGRect(x: 197,  y: 3 + 484, width: 414, height: 34),
                                                                             CGRect(x: 238, y: 20 + 484, width: 142, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 555, width: 303 + 41, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 92, y: 683, width: 230, height: 50),
                                                                             CGRect(x: 273, y: 718, width: 50, height: 1)]]
        
    }
    
    struct iPhone_X {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 105, y: 110, width: 190.0, height: 190.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 36, y: 20 + 316, width: 90, height: 1),
                                                                             CGRect(x: 134,  y: 4 + 314, width: 375, height: 34),
                                                                             CGRect(x: 248, y: 20 + 316, width: 90, height: 1)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 36, y: 14 + 350, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 14 + 350, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75 + 350, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 75 + 350, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75 + 350, width: 254 + 50, height: 50)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 36, y: 20 + 482, width: 125, height: 1),
                                                                             CGRect(x: 175,  y: 3 + 482, width: 375, height: 34),
                                                                             CGRect(x: 214, y: 20 + 482, width: 125, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 510 + 40, width: 303, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 80,  y: 658 + 85, width: 215, height: 50),
                                                                             CGRect(x: 246, y: 693 + 85, width: 45, height: 1)]]
    }
    
    struct iPad_Pro_9 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 265, y: 115, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 126, y: 20 + 441, width: 205 - 30, height: 1.3),
                                                                             CGRect(x: 330,   y: 4 + 441, width: 768, height: 34),
                                                                             CGRect(x: 466,  y: 20 + 441, width: 205 - 30, height: 1.3)],
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 96 + 30, y: 12 + 495, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 12 + 495, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88 + 495, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 88 + 495, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88 + 495, width: 457 + 61, height: 61)],
                                                             
                                                             "botLineView": [CGRect(x: 126, y: 20 + 667, width: 220, height: 1.3),
                                                                             CGRect(x: 370,   y: 3 + 668, width: 768, height: 34),
                                                                             CGRect(x: 424, y: 20 + 667, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 126, y: 770, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 234, y: 958, width: 300, height: 50),
                                                                             CGRect(x: 456, y: 997, width: 58, height: 1)]]
        
    }
    
    struct iPad_Pro_10 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 288, y: 140, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 126 + 33, y: 20 + 461, width: 205 - 30, height: 1.3),
                                                                             CGRect(x: 360,  y: 4 + 461, width: 768, height: 34),
                                                                             CGRect(x: 466 + 33, y: 20 + 461, width: 205 - 30, height: 1.3)],
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 96 + 30 + 33, y: 12 + 515, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35 + 33, y: 12 + 515, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30 + 33, y: 88 + 515, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35 + 33, y: 88 + 515, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30 + 33, y: 88 + 515, width: 457 + 61, height: 61)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 126 + 33, y: 20 + 684, width: 220, height: 1.3),
                                                                             CGRect(x: 406,  y: 4 + 684, width: 768, height: 34),
                                                                             CGRect(x: 425 + 33, y: 20 + 684, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 126 + 33, y: 790, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 234 + 33, y: 978, width: 300, height: 50),
                                                                             CGRect(x: 490, y: 1016, width: 58, height: 1)]]
        
        
    }
    
    struct iPad_Pro_12 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 380, y: 250, width: 290.0, height: 290.0)],
                                                             
                                                             "topLineView": [CGRect(x: 126 + 128, y: 20 + 611, width: 175, height: 1.3),
                                                                             CGRect(x: 128 + 330,  y: 4 + 611, width: 768, height: 34),
                                                                             CGRect(x: 466 + 128, y: 20 + 611, width: 175, height: 1.3)],
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 96 + 30 + 128, y: 12 + 665, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35 + 128, y: 12 + 665, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30 + 128, y: 88 + 665, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35 + 128, y: 88 + 665, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30 + 128, y: 88 + 665, width: 457 + 61, height: 61)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 126 + 128, y: 20 + 834, width: 220, height: 1.3),
                                                                             CGRect(x: 128 + 374,  y: 3 + 834, width: 768, height: 34),
                                                                             CGRect(x: 425 + 128, y: 20 + 834, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 254, y: 940, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 362, y: 1128, width: 300, height: 50),
                                                                             CGRect(x: 586, y: 1168, width: 58, height: 1)]]
    }
    
    
}
