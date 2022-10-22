//
//  API.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

enum API: String {
    
    case newsListUrl = "https://api.jsonbin.io/v3/b/635249d865b57a31e69d9143"
    var urlString: String {
        return self.rawValue
    }
    
}

enum APIAuth: String {
    
    case masterKey = "X-MASTER-KEY"
    case masterValue = "$2b$10$YyUJiWKHl8CtW90XTkp7ru9ysDiWLhw5AsU4UTSSBgV5AUFPyxDfy"
    
}
