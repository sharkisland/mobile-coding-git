//
//  String.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation


extension String {
    
    var nameFromURL: String? {
        guard let name = split(separator: "/").last else {
            return nil
        }
        return String(name).replacingOccurrences(of: "_", with: " ")
    }
}
