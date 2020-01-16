//
//  SearchResult.swift
//  FlickerSearch
//
//  Created by 蘇健豪1 on 2020/1/15.
//  Copyright © 2020 Oyster. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    var photos: Photos
    var stat: String
}

struct Photos: Codable {
    var page: Int
    var pages: Int
    var perpage: Int
    var total: String
    var photo: [Photo]
}

struct Photo: Codable {
    var id: String
    var owner: String
    var secret: String
    var server: String
    var farm: Int
    var title: String
    var ispublic: Int
    var isfriend: Int
    var isfamily: Int
}
