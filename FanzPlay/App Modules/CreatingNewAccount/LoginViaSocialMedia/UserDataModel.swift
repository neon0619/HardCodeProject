//
//  UserDataModel.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/29/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation

public struct Status: Decodable {
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
    
    let parameters = [
        "Email": "",
        "ProviderKey": "",
        "RegistrationToken": insTanceIdToken,
        "ExternalLoginProvider": "Facebook"
    ]
    override init() {
        apiParser.getResults(url: "", params: parameters as [String : AnyObject], myStruct: Status.self)
    }
    
    private let className = "--- UserDataModel: ------->>>"
    let apiParser = ApiParser()
    
    var userDetails = Dictionary<String, Any>()
    
    
    func postMethod(url: String, params: [String : AnyObject]?, postCompleted: @escaping (_ status: String) -> ()) {
        
        

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

                    let userData = try JSONDecoder().decode(Status.self, from: data)
                    postCompleted(userData.Status!)

                    print("\(self.className) userData == \(String(describing: type(of: userData)))")



                } catch let jsonErr {
                    print("Error Serializing Json", jsonErr)
                }
            }
        }.resume()
    }
    
}

