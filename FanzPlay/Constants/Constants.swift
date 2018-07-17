//
//  Constants.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

struct GlobalUrl {
    
    static let baseUrl = "http://54.68.7.104:88/"
    
    struct api {
        static let registerExternal = "api/user/registerexternal"
    }
    
    static let registerExternal = "api/user/registerexternal"
}

struct Constants {
    

    struct SCREENSIZE {
        static let SCREEN_WIDTH         = UIScreen.main.bounds.size.width
        static let SCREEN_HEIGHT        = UIScreen.main.bounds.size.height
        static let SCREEN_MAX_LENGTH    = max(SCREENSIZE.SCREEN_WIDTH, SCREENSIZE.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH    = min(SCREENSIZE.SCREEN_WIDTH, SCREENSIZE.SCREEN_HEIGHT)
    }
    
    
    struct DEVICE_TYPE {
        
        static let iPhone4              = UIDevice.current.userInterfaceIdiom == .phone && SCREENSIZE.SCREEN_MAX_LENGTH < 568.0
        static let iPhone5              = UIDevice.current.userInterfaceIdiom == .phone && SCREENSIZE.SCREEN_MAX_LENGTH == 568.0
        static let iPhone_6_7           = UIDevice.current.userInterfaceIdiom == .phone && SCREENSIZE.SCREEN_MAX_LENGTH == 667.0
        static let iPhone_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && SCREENSIZE.SCREEN_MAX_LENGTH == 736.0
        static let iPhone_X             = UIDevice.current.userInterfaceIdiom == .phone && SCREENSIZE.SCREEN_MAX_LENGTH == 812.0
        
        struct iPad {
            static let Pro_9            = UIDevice.current.userInterfaceIdiom == .pad && SCREENSIZE.SCREEN_MAX_LENGTH == 1024.0
            static let Pro_10           = UIDevice.current.userInterfaceIdiom == .pad && SCREENSIZE.SCREEN_MAX_LENGTH == 1112.0
            static let Pro_12           = UIDevice.current.userInterfaceIdiom == .pad && SCREENSIZE.SCREEN_MAX_LENGTH == 1366.0
        }
        
    }
    
}
