//
//  ResponseResult.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//


import Foundation

enum DataResult<Value> {
    case success(APIResponse<Value>)
    case failure(AppError)
    
    
    public var response: APIResponse<Value>? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil
        }
    }
}
