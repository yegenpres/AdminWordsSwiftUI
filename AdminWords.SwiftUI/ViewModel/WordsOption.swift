//
//  WordsOption.swift
//  AdminWords.UIKit
//
//  Created by 111 on 19.09.2022.
//
import Foundation



protocol WordContainer: Container {
    var word: WordData { get }
}



struct ImagedWord: WordContainer {
    let word: WordData
    let title: String
    let handler: () -> Void
}

struct ImageLesWord: WordContainer {
    let word: WordData
    let title: String
    let handler: () -> Void
}
