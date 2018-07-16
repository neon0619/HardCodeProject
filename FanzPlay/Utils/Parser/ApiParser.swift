//
//  ApiParser.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/28/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation
import UIKit

struct Results<Element: Decodable>: Decodable {
    let items: [Element]
}

class ApiParser: NSObject {
    
    private let className = "--- ApiParser: ------->>>"
    
    func getResults<Element: Decodable>(url: String, params: [String : AnyObject]?, myStruct: Element.Type) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let query = "{\"Email\": \"\(String(describing: params!["Email"]))\",\"ProviderKey\": \"\(String(describing: params!["ProviderKey"]))\",\"RegistrationToken\": \"\(String(describing: params!["RegistrationToken"]))\",\"ExternalLoginProvider\": \"\(String(describing: params!["ExternalLoginProvider"]))\"}"
        
        request.httpBody = query.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            DispatchQueue.main.async {
                
                if let err = err {
                    print("Failed to get data  from URL", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    
//                    let userData = try JSONDecoder().decode(Status.self, from: data)
//                    print("\(self.className) userData == \(String(describing: type(of: userData)))")
                    
                    let jsonResults = try JSONDecoder().decode(Results<Element>.self, from: data)
                    //success
                    print("\(self.className) == \(jsonResults)")
                    
                    
                } catch let jsonErr {
                    print("Error Serializing Json", jsonErr)
                }
            }
            }.resume()
    }
    
    
    
//    {
//        //...
//        // On success REST response
//        if response.result.isSuccess {
//
//            do {
//                let jsonResults = try JSONDecoder().decode(Results<Element>.self, from: response.data!)
//                //success
//                print(jsonResults)
//            } catch {
//                //Better not dispose errors silently
//                print(error)
//            }
//        }
//        //...
//    }

    
}

