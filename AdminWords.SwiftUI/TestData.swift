//
//  TestData.swift
//  AdminWords.SwiftUI
//
//  Created by 111 on 05.10.2022.
//

import Foundation


var testWords: [WordData] = {
    var words = [WordData]()
    
    for i in 0...100 {
        words.append(WordData(testID: i))
    }
    return words
}()

var testSections: [SettingOption] {
    var imagedSection = SettingOption(title: "without image", options: [TableContainer]())
    var withoutImagesSection = SettingOption(title: "with image", options: [TableContainer]())

     testWords.forEach {
         word in
         switch word.wordID.isMultiple(of: 2) {
         case true:
             imagedSection.options.append(.word(
                 .imaged(
                     ImagedWord(word: word, title: "title \(word.wordID)") {}
                 )
             )
         )
         
         default: withoutImagesSection.options.append( .word(
             .nonImage(
                 ImageLesWord(word: word, title: "title \(word.wordID)") {}
             )
         )
     )
         }
     }
   
    return [imagedSection, withoutImagesSection]
 }
