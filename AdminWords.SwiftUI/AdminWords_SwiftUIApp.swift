//
//  AdminWords_SwiftUIApp.swift
//  AdminWords.SwiftUI
//
//  Created by 111 on 29.09.2022.
//

import SwiftUI

@main
struct AdminWords_SwiftUIApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(WordsViewModel())
                .environmentObject(UsersViewModel())
                }
    }
}



