//
//  MovieModel.swift
//  TestTMBD
//
//  Created by Thiago Bevilacqua on 12/26/19.
//  Copyright © 2019 Thiago Bevilacqua. All rights reserved.
//

import Foundation

struct MovieResponse: Codable {
    var results: [Movie]
}

struct Movie: Codable {
    let title: String?
    let id: Int?
    let release_date: String?
    let overview: String?
    let vote_average: Double?
    
}
