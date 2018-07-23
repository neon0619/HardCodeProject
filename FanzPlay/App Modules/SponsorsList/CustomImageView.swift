//
//  CustomImageView.swift
//  FanzPlay
//
//  Created by IOS Dev on 7/20/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

//class CustomImageView: UIImageView {
//
//    let imageCache = NSCache<AnyObject, AnyObject>()
//    var imgUrlString: String?
//
//    func loadImageUsingUrlString(urlString: String) {
//
//        imgUrlString = urlString
//
//        guard let url = URL(string: urlString) else { return }
//        var request = URLRequest(url: url)
//        image = nil
//
//        if let imgFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            self.image = imgFromCache
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { (data, response, error) in
//
//            if error != nil {
//                print("error \(error!.localizedDescription)")
//                return
//            }
//
//            DispatchQueue.main.async {
//
//                let imgToCache = UIImage(data: data!)
//
//                if self.imgUrlString == urlString {
//                    self.image = self.imageCache as? UIImage
//
//                }
//
//                self.imageCache.setObject(imageCache, forKey: urlString as AnyObject)
//
//            }
//
//            return
//        }.resume()
//
//    }
//
//}

let imageCache = NSCache<AnyObject, AnyObject>()


extension UIImageView {
    
    func loadImageFromUrlString(urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
//        image = nil
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print("Error === \(error!.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                
                self.image = UIImage(data: data!)
                print("------->>> data == \(data!)")
            }
            
        }.resume()
        
    }
    
    
}


















