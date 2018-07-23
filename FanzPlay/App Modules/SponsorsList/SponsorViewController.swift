//
//  SponsorViewController.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/19/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class SponsorViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    
//    @IBOutlet weak var imgBg: UIImageView!
//    @IBOutlet weak var lblDesc: UILabel!
//    @IBOutlet weak var rewardCollectionView: UICollectionView!
//    @IBOutlet weak var imgLogo: UIImageView!
//    @IBOutlet weak var btnMain: UIButton!
    
    let apiParser = ApiParser()
    
    // UIView for MainViewController
    lazy var viewController: UIView = {
        let viewView = UIView()
        viewView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        viewView.backgroundColor = UIColor.darkGray
        return viewView
    }()
    
    
    // UIIMageView for Background
    lazy var bgImage: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        imageView.image = UIImage(named: "bg_splash")
        return imageView
    }()
    
    // UiLabel for lblTitle
    lazy var lblTitle: UILabel = {
        let lblLabel = UILabel()
        lblLabel.text = "FANz are playing for a reward from one of these great brands:"
        lblLabel.textColor = UIColor.white
        lblLabel.textAlignment = .center
        lblLabel.contentMode = .scaleToFill
        lblLabel.numberOfLines = 4
        lblLabel.adjustsFontSizeToFitWidth = true
        lblLabel.font = UIFont(name: "HelveticaNeue-Medium", size: 20)
        return lblLabel
    }()
    
    let leftAndRightPaddings: CGFloat = 80.0
    let numberOfItemsPerRow: CGFloat = 7.0
    let screenSize: CGRect = UIScreen.main.bounds
    var items = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    // UICollectionView for SponsorList
    lazy var cvSponsors: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collView = UICollectionView(frame: CGRect(), collectionViewLayout: layout)
        collView.backgroundColor = UIColor.gray.withAlphaComponent(0.5)
        collView.delegate = self
        collView.dataSource = self
        collView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "collectionCell")
        return collView
    }()
    
    let imgArray = ["http://54.68.7.104:88//sponsor-images/19c465fd40454972973338dcee9a530b/f52d5712c76e4676a1094fe2f7b3fee0","http://54.68.7.104:88//sponsor-images/19c465fd40454972973338dcee9a530b/569ced964ff147a2a9b07a3ca6bbd599", "http://54.68.7.104:88//sponsor-images/19c465fd40454972973338dcee9a530b/1d4d099b9ba4460881419af9f7a20daf"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initiateSubViews()
        sortUIByDeviceType()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        
        
        apiParser.imgParser(urlString: imgArray[indexPath.row], method: "GET") { (imageData) in
            
            DispatchQueue.main.async {
                cell.uiImage.image = UIImage(data: imageData)
                            }
            
            
        }
    
        cell.backgroundColor = UIColor.black

        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
    
    // Get the Arrays of CGRect per Device Type
    @objc func sortUIByDeviceType() {
        switch true {
        case Constants.DEVICE_TYPE.iPhone5:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_5.cgRectArrays)
            print("iphone5")
        case Constants.DEVICE_TYPE.iPhone_6_7:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_6_7.cgRectArrays)
            print("iphone6")
        case Constants.DEVICE_TYPE.iPhone_6P_7P:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_6P_7P.cgRectArrays)
            print("iphone6P")
        case Constants.DEVICE_TYPE.iPhone_X:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPhone_X.cgRectArrays)
            print("iphoneX")
        case Constants.DEVICE_TYPE.iPad.Pro_9:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_9.cgRectArrays)
            print("ipad_9")
        case Constants.DEVICE_TYPE.iPad.Pro_10:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_10.cgRectArrays)
            print("ipad_10")
        case Constants.DEVICE_TYPE.iPad.Pro_12:
            uiConfigMainVcSetup(loginRects: VIEW_CONFIG_SPONSORLIST.iPad_Pro_12.cgRectArrays)
            print("ipad_12")
        default:
            print(" -unknown")
        }
    }
    
    // Configure frames method
    func uiConfigMainVcSetup(loginRects: [String: Array<CGRect>]) {
        
        lblTitle.frame              = loginRects["lblTitle"]![0]
        cvSponsors.frame              = loginRects["cvSponsors"]![0]
//        fpLogo.frame                = loginRects["fpLogo"]![0]
//        btnMainMenu.frame           = loginRects["btnMainMenu"]![0]
    
        
    }
    
    
    // Initiate all the SubViews
    private func initiateSubViews() {
        view.addSubview(viewController)
        view.addSubview(bgImage)
        view.addSubview(lblTitle)
        view.addSubview(cvSponsors)
    }
    
    

}
