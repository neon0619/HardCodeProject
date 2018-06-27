//
//  AppDelegate.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/12/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit
import UserNotifications
import Firebase
import FirebaseMessaging
import FirebaseInstanceID
import FBSDKCoreKit
import GoogleSignIn



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let gcmMessageIDKey = "AAAAw6liA9k:APA91bELy6ItMEyjZldjJ2abe31A20mqZuyTzO8UcGGpmIY4gwqD2zRW9yapUFHvEnFuDEfMYWizmbqlVqK94x--uzC-WnXgaBCB0RWFycrHMwYzLAgyZs2M3YwjXWiGafWlIq6rfARPcb-yJKQdtF4--qGmW51OpQ"
    let reverseGeoCoder = ReverseGeoCoder()

    private let className = "AppDelegate: ------->>>"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
 
        FirebaseApp.configure()
        NotificationCenter.default.addObserver(self, selector: #selector(tokenRefreshNotification(_:)), name: .InstanceIDTokenRefresh, object: nil)
        Messaging.messaging().delegate = self
        
        // Register for remote notifications. This shows a permission dialog on first run, to
        // show the dialog at a more appropriate time move this registration accordingly.
        // [START register_for_notifications]
        if #available(iOS 10.0, *) {
            
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
            
            // For iOS 10 display notification (sent via APNS)
            UNUserNotificationCenter.current().delegate = self
            // For iOS 10 data message (sent via FCM)
            Messaging.messaging().remoteMessageDelegate = self
            
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        
        application.registerForRemoteNotifications()
        
        // Initialize Facebook Login
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
        print("\(className) excute splash screen")
        
        
        return true
    }
    
    // [START receive_message]
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any]) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // Print message ID.
        //print(" ********* == didReceiveRemoteNotification")
        
        if userInfo[gcmMessageIDKey] != nil {
            //print("Message ID: \(messageID)")
        }
        
        // Print full message.
        //        print(userInfo)
    }
    
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        // If you are receiving a notification message while your app is in the background,
        // this callback will not be fired till the user taps on the notification launching the application.
        // TODO: Handle data of notification
        // Print message ID.
        //print(" ********* == didReceiveRemoteNotification / UIBackgroundFetchResult")
        
        if userInfo[gcmMessageIDKey] != nil {
            //print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    // [END receive_message]
    
    
    // [END connect_to_fcm]
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Unable to register for remote notifications: \(error.localizedDescription)")
    }
    
    
    // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
    // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
    // the InstanceID token.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        //print(" ********* == didRegisterForRemoteNotificationsWithDeviceToken()")
        //print("ANs token retrieved: \(deviceToken)")
        
        //        let tokenChars = UnsafePointer<CChar>(deviceToken.bytes)
        //        var tokenString = ""
        //
        //        for i in 0..<deviceToken.length {
        //            tokenString += String(format: "%02.2hhx", arguments: [tokenChars[i]])
        //        }
        
        // ---->>>>> DEPLOYMENT <<<<<-----
        InstanceID.instanceID().setAPNSToken(deviceToken, type: InstanceIDAPNSTokenType.sandbox)
        //        FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: FIRInstanceIDAPNSTokenType.prod)
        
        //        //print("tokenString: \(tokenString)")
        // With swizzling disabled you must set the APNs token here.
        // FIRInstanceID.instanceID().setAPNSToken(deviceToken, type: FIRInstanceIDAPNSTokenType.sandbox)
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }


    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    // [START connect_on_active]
    func applicationDidBecomeActive(_ application: UIApplication) {
        connectToFCM { (fcmToken) in
            print(" ********** FCMToken applicationDidBecomeActive == \(fcmToken)")
        }
    }
    // [END connect_on_active]
    
    // [START disconnect_from_fcm]
    func applicationDidEnterBackground(_ application: UIApplication) {
        Messaging.messaging().disconnect()
        //print("Disconnected from FCM.")
    }
    //end firebase
    
    
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    
    // Facebook Login Methods
    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        
        if (url.scheme?.hasPrefix("fb"))! {
            let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, options: options)
            print("\(className) Facebook called")
            return handled
        }else {
            print("\(className) Google called")
            return GIDSignIn.sharedInstance().handle(url, sourceApplication:options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String, annotation: [:])
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        //...
        if error != nil {
            //...
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        print("\(className) google credentials --->>> \(credential.provider)")
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        print("\(className) Disconnected from the app.")
        // ...
    }
    
    
    @objc func tokenRefreshNotification(_ notification: Notification) {
        
        
        if InstanceID.instanceID().token() != nil {
            print("\(className) instance token not NIL")
        }else {
            print("\(className) instance token is NIL")
        }
        
        // Connect to FCM since connection may have failed when attempted before having a token.
        connectToFCM { (fcmToken) in
            print("\(self.className)********** FCMToken == \(fcmToken)")
            
        }
    }
    
    
    func connectToFCM(postCompleted: @escaping (_ fcmToken: String) -> ()) {
        if ConnectionDetector.isConnectedToNetwork() {
            guard InstanceID.instanceID().token() != nil else {
                return
            }
            
            // Disconnect previous FCM connection if it exists.
            Messaging.messaging().disconnect()
            
            Messaging.messaging().connect { (error) in
                if error != nil {
                    print("\(self.className) Unable to connect with FCM. \(String(describing: error))")
                } else {
                    
                    if InstanceID.instanceID().token() != nil || InstanceID.instanceID().token() != "" {
                        postCompleted(InstanceID.instanceID().token()!)
                        
                        print("\(self.className)FIRInstanceID.instanceID().token() ----->>> \(InstanceID.instanceID().token()!)")

                    }else {
                        print("\(self.className)FIRInstanceID.instanceID().token() ----->>> NIL")

                        return
                    }
                }
            }
        }else {
            print("No Internet Connection")
        }

    }
}

// [START ios_10_message_handling]
@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                willPresent notification: UNNotification,
                                withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo as! [String: Any]
        
        // With swizzling disabled you must let Messaging know about the message, for Analytics
        // Messaging.messaging().appDidReceiveMessage(userInfo)
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("\(className)Message ID: \(messageID)")
        }
        
        // Print full message.
        print("\(className)userInfo == \(userInfo)")
        
        // Change this to your preferred presentation option
        completionHandler([.alert, .badge, .sound])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter,
                                didReceive response: UNNotificationResponse,
                                withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if let messageID = userInfo[gcmMessageIDKey] {
            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        print(userInfo)
        
        completionHandler()
    }
}
// [END ios_10_message_handling]

extension AppDelegate : MessagingDelegate {
    // [START refresh_token]
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String) {
        print("\(className)Firebase registration token: \(fcmToken)")
        
        let dataDict:[String: String] = ["token": fcmToken]
        NotificationCenter.default.post(name: Notification.Name("FCMToken"), object: nil, userInfo: dataDict)
        // TODO: If necessary send token to application server.
        // Note: This callback is fired at each app startup and whenever a new token is generated.
    }
    // [END refresh_token]
    // [START ios_10_data_message]
    // Receive data messages on iOS 10+ directly from FCM (bypassing APNs) when the app is in the foreground.
    // To enable direct data messages, you can set Messaging.messaging().shouldEstablishDirectChannel to true.
    func messaging(_ messaging: Messaging, didReceive remoteMessage: MessagingRemoteMessage) {
        print("\(className)Received data message: \(remoteMessage.appData)")
    }
    // [END ios_10_data_message]
}
