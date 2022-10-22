//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import UIKit


class NewsListViewModel: ObservableObject {
    @Published private(set) var loader: Bool = false
    @Published private(set) var newsDataFetched: Bool = false
    @Published private(set) var errorString: String?
    @Published private(set) var resignKeyboard: Bool = false
    
    var records: [Record] = []
    var filteredRecords: [Record] = []
    var dataFetched = false
    let imageCache = NSCache<AnyObject, AnyObject>()
    //API call
    func fetchNewsList() {
        loader = true
        NewsListAPIManager.fetchNewsList(){ [unowned self] result in
            loader = false
            switch result {
            case .success(let response):
                dataFetched = true
                self.records = response.data?.record?.compactMap{$0} ?? []
                filteredRecords = records
                self.newsDataFetched = true
            case .failure(let error):
                errorString = error.errorDescription
            }
        }
    }
    
    
    
    
    func downloadImages(imageURL: String, completionHandler: @escaping ((UIImage?) -> Void)){
        
        if let cachedImage = imageCache.object(forKey: imageURL as NSString) as? UIImage /*(forKey: imageURL) */{
            completionHandler(cachedImage)
        } else {
            NewsListAPIManager.fetchImage(url: imageURL){ imageResult in
        
                if let imageResult = imageResult {
                    let image = UIImage(data: imageResult) ?? UIImage()
                    self.imageCache.setObject(image, forKey: imageURL as NSString)
                    completionHandler(image)
                }
            }
        }
    }
    
    
    func getFilteredRecords(searchText: String) {
        if searchText.isEmpty {
            filteredRecords = records
            resignKeyboard = true
            
        } else {
            filteredRecords = records.filter{ $0.primaryTag?.range(of: searchText, options: .caseInsensitive) != nil
            }
        }
    }
    
    
    func getReadMinutes(time: String) -> String {
        return Constants.bulletPoint.string + " " + time + Constants.readMinutes.string
    }
}

