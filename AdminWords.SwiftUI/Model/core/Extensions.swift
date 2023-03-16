//
//  Extensions.swift
//  AdminWords.UIKit
//
//  Created by 111 on 20.09.2022.
//

import Foundation

extension Decodable {
    func toDic() -> [String:Any] {
            var dict = [String:Any]()
            let otherSelf = Mirror(reflecting: self)
            for child in otherSelf.children {
                if let key = child.label {
                    dict[key] = child.value
                }
            }
            return dict
        }
}

extension TableContainer: Identifiable {
    var id: UUID {
        UUID()
    }
}




