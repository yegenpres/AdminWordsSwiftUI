//
//  WordData.swift
//  AdminWords.UIKit
//
//  Created by 111 on 06.09.2022.
//

import Foundation

protocol Word: Codable {
    var wordID: Int { get set }
    var english: String { get set }
    var ruTranslate: String { get set }
    var engTranscription: String { get set }
    var ruTranscription: String { get set }
    var assotiation: String { get set }
    var image: String? { get set }
    var sentenceEng: String? { get set }
    var sentenceRu: String? { get set }
}

struct WordData: Word {
    var wordID: Int
    var english, ruTranslate, engTranscription, ruTranscription, assotiation: String
    var image, sentenceEng, sentenceRu: String?

    
     init(testID: Int) {
         self.wordID = testID
         self.english =  "englist"
         self.ruTranslate = "rutranslate"
         self.engTranscription = "engTransctiption"
         self.ruTranscription = "ruTranscription"
         self.assotiation = "assotiation"
    }
}

extension WordData {
    
    enum CodingKeys: String, CodingKey {
            case wordID = "wordID"
            case english = "English"
            case ruTranslate = "RUtranslate"
            case engTranscription = "EngTranscription"
            case ruTranscription = "RuTranscription"
            case assotiation = "Assotiation"
            case image = "Image"
            case sentenceEng = "SentenceEng"
            case sentenceRu = "SentenceRu"
        }
}


