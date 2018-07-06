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
        viewView.frame = CGRect(x:  -self.view.frame.size.width - 150 , y: 0, width: self.view.frame.size.width - 120, height: self.view.frame.size.height)
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
