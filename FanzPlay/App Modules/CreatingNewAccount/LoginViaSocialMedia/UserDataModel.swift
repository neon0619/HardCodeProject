//
//  UserDataModel.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/29/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation

struct Status: Decodable {
    let Status: String?
    let Data: UserData
}

struct UserData: Decodable {
    let Id: String?
    let Username: String?
    let Email: String?
    let MobileNumber: String?
    let Name: String?
    let Gender: String?
    let AgeRange: Int?
    let FavoriteSport: String?
    let FavoriteEvent: String?
    let FavoriteTeam: String?
    let FavoriteGroupBand: String?
    let FavoriteFood: String?
    let Occupation: String?
    let ZipCode: String?
    let Token: String?
    let SalaryRange: Int?
    let BirthDateDd: Int?
    let BirthDateMm: Int?
    let Url: String?
    let ImageBase64: String?
    let IsLoggedIn: Bool
    let IsInGame: Bool
    let CurrentEventId: String?
    let LoginProvider: String?
    let ProfilePercentage: Double?
    let Preferences: [Preferences]
}

struct Preferences: Decodable {
    let Id: String?
    let Name: String?
    let GameType: Int?
    let TimeStamp: String?
}

class UserDataModel: NSObject {
    
    var userDetails = Dictionary<String, Any>()
    
    func postMethod(url: String, email: String, providerKey: String, registrationToken: String, loginProvider: String) {
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        
        let sEmail = "azura_0619@yahoo.com"
        let sProvKey = "10207874858668769"
        let sRegsKey = "cCBsWGivINo:APA91bHIfvbJNeLNfOF82gyfpZ37MDrJF8kBhsypViCCxcKDXu2ClY0munvsuuC3H0qu8a4zGYMKuOT1PNV5DQfWlXL-VekuNXv0YR2FUPLF2_ue-KBYUPoLe5oD9MDQuG478awP9FEHsQ0UO_afqbREuWa-wcnnaQ"
        let sLogProv = "Facebook"
        
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let query = "{\"Email\": \"\(sEmail)\",\"ProviderKey\": \"\(sProvKey)\",\"RegistrationToken\": \"\(sRegsKey)\",\"ExternalLoginProvider\": \"\(sLogProv)\"}"
        
        request.httpBody = query.data(using: String.Encoding.utf8)
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            
            DispatchQueue.main.async {
                
                if let err = err {
                    print("Failed to get data  from URL", err)
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    
//                    // link in description for video on JSONDecoder
//                    let decoder = JSONDecoder()
//                    // Swift 4.1
//                    decoder.keyDecodingStrategy = .convertFromSnakeCase
//                    self.courses = try decoder.decode([Course].self, from: data)

                    
                    let userData = try JSONDecoder().decode(Status.self, from: data)
//                    print(userData)
                    
                    //                postCompleted(userData)
                    
                } catch let jsonErr {
                    print("Error Serializing Json", jsonErr)
                }
            }
        }.resume()
    }
    
}

