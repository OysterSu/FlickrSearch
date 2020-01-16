//
//  FirstVeiwModel.swift
//  FlickerSearch
//
//  Created by 蘇健豪1 on 2020/1/14.
//  Copyright © 2020 Oyster. All rights reserved.
//

import Foundation
import Alamofire

class FirstViewModel {
    class func search(string: String, perPage: Int, callback: @escaping (Result<SearchResult>) -> Void) {
        let url = URL(string: "https://api.flickr.com/services/rest/")!
        let parms = [
            "api_key": "b3e134164b35baac74473ff116b325e9",
            "text": string,
            "per_page": perPage,
            "format": "json",
            "method": "flickr.photos.search",
            "nojsoncallback": "1"
        ] as [String : Any]
                
        Alamofire.request(url, method: .post, parameters: parms, headers: nil).responseData { response in
            if let error = response.error {
                callback(.failure(error))
                return
            }

            guard let data = response.data else {
                callback(.failure(response.error!))
                return
            }

            let decoder = JSONDecoder()
            let result = Result{ try decoder.decode(SearchResult.self, from: data) }
            
            switch result {
            case .success(let value):
                callback(.success(value))
            case .failure(let error):
                callback(.failure(error))
            }
        }
    }
    
}
