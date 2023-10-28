//
//  Array+Middle.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 28/10/2023.
//

import Foundation

extension Array {

    var middle: Element? {
        guard self.count != 0 else { return nil }

        let middleIndex = (self.count > 1 ? self.count - 1 : self.count) / 2
        return self[middleIndex]
    }

}

extension Range<Int> {

    var middle: Int? {
        guard let first = self.first, let last = self.last else { return nil }

        return Int((Double(last) - Double(first)) / 2.0) + first
    }

}
