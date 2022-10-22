//
//  NewsDetailViewModel.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation
import UIKit


class NewsDetailViewModel: ObservableObject {
    
    var record: Record?
    
    init(record: Record) {
        self.record = record
    }
    
    func getReadMinutes(time: String) -> String {
        return Constants.bulletPoint.string + " " + time + Constants.readMinutes.string
    }
    
}
