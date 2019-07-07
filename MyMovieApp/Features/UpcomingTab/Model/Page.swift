//
//  Page.swift
//  WeaverLearning
//
//  Created by RAFAT TOUQIR RAFSUN on 6/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import Foundation

struct Page<Model: Decodable>: Decodable {
    let page: UInt
    let total_results: UInt
    let total_pages: UInt
    let results: [Model]
}
