//
//  SideMenu.swift
//  HardCodeProject
//
//  Created by IOS Dev on 3/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SideMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let className = "--- SideMenu: ------->>>"
    
    // UIView
    lazy var viewController: UIView = {
        let viewView = UIView()
        viewView.backgroundColor = UIColor.gray
        return viewView
    }()
    
    lazy var sideMenuTable: UITableView = {
        let tblView = UITableView()
        tblView.frame = CGRect(x:  -self.view.frame.size.width - 150  , y: 80, width: self.view.frame.size.width - 120, height: self.view.frame.size.height - 80)
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        tblView.backgroundColor = UIColor.red
        tblView.dataSource = self
        tblView.delegate = self
        
        return tblView
    }()
    
    lazy var titleLbl: UILabel = {
        
        let lblLbl = UILabel()
        lblLbl.frame = CGRect(x: -self.view.frame.size.width - 150 + 30, y: 30, width: 160, height: 20)
        lblLbl.backgroundColor = UIColor.green
        lblLbl.text = "Label Here"
        lblLbl.textColor = UIColor.white
        
        return lblLbl
        
    }()
    
    var isSideMenuOpen = false
    
    private let myArray: NSArray = ["First","Second","Third"]
    private var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("sideMenuTable.frame ----->>> \(sideMenuTable.frame.debugDescription)")
        
        sortUIByDeviceType()
        
    }
    
    //    func hideSideMenu() {
    //        viewController.frame = CGRect(x: -viewController.frame.size.width - 150, y: 0, width: self.view.frame.size.width - 120, height: self.view.frame.size.height)
    //        sideMenuTable.frame = CGRect(x: -viewController.frame.size.width - 150, y: 80, width: self.view.frame.size.width - 120, height: self.view.frame.size.height - 80)
    //        titleLbl.frame = CGRect(x: -viewController.frame.size.width - 150 + 30, y: 30, width: 160, height: 20)
    //    }
    //
    //    func showSideMenu() {
    //        viewController.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width - 120, height: self.view.frame.size.height)
    //        sideMenuTable.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width - 120, height: self.view.frame.size.height - 80)
    //        titleLbl.frame = CGRect(x: 30, y: 30, width: 160, height: 20)
    //    }
    
    
    func hideSideMenuDown() {
        viewController.frame = CGRect(x: -viewController.frame.size.width - 150, y: 0, width: self.view.frame.size.width - 120, height: self.view.frame.size.height)
        sideMenuTable.frame = CGRect(x: -viewController.frame.size.width - 150, y: 80, width: self.view.frame.size.width - 120, height: self.view.frame.size.height - 80)
        titleLbl.frame = CGRect(x: -viewController.frame.size.width - 150 + 30, y: 30, width: 160, height: 20)
    }
    
    func showSideMenuUp() {
        viewController.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width - 120, height: self.view.frame.size.height)
        sideMenuTable.frame = CGRect(x: 0, y: 80, width: self.view.frame.size.width - 120, height: self.view.frame.size.height - 80)
        titleLbl.frame = CGRect(x: 30, y: 30, width: 160, height: 20)
    }
    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigMainVcSetup(outletRects: VIEW_CONFIG_SIDEMENU.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    // Configure frames method
    func uiConfigMainVcSetup(outletRects: [String: Array<CGRect>]) {
        
        viewController.frame          = outletRects["viewController"]![0]
//        btnPlay.frame               = loginRects["btnPlay"]![0]
//        btnGameRules.frame          = loginRects["btnGameRules"]![0]
//        btnTermPolicy.frame         = loginRects["btnTermsPolicy"]![0]
//        
//        viewRewards.frame           = loginRects["viewRewards"]![0]
//        imgRewardsIcon.frame        = loginRects["viewRewards"]![1]
//        lblRewards.frame            = loginRects["viewRewards"]![2]
//        
//        viewStats.frame             = loginRects["viewStats"]![0]
//        imgStatsIcon.frame          = loginRects["viewStats"]![1]
//        lblStats.frame              = loginRects["viewStats"]![2]
//        
//        viewGamerules.frame         = loginRects["gameRules"]![0]
//        lblGameRules.frame          = loginRects["gameRules"]![1]
//        btnClosePopUp.frame         = loginRects["gameRules"]![2]
//        txtVRulesContent.frame      = loginRects["gameRules"]![3]
        
    }
    
    
    // TableView didSelectRow
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
        
        switch indexPath.row {
        case 0:
            break
        case 1:
            break
        case 2:
            print("\(className) signOut Triggered")
            NotificationCenter.default.post(name: NSNotification.Name("triggerSignOut"), object: nil)
        default:
            break
        }
        
    }
    
    // Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath as IndexPath)
        cell.textLabel!.text = "\(myArray[indexPath.row])"
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
}
