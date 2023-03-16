//
//  UserData.swift
//  AdminWords.UIKit
//
//  Created by 111 on 06.09.2022.
//

import Foundation

protocol User: Codable {
    var userID: String {get set }
    var login: String {get set }
    var birthday: String {get set }
    var dataOfRegistration: String {get set }
    var dataPayed: String {get set }
    var mail: String {get set }
    var telegram: String {get set }
    var theLastUpdate: String {get set }
    var theLastVisit: String {get set }
    var isPayed: Bool { get set }
    var visites: Int { get set }
    var viber: String { get set }
    var telNumber: String { get set }
}




struct UserData: User {
    var userID,
        login,
        birthday,
        dataOfRegistration,
        dataPayed,
        mail,
        telegram,
        theLastUpdate,
        viber,
        telNumber,
        theLastVisit: String
    var isPayed: Bool
    var visites: Int

   
    init(testID: String) {
        self.userID = testID
        self.login =  "login"
        self.birthday = "birthday"
        self.dataOfRegistration = "dataOfRegistration"
        self.dataPayed = "dataPayed"
        self.mail = "mail"
        self.telegram = "telegram"
        self.theLastUpdate = "theLastUpdate"
        self.theLastVisit = "theLastVisit"
        self.isPayed = false
        self.visites = 0
        self.viber = "0000"
        self.telNumber = "000"
   }

}

extension UserData {
    enum CodingKeys: String, CodingKey {
        case userID = "UserID"
        case login =  "Login"
        case birthday = "Birthday"
        case dataOfRegistration = "DataOfRegistration"
        case dataPayed = "DataPayed"
        case mail = "Mail"
        case telegram = "Telegram"
        case theLastUpdate = "TheLastUpdate"
        case theLastVisit = "TheLastVisit"
        case isPayed = "IsPayed"
        case visites = "Visites"
        case viber = "Viber"
        case telNumber = "TelNumber"
        }
}
