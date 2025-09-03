//
//  main.swift
//  busca binaria
//
//  Created by Ramael Cerqueira on 03/09/25.
//

import Foundation

print("aw hell no")

extension RandomAccessCollection {
    
    public func bisectToFirstIndex(where predicate: (Element) throws -> Bool) rethrows -> Index? {
        var intervalStart = startIndex
        var intervalEnd = endIndex
        
        while intervalStart != intervalEnd {
            let intervalLength = distance(from: intervalStart, to: intervalEnd)
            
            guard intervalLength > 1 else {
                return try predicate(self[intervalStart]) ? intervalStart : nil
            }
            
            let testIndex = index(intervalStart, offsetBy: (intervalLength - 1) / 2)
            
            if try predicate(self[testIndex]) {
                intervalEnd = index(after: testIndex)
            }
            else {
                intervalStart = index(after: testIndex)
            }
        }
        
        return nil
    }
}

let a = [1,2,3,4]

a.map{$0>=3}
// returns [false, false, true, true]

a.bisectToFirstIndex {$0>=3}
// returns 2




