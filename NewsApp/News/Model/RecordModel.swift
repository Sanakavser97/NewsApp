//
//  RecordModel.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

struct Record : Codable {
    let title : String?
    let postUrl : String?
    let publishedAt : String?
    let postImageUrl : String?
    let readTime : String?
    let primaryTag : String?
    let content : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
        case postUrl = "postUrl"
        case publishedAt = "publishedAt"
        case postImageUrl = "postImageUrl"
        case readTime = "readTime"
        case primaryTag = "primaryTag"
        case content = "content"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        postUrl = try values.decodeIfPresent(String.self, forKey: .postUrl)
        publishedAt = try values.decodeIfPresent(String.self, forKey: .publishedAt)
        postImageUrl = try values.decodeIfPresent(String.self, forKey: .postImageUrl)
        readTime = try values.decodeIfPresent(String.self, forKey: .readTime)
        primaryTag = try values.decodeIfPresent(String.self, forKey: .primaryTag)
        content = try values.decodeIfPresent(String.self, forKey: .content)
    }
}
