//
//  ItemsList.swift
//  AdminWords.SwiftUI
//
//  Created by 111 on 02.10.2022.
//

import Foundation
import SwiftUI

struct ItemsList<T: PageViewModelBase>: View {
    @ObservedObject private var model: T
    
    
    var items = [SettingOption]()
    let title: String

    @State private var scope: String
    @State private var searchQuery: String = ""
    
    init(title: String, model: T) {
        self.model = model
        self.title = title
        
        self.scope = model.scopeButtonTitles.first!
    }
        
    var body: some View {
        NavigationView {
            switch model.items {
            case .successed(let data): List(data, id: \.title) { section in
                Section(section.title) {
                    ForEach(section.options) { container in
                        ItemContainer(item: container)
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle(title)
            .navigationBarTitleDisplayMode(.automatic)
            
            case .initial: Text("try to find some \(title.split(separator: " ")[0].description)")
                    .foregroundColor(.secondary)
                    .navigationTitle(title)

            case .search: ProgressView()
                    .navigationTitle(title)

            case .empty: Text("Cant find any data by Your request")
                    .navigationTitle(title)

            case .failure(let error): Text("Some error, try one more time \(error.localizedDescription)")
                    .navigationTitle(title)

            }
      
        }
        .searchable(text: $searchQuery)
        .searchScopes($scope) {
            ForEach(model.scopeButtonTitles, id: \.self) { content in
                Text(content).tag(content)
            }
            }
        .onSubmit(of: .search) {
            model.buttonIndex = model.scopeButtonTitles.firstIndex(of: scope)!
            model.find(searchQuery)
            }
    }
}


struct ItemContainer: View {
        
    let item: TableContainer
    
    var body: some View {
        NavigationLink {
            switch(item) {
            case .word(let wordContainer):
                switch(wordContainer) {
                case .nonImage(let word): WordRedactor(word: word.word)
                case .imaged(let word): WordRedactor(word: word.word)
                }
            case .user(let userContainer):
                switch(userContainer) {
                case .unsubscribed(let user): UserRedactor(user: user.user)
                case .subscribed(let user): UserRedactor(user: user.user)
                }
            }
        } label: {
            switch(item) {
            case .word(let wordContainer):
                switch(wordContainer) {
                case .nonImage(let word): HStack {
                    Image(systemName: "star")
                    Text(word.word.english)
                }
                case .imaged(let word): HStack {
                    Image(systemName: "star.fill")
                    Text(word.word.english)
                }
                }
                
            case .user(let userContainer):
                switch(userContainer) {
                case .unsubscribed(let user): HStack {
                    Image(systemName: "star")
                    Text(user.user.login)
                }
                case .subscribed(let user): HStack {
                    Image(systemName: "star.fill")
                    Text(user.user.login)
                }
                }
            }
        }
    }
}


