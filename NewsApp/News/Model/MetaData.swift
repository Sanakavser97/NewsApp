//
//  MetaData.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
struct Metadata : Codable {
    let id : String?
    let _private : Bool?
    let createdAt : String?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case _private = "private"
        case createdAt = "createdAt"
    }

}

