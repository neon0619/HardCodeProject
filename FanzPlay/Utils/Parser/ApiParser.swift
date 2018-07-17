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
    
    private let className = "--- ApiParser: ------->>>"
    
    func postResults<Element: Decodable>(url: String, params: [String : AnyObject]?, myStruct: Element.Type, postCompleted: @escaping (_ postStruct: Element) -> ()) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let jsonData = try? JSONSerialization.data(withJSONObject: params!)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            DispatchQueue.main.async {
                
                if let err = err {
                    print("Failed to get data from URL", err)
                    return
                }
                
                guard let data = data else { return }
                do {
                
                    let jsonResults = try JSONDecoder().decode(myStruct, from: data)
                    print("\(self.className) == jsonResults \(jsonResults)")
                    postCompleted(jsonResults)

                    
                }catch let jsonErr {
                    print("Error Serializing Json", jsonErr)
                }
            }
            }.resume()
    }
}

