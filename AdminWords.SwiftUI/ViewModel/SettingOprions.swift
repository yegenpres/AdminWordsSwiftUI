//
//  SettingOprions.swift
//  AdminWords.UIKit
//
//  Created by 111 on 19.09.2022.
//

import Foundation

protocol Container {
    var title: String { get }
    var handler: () -> Void { get }
}

enum TableContainer {
    case word(WordsTableContainer)
    case user(UsersTableContainer)
    
    enum WordsTableContainer {
        case imaged(ImagedWord)
        case nonImage(ImageLesWord)
    }
    
    enum UsersTableContainer {
        case subscribed(SubscribedUser)
        case unsubscribed(UnsubsccribedUser)
    }
}

struct SettingOption {
    let title: String
    var options: [TableContainer]
}

enum Result {
    case initial
    case search
    case empty
    case failure(Error)
    case successed([SettingOption])
}



