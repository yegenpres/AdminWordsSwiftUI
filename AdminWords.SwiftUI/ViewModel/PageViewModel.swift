//
//  PageViewModel.swift
//  AdminWords.UIKit
//
//  Created by 111 on 19.09.2022.
//

import Foundation
import Combine

protocol ViewModel: ObservableObject {
    var selectedScopeButtonIndex: Int { get set }
    var scopeButtonTitles: [String] { get }
    
    func find(_ query: String) -> Void
    
    func update(element: TableContainer)
}

typealias PageViewModelBase = PageViewModel & ViewModel

class PageViewModel {
    
    @Published var items = Result.initial
    @Published var item: TableContainer?
    
    var buttonIndex = 0
    var selectedScopeButtonIndex = 0
    var scopeButtonTitles: [String] {
        get {
            return []
        }
    }
    
    func update(element: TableContainer) {
        self.item = element
    }

}
