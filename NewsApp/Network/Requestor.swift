//
//  Requestor.swift
//  NewsApp
//
//  Created by Sana Kavser  on 21/10/22.
//

import Foundation
import Alamofire

class Requestor {
    
    static let shared = Requestor()

    fileprivate let authHeader = [APIAuth.masterKey.rawValue: APIAuth.masterValue.rawValue]
    func sendRequest<T: Decodable>(url: String, method: HTTPMethod,
                                   parameters: [String:Any]? = nil, headers: HTTPHeaders? = nil, completion: @escaping (_ result: DataResult<T>) -> Void) -> Void {
        Alamofire.request(url, method: method, parameters: parameters, encoding: JSONEncoding.default, headers: authHeader).responseJSON { (response) in
            var result: DataResult<T>
            switch response.result {
            case .success:
                do{
                    guard let data =  response.data else {
                        result = DataResult.failure(.wrap(error: response.error ?? AppError.unknown))
                        return
                    }
                    let decodedData: T = try JSONDecoder().decode(T.self, from: data)
                    result = DataResult.success(APIResponse<T>(statusCode: 200, data: decodedData))
                    
                } catch {
                    result = DataResult.failure(.jsonParseError)
                    
                }
                
            case .failure:
                result = DataResult.failure(.wrap(error: response.error ?? AppError.unknown))
                
            }
            completion(result)
        }
    }
    
    func downloadImages(imageURL: String, completionHandler: @escaping ((Data?) -> Void)) -> Void {
        print(imageURL)
        Alamofire.request(imageURL, method: .get)
            .validate()
            .responseData(completionHandler: { (responseData) in
                guard let data = responseData.data else {
                    return
                }
                completionHandler(data)
                
            })
    }
    
}
