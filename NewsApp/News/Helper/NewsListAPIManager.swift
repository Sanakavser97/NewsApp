//
//  NewsListAPIManager.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation

import Foundation
import UIKit

class NewsListAPIManager{
    
    class func fetchNewsList(completionHandler: @escaping ((DataResult<BaseModel>) -> Void)) {
        
        let url = API.newsListUrl.urlString
        Requestor.shared.sendRequest(url: url, method: .get){ (result: DataResult<BaseModel>) in
                completionHandler(result)
        }
    }
    
    class func fetchImage(url: String, completionHandler: @escaping ((Data?) -> Void)){
        Requestor.shared.downloadImages(imageURL: url) { (imageData) in
                completionHandler(imageData)
        }
    }
    
}
