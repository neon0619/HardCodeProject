//
//  ApiParser.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/28/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit


class ApiParser: NSObject {
    
    func postMethod(url: String, model: Decodable) {
        
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            
            guard let data = data else { return }
            
            do {
//                let objects = try JSONDecoder().decode(model.self, from: data)
            } catch let jsonErr {
                print("Error Serializing Json", jsonErr)
            }
            
        }.resume()
        
        
    }
    
}
