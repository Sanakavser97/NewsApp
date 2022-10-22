//
//  Constants.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import UIKit

enum Constants: String {
    // MARK: - App font
    case appFontBold = "MuktaMahee Bold"
    case appFontRegular = "MuktaMahee Regular"
    
    // MARK: - Date
    case UTC = "UTC"
    
    // MARK: - Alert keys
    case errorKey = "Error"
    case errorMessageKey = "Failed to fetch Data"
    case okKey = "OK"
    
    // MARK: - Label keys
    case noData = "No data found!"
    case doneKey = "Done"
    case readMinutes = " min read"
    case bulletPoint = "\u{2022}"
    
    // MARK: - cell key
    case NewsCellKey = "NewsTableViewCell"
    
    var string: String {
        return self.rawValue
    }
    
}


enum VCConstant: String {
    
    case newsDetailViewController = "NewsDetailViewController"
    
    var id: String {
        return self.rawValue
    }
    
}

enum StoryboardConstant: String {
    
    case main = "Main"
    
    var id: String {
        return self.rawValue
    }
    
}

enum AppUIColor {
    case blueTeal
    case lightOrange
    
    var value: UIColor {
        get {
            switch self {
            case .blueTeal:
                return UIColor(named: "BlueTeal") ?? .white
            case .lightOrange:
                return UIColor(named: "LightOrange") ?? .white
            }
        }
    }
}


enum FormatDate: String {
    case MMMdyyyy = "MMM d, yyyy"
    case yyyMMddHHmmsssSSSZZZZZ = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ"
    
    var value: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = self.rawValue
        return dateFormatter
    }
    
}
