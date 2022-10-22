//
//  APIResponse.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

public struct APIResponse<Data> {
    let statusCode: Int?
    let data: Data?
    
    init(statusCode: Int?, data: Data?) {
        self.statusCode = statusCode
        self.data = data
    }
}
