//
//  GitRepo.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation

struct GitRepo {
    let name: String
    let description: String
    let image: URL?
    var repoOwner: String
    var stars: Int
    
    init?(from entry: GitEntry){
        self.name = entry.name
        self.description = entry.description
        self.image = URL(string: entry.owner.avatar_url)
        self.repoOwner = entry.owner.login
        self.stars = entry.stargazers_count
    }
}
