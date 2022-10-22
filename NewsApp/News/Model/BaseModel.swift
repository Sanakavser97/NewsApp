//
//  Records.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

import Foundation
struct BaseModel : Codable {
    let record : [Record]?
    let metadata : Metadata?

    enum CodingKeys: String, CodingKey {

        case record = "record"
        case metadata = "metadata"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        record = try values.decodeIfPresent([Record].self, forKey: .record)
        metadata = try values.decodeIfPresent(Metadata.self, forKey: .metadata)
    }

}
