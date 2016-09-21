//
//  String+Substring.swift
//  CoreColor
//
//  Created by Nuno Grilo on 06/09/16.
//  Copyright © 2016 Paw Inc. All rights reserved.
//

import Foundation

extension String {
    
    /// Convenience subscript with Int to get character as Character.
    subscript (i: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: i)]
    }
    
    /// Convenience subscript with Int to get character as String.
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    /// Convenience function to get substring Range<Int> instead of Range<Index>.
    subscript (r: Range<Int>) -> String {
        let start = self.index(self.startIndex, offsetBy: r.lowerBound)
        let end = self.index(self.startIndex, offsetBy: r.upperBound)
        
        return self[start...end]
    }
    
    /// Convenience function to get substring with NSRange.
    func substring(withNSRange: NSRange) -> String {
        let start = self.index(self.startIndex, offsetBy: withNSRange.location)
        let end = self.index(start, offsetBy: withNSRange.length)
        let range = Range<String.Index>(uncheckedBounds: (lower: start, upper: end))
        return self.substring(with: range)
    }
    
    /// Convenience function to replace characters with NSRange.
    func replacingCharacters(inNSRange: NSRange, with: String) -> String {
        let start = self.index(self.startIndex, offsetBy: inNSRange.location)
        let end = self.index(start, offsetBy: inNSRange.length)
        let range = Range<String.Index>(uncheckedBounds: (lower: start, upper: end))
        return self.replacingCharacters(in: range, with: with)
    }
    
}
