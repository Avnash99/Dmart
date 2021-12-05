//
//  HomeViewVM.swift
//  Dmart
//
//  Created by Avinash Shirsath on 04/12/21.
//

import UIKit
import Foundation

class HomeViewVM {
    
    func fetchDataFromURL(urlString: String, handler: @escaping([SampleImageModel])->()) {
        
        CommonUtilitis.showProgressIndicatorHud(message: "Loading...", show: true)
        
        guard let url = URL(string: urlString) else {return}

        APIManager.commonAPIRequestToAlamofire(responseObject: [SampleImageModel].self, url: url, method: .get, param: nil, header: nil) { result in
            switch result {
            case .success(let responseDic):
                CommonUtilitis.showProgressIndicatorHud(message: "Loading", show: false)
                handler(responseDic)
            case .failure(_ ):
                print("No data found.")
            default:
                break
            }
        }
    }
}


struct SampleImageModel: Codable {
    
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case albumId = "albumId"
        case id = "id"
        case title = "title"
        case url = "url"
        case thumbnailUrl = "thumbnailUrl"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        albumId = try values.decodeIfPresent(Int.self, forKey: .albumId)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        url = try values.decodeIfPresent(String.self, forKey: .url)
        thumbnailUrl = try values.decodeIfPresent(String.self, forKey: .thumbnailUrl)
    }
}
