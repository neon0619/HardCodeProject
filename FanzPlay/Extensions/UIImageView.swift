//
//  UIImageView.swift
//  FanzPlay
//
//  Created by IOS Dev on 10/10/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func parseImageUrl(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
