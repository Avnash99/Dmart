//
//  APIManager.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import Foundation
import Alamofire

class APIManager {
    
   static func commonAPIRequestToAlamofire<T: Decodable>(responseObject: T.Type,url : URL, method : HTTPMethod, param : [String : Any]?,header:[String:String]?, completionHandler : @escaping (Result<T,NetworkError>) -> Void){
        
        ///  Change AF object to sessionManager after Installing server/client certifacte -
        AF.request(url, method: method, parameters: param, encoding: URLEncoding.default).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(_):
                do {
                    if let data = response.data {
                        let decodedData = try JSONDecoder().decode(T.self, from: data)
                        completionHandler(.success(decodedData))
                    }
                } catch {
                    print("error")
                }
            case .failure(let fail):
                print("failure : \(String(describing: fail.errorDescription))")
                completionHandler(.failure(.badURL))
            default:
                break
            }
        })
    }
}

enum NetworkError: Error {
    case badURL
}
