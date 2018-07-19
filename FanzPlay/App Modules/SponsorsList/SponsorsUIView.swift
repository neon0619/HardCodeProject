//
//  SponsorsUIView.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/19/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

// *************************** VIEW CONTROLLER SPONSORLIST *************************** //


struct VIEW_CONFIG_SPONSORLIST {
    
    struct iPhone_5 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 68,  y: 55,  width: 185, height: 121)],
                                                             "cvSponsors":    [CGRect(x: 40, y: 191, width: 240, height: 130)],
                                                             "fpLogo":      [CGRect(x: 16, y: 255, width: 308, height: 308)],
                                                             "btnMainMenu": [CGRect(x: 29,  y: 518, width: 262, height: 50)]]

        
    }
    
    struct iPhone_6_7 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 95,  y: 70,  width: 195, height: 131)],
                                                             "collView":    [CGRect(x: 67.5, y: 206, width: 240, height: 130)],
                                                             "fpLogo":      [CGRect(x: 20, y: 310, width: 355, height: 355)],
                                                             "btnMainMenu": [CGRect(x: 56.5,  y: 617, width: 262, height: 50)]]
        
        
    }
    
    struct iPhone_6P_7P {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 97,  y: 75,  width: 220, height: 131)],
                                                             "collView":    [CGRect(x: 87, y: 231, width: 240, height: 130)],
                                                             "fpLogo":      [CGRect(x: 18, y: 347, width: 400, height: 400)],
                                                             "btnMainMenu": [CGRect(x: 76,    y: 686, width: 262, height: 50)]]
        

    }
    
    struct iPhone_X {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 77.5,  y: 70,  width: 220, height: 131)],
                                                             "collView":    [CGRect(x: 67.5, y: 206, width: 240, height: 130)],
                                                             "fpLogo":      [CGRect(x: 0,  y: 387, width: 400, height: 400)],
                                                             "btnMainMenu": [CGRect(x: 56.5,  y: 745, width: 262, height: 50)]]

    }
    
    struct iPad_Pro_9 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 224,   y: 140, width: 320, height: 170)],
                                                             "collView":    [CGRect(x: 254,   y: 320, width: 260, height: 167)],
                                                             "fpLogo":      [CGRect(x: 104, y: 435, width: 600, height: 600)],
                                                             "btnMainMenu": [CGRect(x: 238,   y: 957, width: 292, height: 70)]]


    }
    
    struct iPad_Pro_10 {
        
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 257,   y: 160, width: 320, height: 170)],
                                                             "collView":    [CGRect(x: 287,   y: 340, width: 260, height: 167)],
                                                             "fpLogo":      [CGRect(x: 140, y: 475, width: 600, height: 600)],
                                                             "btnMainMenu": [CGRect(x: 238 + 38,   y: 1050, width: 292, height: 70)]]
        

    }
    
    struct iPad_Pro_12 {
        
        static let cgRectArrays: [String: Array<CGRect>]  = ["lblTitle":    [CGRect(x: 352,   y: 230, width: 320, height: 170)],
                                                             "collView":    [CGRect(x: 382,   y: 410, width: 260, height: 167)],
                                                             "fpLogo":      [CGRect(x: 230, y: 585, width: 600, height: 600)],
                                                             "btnMainMenu": [CGRect(x: 338 + 30,   y: 1065 + 50, width: 292, height: 70)]]
        
    }
    
}
