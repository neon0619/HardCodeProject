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

var insTanceIdToken = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, GIDSignInDelegate {

    var window: UIWindow?
    let userDefault = UserDefaults.standard
    
    let gcmMessageIDKey = "AAAAw6liA9k:APA91bELy6ItMEyjZldjJ2abe31A20mqZuyTzO8UcGGpmIY4gwqD2zRW9yapUFHvEnFuDEfMYWizmbqlVqK94x--uzC-WnXgaBCB0RWFycrHMwYzLAgyZs2M3YwjXWiGafWlIq6rfARPcb-yJKQdtF4--qGmW51OpQ"
    let reverseGeoCoder = ReverseGeoCoder()
    
    var googleUser: GIDGoogleUser = GIDGoogleUser()

    private let className = "--- AppDelegate: ------->>>"

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Initial install set the value for Settings AutoUpdate
        if userDefault.string(forKey: "isInitialLogin") != nil {
            print("\(className) FANZPLAY is INSTALLED: \(String(describing: userDefault.value(forKey: "isInitialLogin")!))")
        }else{
            // Nothing stored in NSUserDefaults yet. Set a value.
            userDefault.setValue("installed", forKey: "isInitialLogin")
            print("\(className) INITIAL INSTALL FANZPLAY: \(String(describing: userDefault.value(forKey: "isInitialLogin")!))")
        }
 
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
            
        }else {
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
        let mainViewController  = SplashViewController() as UIViewController
//        let mainViewController  = MainViewController() as UIViewController

        self.window?.rootViewController = mainViewController
        self.window?.makeKeyAndVisible()
        
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
        print("\(className) == didFailToRegisterForRemoteNotificationsWithError --- >>> \(error.localizedDescription)")
    }
    
    
    // This function is added here only for debugging purposes, and can be removed if swizzling is enabled.
    // If swizzling is disabled then this function must be implemented so that the APNs token can be paired to
    // the InstanceID token.
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
        print("\(className) Deployment \(deviceToken)")
        
        Messaging.messaging().apnsToken = deviceToken
        
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
//        InstanceID.instanceID().setAPNSToken(deviceToken, type: InstanceIDAPNSTokenType.prod)
        
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
            // Save FCM Token
        }
    }
    // [END connect_on_active]
    
    // [START disconnect_from_fcm]
    func applicationDidEnterBackground(_ application: UIApplication) {
        Messaging.messaging().disconnect()
        //print("Disconnected from FCM.")
    }
    //end firebase
    
    func convertStringToDictionary(text: String) -> [String:AnyObject]? {
        if let data = text.data(using: String.Encoding.utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String:AnyObject]
            } catch let error as NSError {
                print(error)
            }
        }
        return nil
    }
    
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
        
        if error == nil {
            googleUser = user
            NotificationCenter.default.post(name: NSNotification.Name("GoogleSignInNotif"), object: nil)
        }
        
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
            insTanceIdToken = fcmToken
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
                        insTanceIdToken = InstanceID.instanceID().token()!

                    }else {
                        print("\(self.className)FIRInstanceID.instanceID().token() ----->>> NIL")

                        return
                    }
                }
            }
        }else {
            print("\(className) No Internet Connection")
        }

    }
}

@available(iOS 10, *)
extension AppDelegate : UNUserNotificationCenterDelegate {
    
    // Receive displayed notifications for iOS 10 devices.
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        // Print message ID.
//        if let messageID = userInfo[gcmMessageIDKey] {
//            print("\(className) Message ID: \(messageID)")
//        }
        
        if userInfo[gcmMessageIDKey] != nil {
//            print("Message ID: \(messageID)")
        }
        
        // Print full message.
        //print("- \n willPresent notification: \(userInfo) \n")
        
        let result = self.convertStringToDictionary(text:userInfo["message"] as! String)
        receiveMessageSwitch(result: result!)
        
        //push received here
        // Change this to your preferred presentation option
        completionHandler([])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        // Print message ID.
        if userInfo[gcmMessageIDKey] != nil {
            //print("Message ID: \(messageID)")
        }
        
        // Print full message.
        //print("- \n didReceive response: \(userInfo) \n")
        let result = self.convertStringToDictionary(text:userInfo["message"] as! String)
        receiveMessageSwitch(result: result!)
        
        completionHandler()
    }
    
    func receiveMessageSwitch(result: [String:AnyObject]) {
        let type = result["Type"] as! Int
//        let message = try JSONSerialization.jsonObject(with: result, options: .mutableContainers) as! NSDictionary
        print("\(className) receiveMessageSwitch typemessage ---->>> \(type) ----")
        
        switch (type) {
        case 0:
            
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameStartNotification"), object: nil)
            break
            
        case 1:
            
            // Receives Rewards List
//            CurrentEvent = FPCurrentEvent(json: message.dictionaryObject!)
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showRewardListViewNotification"), object: nil)
            break
            
        case 2:
            
            // Recieves Set of Questions
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "EndEventNotification"), object: nil)
//            CurrentQuestion = FPQuestion(json: message.dictionaryObject!)
//            CurrentChoices = [FPChoice]()
//            for (_,subJson) in message["Choices"] {
//                if let tmpObj = FPChoice(json: subJson.dictionaryObject!) {
//                    CurrentChoices.append(tmpObj)
//                }
//            }
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TriviaQuestionNotification"), object: nil)
            break
            
        case 4:
            
            // Receives Roundresults Score
            
//            RoundResult = FPRoundResult(json: message.dictionaryObject!)
//
//            while RoundResult!.HomeTeamPercentage == nil {
//                print("while loop is running")
//                RoundResult = FPRoundResult(json: message.dictionaryObject!)
//            }
//
//            DispatchQueue.global().sync {
//                print(" --->>> 1 --- InsertData")
//                RoundResult = FPRoundResult(json: message.dictionaryObject!)
//                print(" --->>> 2 --- NotificationCenter")
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "RoundResultNotification"), object: nil)
//                print(" --->>> 3 --- While Loop False and Ends...")
//            }
            break
            
        case 5:
            
            // Recieves FinalResults
//            GlobalUser?.IsInGame = false
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameEndNotification"), object: nil)
//
//            if SharedPreference().getGameType() == GAME_TYPE.RIVALRY {
//
//                RoundResult = FPRoundResult(json: message.dictionaryObject!)
//
//                while RoundResult!.HomeTeamPercentage == nil {
//                    print("while loop is running")
//                    RoundResult = FPRoundResult(json: message.dictionaryObject!)
//                }
//
//                DispatchQueue.global().sync {
//                    print(" --->>> 1 --- InsertData")
//                    RoundResult = FPRoundResult(json: message.dictionaryObject!)
//                    print(" --->>> 2 --- NotificationCenter")
//                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: "GameSummaryNotification"), object: nil)
//                    print(" --->>> 3 --- While Loop False and Ends...")
//
//                    print("RoundResults Data -->> \(RoundResult!)")
//                }
//
//            }else {
//                EliminationLeaderboard = FPEliLeaderboard(json: message.dictionaryObject!)
//                NotificationCenter.default.post(name: NSNotification.Name(rawValue: "showLeaderboard"), object: nil)
//            }
            break
            
        case 7:
            
//            EliminationQuestion = FPEliminationQuestion(json: message.dictionaryObject!)
            // ShowEliminationQuestion
//            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "ShowEliminationQuestion"), object: nil)
            
            break
        default:
            print("done")
        }
    }
}


// [END ios_10_message_handling]
// [START ios_10_data_message_handling]
@available(iOS 10.0, *)
extension AppDelegate : MessagingDelegate {
    // Receive data message on iOS 10 devices while app is in the foreground.
    func application(received remoteMessage: MessagingRemoteMessage) {
                print("\(className)- \n applicationReceivedRemoteMessage: \(remoteMessage.appData) \n")
        
        //        //print("---remoteMessage-->>>> \(remoteMessage.appData)")
        
        let result = self.convertStringToDictionary(text:remoteMessage.appData["message"] as! String)
        receiveMessageSwitch(result: result!)
        
        print("\(className)---result-->>> \(String(describing: result))")
        
    }
}
// [END ios_10_data_message_handling]
