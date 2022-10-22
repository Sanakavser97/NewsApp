//
//  ErrorAlertView.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import UIKit
class ErrorAlertView {
    
    class func alertView(_ error: String?) -> UIAlertController {
        
        let alert = UIAlertController(title: Constants.errorKey.string, message: error, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Constants.okKey.string, style: UIAlertAction.Style.default, handler: nil))

        return alert
    }
    
    
}
