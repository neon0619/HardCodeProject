//
//  UserDataModel.swift
//  FanzPlay
//
//  Created by IOS Dev on 6/29/18.
//  Copyright © 2018 IOS Dev. All rights reserved.
//

import Foundation

struct CurrentUser: Decodable {
    let Status: String?
    let Data: UserData?
    let Message: [String]?
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

