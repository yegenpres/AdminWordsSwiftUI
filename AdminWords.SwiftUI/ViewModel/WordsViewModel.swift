//
//  WordsViewModel.swift
//  AdminWords.UIKit
//
//  Created by 111 on 13.09.2022.
//

import Combine




class WordsViewModel: PageViewModelBase {
    
   override var selectedScopeButtonIndex: Int {
        set {
            if 0 > newValue  || newValue > scopeButtonTitles.count - 1 {
                buttonIndex = 0
            }
            buttonIndex = newValue
        }
        get {
            return buttonIndex
        }
    }
    
    let buttonTitles: [WordData.CodingKeys] = [.wordID, .english, .ruTranslate, .assotiation,]
   override var scopeButtonTitles: [String] {
        get {
            buttonTitles.map { title in
                title.rawValue
            }
        }
    }
    
    func find(_ query: String) {
        let param: WordParam = {
            switch buttonIndex {
            case 1: return .english(query)
            case 2: return .ruTranslate(query)
            case 3: return .assotiation(query)
            default: return .wordID(query)
            }
        }()
        
        self.items = Result.search
        
        NetwortProvider.Words<WordData>.fetch(wordBy: param) { words in
            self.items = self.configureModels(words)
        } emptyHandler : {
            self.items = self.configureModels()
        } failureHandler: { error in
            self.items = Result.failure(error)
        }
    }
        
    private func configureModels(_ result: [WordData] = []) -> Result {
        
       var imagedSection = SettingOption(title: "with image", options: [TableContainer]())
       var withoutImagesSection = SettingOption(title: "with image", options: [TableContainer]())

        result.forEach {
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
      
       let final = [imagedSection, withoutImagesSection]
         
        if final.isEmpty {
            return Result.empty
        }
        
        return Result.successed(final)
    }
      
}


