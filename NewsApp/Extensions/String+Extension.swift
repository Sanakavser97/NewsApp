//
//  String+Extension.swift
//  NewsApp
//
//  Created by Sana Kavser  on 22/10/22.
//

import Foundation

extension String {
    
    func convertDate(ofFormat: DateFormatter, toFormat: DateFormatter) -> String {
        ofFormat.timeZone = NSTimeZone(name: Constants.UTC.string) as TimeZone?
        let convertedDate = ofFormat.date(from: self)

        guard let convertedDate = convertedDate else {
            return ""
        }
        toFormat.timeZone = NSTimeZone(name: Constants.UTC.string) as TimeZone?
        let timeStamp = toFormat.string(from: convertedDate)
        return timeStamp
    }
    
    
    
}

