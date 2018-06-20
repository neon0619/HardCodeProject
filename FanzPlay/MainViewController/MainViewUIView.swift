//
//  MainViewUIConfig.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/13/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit




struct VIEW_CONFIG_EXLOGINVIEW {
    
    struct iPhone_5 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 87, y: 50, width: 162.0, height: 162.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0, y: 203, width: 320, height: 41),
                                                                             CGRect(x: 36, y: 20, width: 73, height: 1),
                                                                             CGRect(x: 117,  y: 4, width: 86, height: 34),
                                                                             CGRect(x: 211, y: 20, width: 73, height: 1)],
                                                             
                                                             "midBtnView": [CGRect(x: 0, y: 240, width: 320, height: 128),
                                                                            
                                                                            CGRect(x: 36, y: 14, width: 45, height: 45),
                                                                            CGRect(x: 80, y: 14, width: 204, height: 45),
                                                                            CGRect(x: 36, y: 70, width: 45, height: 45),
                                                                            CGRect(x: 80, y: 70, width: 204, height: 45),
                                                                            CGRect(x: 36, y: 70, width: 204 + 45, height: 45)],
                                                             
                                                             "botLineView": [CGRect(x: 0, y: 365, width: 320, height: 41),
                                                                             CGRect(x: 36, y: 20, width: 73, height: 1),
                                                                             CGRect(x: 117,  y: 3, width: 86, height: 34),
                                                                             CGRect(x: 211, y: 20, width: 73, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 405, width: 248, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 68,  y: 518, width: 184, height: 50),
                                                                             CGRect(x: 214, y: 552, width: 38, height: 1)]]
        
        
        
        
    }
    
    struct iPhone_6_7 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 110, y: 80, width: 180.0, height: 180.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0, y: 276, width: 375, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 90, height: 1),
                                                                             CGRect(x: 0,  y: 4, width: 375, height: 34),
                                                                             CGRect(x: 248, y: 20, width: 90, height: 1)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 0, y: 310, width: 375, height: 139),
                                                                            
                                                                            CGRect(x: 36, y: 14, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 14, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 75, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75, width: 254 + 50, height: 50)],
                                                             
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 0, y: 442, width: 375, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 125, height: 1),
                                                                             CGRect(x: 0,  y: 3, width: 375, height: 34),
                                                                             CGRect(x: 214, y: 20, width: 125, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 510, width: 303, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 80, y: 618, width: 215, height: 50),
                                                                             CGRect(x: 251, y: 653, width: 45, height: 1)]]
        
    }
    
    
    struct iPhone_6P_7P {
        
       
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 105, y: 70, width: 225.0, height: 225.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0, y: 296, width: 414, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 105, height: 1),
                                                                             CGRect(x: 0,  y: 4, width: 414, height: 34),
                                                                             CGRect(x: 273, y: 20, width: 105, height: 1)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 0, y: 335, width: 412, height: 150),
                                                                            
                                                                            CGRect(x: 36, y: 14, width: 56, height: 56),
                                                                            CGRect(x: 91, y: 14, width: 288, height: 56),
                                                                            CGRect(x: 36, y: 81, width: 56, height: 56),
                                                                            CGRect(x: 91, y: 81, width: 288, height: 56),
                                                                            CGRect(x: 36, y: 81, width: 288 + 56, height: 56)],
                                                             
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 0, y: 484, width: 414, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 142, height: 1),
                                                                             CGRect(x: 0,  y: 3, width: 414, height: 34),
                                                                             CGRect(x: 238, y: 20, width: 142, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 555, width: 303 + 41, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 92, y: 683, width: 230, height: 50),
                                                                             CGRect(x: 273, y: 718, width: 50, height: 1)]]
        
    }
    
    struct iPhone_X {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 105, y: 110, width: 190.0, height: 190.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0, y: 316, width: 375, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 90, height: 1),
                                                                             CGRect(x: 0,  y: 4, width: 375, height: 34),
                                                                             CGRect(x: 248, y: 20, width: 90, height: 1)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 0, y: 310 + 40, width: 375, height: 139),
                                                                            
                                                                            CGRect(x: 36, y: 14, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 14, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75, width: 50, height: 50),
                                                                            CGRect(x: 85, y: 75, width: 254, height: 50),
                                                                            CGRect(x: 36, y: 75, width: 254 + 50, height: 50)],
                                                             
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 0, y: 442 + 40, width: 375, height: 41),
                                                                             
                                                                             CGRect(x: 36, y: 20, width: 125, height: 1),
                                                                             CGRect(x: 0,  y: 3, width: 375, height: 34),
                                                                             CGRect(x: 214, y: 20, width: 125, height: 1)],
                                                             
                                                             "btnRegister": [CGRect(x: 36, y: 510 + 40, width: 303, height: 45)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 80,  y: 658 + 85, width: 215, height: 50),
                                                                             CGRect(x: 251, y: 693 + 85, width: 45, height: 1)]]
    }
    
    struct iPad_Pro_9 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 265, y: 115, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0, y: 396 + 45, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 205 - 30, height: 1.3),
                                                                             CGRect(x: 0,  y: 4, width: 768, height: 34),
                                                                             CGRect(x: 466, y: 20, width: 205 - 30, height: 1.3)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 0, y: 495, width: 766, height: 162),
                                                                            
                                                                            CGRect(x: 96 + 30, y: 12, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 12, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 88, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 457 + 61, height: 61)],
                                                             
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 0, y: 667, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 220, height: 1.3),
                                                                             CGRect(x: 0,  y: 3, width: 768, height: 34),
                                                                             CGRect(x: 424, y: 20, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 126, y: 770, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 234, y: 958, width: 300, height: 50),
                                                                             CGRect(x: 469, y: 998, width: 60, height: 1)]]
        
    }
    
    struct iPad_Pro_10 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 288, y: 140, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 0 + 33, y: 396 + 65, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 205 - 30, height: 1.3),
                                                                             CGRect(x: 0,  y: 4, width: 768, height: 34),
                                                                             CGRect(x: 466, y: 20, width: 205 - 30, height: 1.3)],
                                                             
                                                             
                                                             
                                                             "midBtnView": [CGRect(x: 0 + 33, y: 515, width: 766, height: 162),
                                                                            CGRect(x: 96 + 30, y: 12, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 12, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 88, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 457 + 61, height: 61)],
                                                             
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 0 + 33, y: 684, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 220, height: 1.3),
                                                                             CGRect(x: 0,  y: 3, width: 768, height: 34),
                                                                             CGRect(x: 425, y: 20, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 126 + 33, y: 790, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 234 + 33, y: 978, width: 300, height: 50),
                                                                             CGRect(x: 469 + 33, y: 1018, width: 60, height: 1)]]
        
        
    }
    
    struct iPad_Pro_12 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["fpLogo": [CGRect(x: 380, y: 250, width: 290.0, height: 290.0)],
                                                             
                                                             
                                                             "topLineView": [CGRect(x: 128, y: 611, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 175, height: 1.3),
                                                                             CGRect(x: 0,  y: 4, width: 768, height: 34),
                                                                             CGRect(x: 466, y: 20, width: 175, height: 1.3)],
                                                            
                                                             "midBtnView": [CGRect(x: 128, y: 665, width: 766, height: 162),
                                                                            
                                                                            CGRect(x: 96 + 30, y: 12, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 12, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 61, height: 61),
                                                                            CGRect(x: 151 + 35, y: 88, width: 457, height: 61),
                                                                            CGRect(x: 96 + 30, y: 88, width: 457 + 61, height: 61)],
                                                             
                                                             
                                                             "botLineView": [CGRect(x: 128, y: 834, width: 768, height: 41),
                                                                             
                                                                             CGRect(x: 126, y: 20, width: 220, height: 1.3),
                                                                             CGRect(x: 0,  y: 3, width: 768, height: 34),
                                                                             CGRect(x: 425, y: 20, width: 220, height: 1.3)],
                                                             
                                                             "btnRegister": [CGRect(x: 254, y: 940, width: 518, height: 60)],
                                                             
                                                             
                                                             "signInView":  [CGRect(x: 362, y: 1128, width: 300, height: 50),
                                                                             CGRect(x: 597, y: 1168, width: 60, height: 1)]]
    }
    
    
}
