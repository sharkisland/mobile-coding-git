//
//  BehaviorRelay+Array.swift
//  MobileCodingGit
//
//  Created by Ignacio Bononi on 21/05/19.
//  Copyright © 2019 Ignacio Bononi. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension BehaviorRelay {
    
    func delete<T>(at index: Int) -> T where Element == [T] {
        var tempValue = value
        let x = tempValue.remove(at: index)
        accept(tempValue)
        return x
    }
    
    
}
