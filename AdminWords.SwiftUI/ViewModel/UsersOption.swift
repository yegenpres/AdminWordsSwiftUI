//
//  UsersOption.swift
//  AdminWords.UIKit
//
//  Created by 111 on 19.09.2022.
//

import Foundation

protocol UserContainer: Container {
    var user: UserData { get }
}



struct SubscribedUser: UserContainer {    
    let user: UserData
    let title: String
    let handler: () -> Void
}

struct UnsubsccribedUser: UserContainer {
    let user: UserData
    let title: String
    let handler: () -> Void
}
