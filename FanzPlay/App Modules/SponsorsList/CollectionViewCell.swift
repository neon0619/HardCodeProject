//
//  CollectionViewCell.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    lazy var uiImage: UIImageView = {
        let imgImage = UIImageView()
        imgImage.contentMode = .scaleAspectFit
        imgImage.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        return imgImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(uiImage)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
