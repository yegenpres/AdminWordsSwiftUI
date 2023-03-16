//
//  ContentView.swift
//  AdminWords.SwiftUI
//
//  Created by 111 on 29.09.2022.
//

import SwiftUI
import CoreData

struct ContentView: View {
    private var wordsModel = WordsViewModel()
    private var usersModel = UsersViewModel()
    
    var body: some View {
         TabView {
             ItemsList(title: "Words setings", model: wordsModel)
            .tabItem {
                              Label("Words", systemImage: "w.circle")
                          }
             ItemsList(title: "Users setings", model: usersModel)
             .tabItem {
                               Label("Users", systemImage: "person")
                           }
        }
    }
}



struct Content_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
