//
//  Movie.swift
//  WeaverLearning
//
//  Created by RAFAT TOUQIR RAFSUN on 6/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import Foundation

struct Movie: Decodable {
    let vote_count: UInt
    let id: UInt
    let video: Bool
    let vote_average: Float
    let title: String
    let popularity: Float
    let poster_path: String
    let original_language: String
    let original_title: String
    let adult: Bool
    let overview: String
    let release_date: String
}
