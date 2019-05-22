//
//  JSONResult.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation

struct GitResponse: Decodable {
    var items: [GitEntry] = []
}


struct GitEntry: Decodable {
    var owner: GitIcon
    var description: String
    var name: String
    var stargazers_count: Int
}

struct GitIcon: Decodable {
    var login: String
    var avatar_url: String    
}
