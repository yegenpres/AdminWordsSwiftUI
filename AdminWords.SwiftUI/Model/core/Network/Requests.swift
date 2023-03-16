//
//  Requests.swift
//  AdminWords.UIKit
//
//  Created by 111 on 11.09.2022.
//

import Foundation
import Alamofire

private extension String {
    func p() -> String {
        "%25\(self.encodeUrl)%25"
    }
    
    var encodeUrl : String
    {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    var decodeUrl : String
    {
        return self.removingPercentEncoding!
    }
}
let myURL = URL(string: "https://postman-echo.com/time/valid?timestamp=2016-10-10")

class NetwortProvider {
   static private var administratorKey: String = {
       if let id = Bundle.main.object(forInfoDictionaryKey: "administrator ID") {
           return id as! String
       }
       fatalError("administrator ID diesnt load from info.plist")
    }()
    
    static private var headers: HTTPHeaders = .default
    
    
    
    static private func fetch<T : Codable>(_ query: String, _ type: T.Type, compleatHandler: @escaping ([T]) -> Void, emptyHandler: @escaping () -> Void, failureHandler: @escaping (Error) -> Void) {
        self.headers.add(.init(name: "administratorID", value: administratorKey))
        
        AF.request(query, method: .get, headers: self.headers).responseDecodable(of: Array<T>.self) { response in
            switch response.result {
            case .success(let result) where !result.isEmpty:  compleatHandler(result)
            case .success(let result) where result.isEmpty:  emptyHandler()
            case .failure(let result): failureHandler(result)
            default: print("not good")
            }
        }
    }
    
    class Words<T: Word> {
        class func fetch(wordBy param: WordParam, compleatHandler: @escaping ([T]) -> Void, emptyHandler: @escaping () -> Void, failureHandler: @escaping (Error) -> Void) {
            let quety = HTTPApi.wordsQuery.rawValue + param.toString()
            print(quety)
            print(quety.encodeUrl)
            
            NetwortProvider.fetch(quety, T.self, compleatHandler: compleatHandler, emptyHandler: emptyHandler, failureHandler: failureHandler)
        }
    }
    
    class Users<T: User> {
    
    class func fetch(userBy param: UserParam, compleatHandler: @escaping ([T]) -> Void, emptyHandler: @escaping () -> Void, failureHandler: @escaping (Error) -> Void) {
        let quety = HTTPApi.usersQuery.rawValue + param.toString()
        
        NetwortProvider.fetch(quety, T.self, compleatHandler: compleatHandler, emptyHandler: emptyHandler, failureHandler: failureHandler)
        }
    }
}


fileprivate enum WordRows: String {
    case wordID
    case English
    case RUtranslate
    case EngTranscription
    case RuTranscription
    case Assotiation
    case image
    case SentenceEng
    case SentenceRu
}

 enum WordParam {
        case wordID(String)
        case english(String)
        case ruTranslate(String)
        case engTranscription(String)
        case ruTranscription(String)
        case assotiation(String)
        case image(String)
        case sentenceEng(String)
        case sentenceRu(String)
    
    func toString() -> String {
        switch self {
        case .wordID(let string):
            return "param=\(WordRows.wordID.rawValue)&value=\(string.p())"
        case .english(let string):
            return "param=\(WordRows.English.rawValue)&value=\(string.p())"
        case .ruTranslate(let string):
            return "param=\(WordRows.RUtranslate.rawValue)&value=\(string.p())"
        case .engTranscription(let string):
            return "param=\(WordRows.EngTranscription.rawValue)&value=\(string.p())"
        case .ruTranscription(let string):
            return "param=\(WordRows.RuTranscription.rawValue)&value=\(string.p())"
        case .assotiation(let string):
            return "param=\(WordRows.Assotiation.rawValue)&value=\(string.p())"
        case .image(let string):
            return "param=\(WordRows.image.rawValue)&value=\(string.p())"
        case .sentenceEng(let string):
            return "param=\(WordRows.SentenceEng.rawValue)&value=\(string.p())"
        case .sentenceRu(let string):
            return "param=\(WordRows.SentenceRu.rawValue)&value=\(string.p())"
        }
    }
    }

fileprivate enum UserRows: String {
    case UserID
    case Login
    case Birthday
    case DataOfRegistration
    case DataPayed
    case Mail
    case Telegram
    case TheLastUpdate
    case TheLastVisit
    case IsPayed
    case Visites
    case Viber
    case TelNumber 
}

enum UserParam {
    case userID(String)
    case login(String)
    case birthday(String)
    case dataOfRegistration(String)
    case dataPayed(String)
    case mail(String)
    case telegram(String)
    case theLastUpdate(String)
    case theLastVisit(String)
    case isPayed(Bool)
    case visites(Int)
    case viber(Int)
    case telNumber(Int)
    
    func toString() -> String {
        switch self {
        case .userID(let string):
            return "param=\(UserRows.UserID.rawValue)&value=\(string.p())"
        case .login(let string):
            return "param=\(UserRows.Login.rawValue)&value=\(string.p())"
        case .birthday(let string):
            return "param=\(UserRows.Birthday.rawValue)&value=\(string.p())"
        case .dataOfRegistration(let string):
            return "param=\(UserRows.DataOfRegistration.rawValue)&value=\(string.p())"
        case .dataPayed(let string):
            return "param=\(UserRows.DataPayed.rawValue)&value=\(string.p())"
        case .mail(let string):
            return "param=\(UserRows.Mail.rawValue)&value=\(string.p())"
        case .telegram(let string):
            return "param=\(UserRows.Telegram.rawValue)&value=\(string.p())"
        case .theLastUpdate(let string):
            return "param=\(UserRows.TheLastUpdate.rawValue)&value=\(string.p())"
        case .theLastVisit(let string):
            return "param=\(UserRows.TheLastVisit.rawValue)&value=\(string.p())"
        case .isPayed(let bool):
            return "param=\(UserRows.IsPayed.rawValue)&value=\(String(bool).p())"
        case .visites(let int):
            return "param=\(UserRows.Visites.rawValue)&value=\(String(int).p())"
        case .viber(let int):
            return "param=\(UserRows.Viber.rawValue)&value=\(String(int).p())"
        case .telNumber(let int):
            return "param=\(UserRows.TelNumber.rawValue)&value=\(String(int).p())"
        }
    }
}




