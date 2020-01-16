//
//  ResponseError.swift
//  FlickerSearch
//
//  Created by 蘇健豪1 on 2020/1/15.
//  Copyright © 2020 Oyster. All rights reserved.
//

import Foundation

enum ResponseError: Error {
    case nilData
    case nonHTTPResponse
    case parseError
}
