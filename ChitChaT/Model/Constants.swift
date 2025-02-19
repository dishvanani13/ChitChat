//
//  Constants.swift
//  ChitChaT
//
//  Created by Disha Limbani on 2024-02-04.
//

struct K {
    static let appName = "⚡️ChitChat"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "CellMessage"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}

