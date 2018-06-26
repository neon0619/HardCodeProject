//
//  AppDelegate.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import Firebase
import FBSDKCoreKit
import GoogleSignIn



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let reverseGeoCoder = ReverseGeoCoder()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initialize Facebook Login
        FirebaseApp.configure()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)

        
        // Initialize Google Login
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        GIDSignIn.sharedInstance().delegate = self

        
        // Make statusBarStyle color White
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        
        self.reverseGeoCoder.getReverseGeoLoc()
        
        // Set MainViewController as RootViewController
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let mainViewController  = SocialLoginViewController() as UIViewController
        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        print("excute splash screen")
        
        
        if InstanceID.instanceID().token() != nil {
            print("Instance ID ------->>> \(String(describing: InstanceID.instanceID().token()!))")
        }else {
            print("NIL")
        }
        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(self.tokenRefreshNotification),
//                                               name: .firInstanceIDTokenRefresh,
//                                               object: nil)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    // Facebook Login Methods
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
//        print("FB prefix --->>>> \((url.scheme?.hasPrefix)!)")
        
        if (url.scheme?.hasPrefix("fb"))! {
            let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
            print("Facebook called")
            return handled
        }else {
            print("Google called")
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if error != nil {
            // ...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        print("googel credentials --->>> \(credential.provider)")
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        print("Disconnected from the app.")
        // ...
    }
    
    
    @objc func tokenRefreshNotification(_ notification: Notification) {
        
        //print(" ********* == tokenRefreshNotification()")
        
        if InstanceID.instanceID().token() != nil {
            //print("InstanceID token: \(refreshedToken)")
        }
        
        // Connect to FCM since connection may have failed when attempted before having a token.
        //        connectToFcm()
        
        connectToFCM { (fcmToken) in
            //print("FUNCTION CALLED 11111")
            print(" ********** FCMToken == \(fcmToken)")
            
        }
    }
    
    func connectToFCM(postCompleted: @escaping (_ fcmToken: String) -> ()) {
        
        if ConnectionDetector.isConnectedToNetwork() {
            
            guard InstanceID.instanceID().token() != nil else {
                return
            }
            
            // Disconnect previous FCM connection if it exists.
            Messaging.messaging().shouldEstablishDirectChannel = false
            
            if Messaging.messaging().shouldEstablishDirectChannel == true {
                
                if InstanceID.instanceID().token() != nil || InstanceID.instanceID().token() != "" {
                    postCompleted(InstanceID.instanceID().token()!)
                    
                    print("FIRInstanceID.instanceID().token() ----->>> \(InstanceID.instanceID().token()!)")
                }else {
                    return
                }
                
            }
        
        }else {
            guard InstanceID.instanceID().token() != nil else { return }
        }
        
    }


}

