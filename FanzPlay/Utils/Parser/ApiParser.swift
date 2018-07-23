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
    
    func request<Element: Decodable>(url: String, method: String, params: [String : AnyObject]?, myStruct: Element.Type, postCompleted: @escaping (_ postStruct: Element) -> ()) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        
        switch method {
            case "POST":
                print("\(className) POST method used")
                request.httpMethod = method
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                let jsonData = try? JSONSerialization.data(withJSONObject: params!)
                request.httpBody = jsonData
            case "GET":
                print("\(className) GET method used")
                let userDefault = UserDefaults.standard.value(forKey: "idToken")!
                request.httpMethod = method
                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                request.addValue((userDefault as AnyObject).value(forKey: "Id") as! String, forHTTPHeaderField: "UserId")
                request.addValue((userDefault as AnyObject).value(forKey: "Token") as! String, forHTTPHeaderField: "UserToken")
            default:
                break
        }
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            DispatchQueue.main.async {
                if let err = err {
                    print("Failed to get data from URL", err)
                    return
                }
                
                guard let data = data else { return }
                do {
                    let jsonResults = try JSONDecoder().decode(myStruct, from: data)
                    postCompleted(jsonResults)
                }catch let jsonErr {
                    print("Error Serializing Json", jsonErr)
                }
            }
            }.resume()
    }
    
    
    func imgParser(urlString: String, method: String, postCompleted: @escaping (_ imageData: Data) -> ()) {
        
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        
//        let userDefault = UserDefaults.standard.value(forKey: "idToken")!
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue((userDefault as AnyObject).value(forKey: "Id") as! String, forHTTPHeaderField: "UserId")
//        request.addValue((userDefault as AnyObject).value(forKey: "Token") as! String, forHTTPHeaderField: "UserToken")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if error != nil {
                print("Error === \(error!.localizedDescription)")
                return
            }
            
            DispatchQueue.main.async {
                print("------->>> data == \(data!)")
                postCompleted(data!)
            }
            
            }.resume()
        
    }

    
}







