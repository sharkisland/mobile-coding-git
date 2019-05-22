//
//  ServiceError.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation

enum ServiceError: Error {
    
    case noData
    case badRequest
    case serverError
    case networkError
    case unknown
}
