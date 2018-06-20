//
//  DeviceType.swift
//  UMPSHealth
//
//  Created by IOS Dev on 4/5/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit


struct DeviceType {

    struct screenSize {
        
        static let screenWidth         = UIScreen.main.bounds.size.width
        static let screenHeight        = UIScreen.main.bounds.size.height
        static let screenMaxLenght     = max(screenSize.screenWidth, screenSize.screenHeight)
        static let screenMinLenght   = min(screenSize.screenWidth, screenSize.screenHeight)
    }
    
        static let iPhone4              = UIDevice.current.userInterfaceIdiom == .phone && screenSize.screenMaxLenght < 568.0
        static let iPhone5              = UIDevice.current.userInterfaceIdiom == .phone && screenSize.screenMaxLenght == 568.0
        static let iPhone_6_7           = UIDevice.current.userInterfaceIdiom == .phone && screenSize.screenMaxLenght == 667.0
        static let iPhone_6P_7P         = UIDevice.current.userInterfaceIdiom == .phone && screenSize.screenMaxLenght == 736.0
        static let iPhone_X             = UIDevice.current.userInterfaceIdiom == .phone && screenSize.screenMaxLenght == 812.0
        
        static let iPad_9                 = UIDevice.current.userInterfaceIdiom == .pad && screenSize.screenMaxLenght == 1024.0
        static let iPad_10                = UIDevice.current.userInterfaceIdiom == .pad && screenSize.screenMaxLenght == 1112.0
        static let iPad_12                = UIDevice.current.userInterfaceIdiom == .pad && screenSize.screenMaxLenght == 1366.0
    
}

