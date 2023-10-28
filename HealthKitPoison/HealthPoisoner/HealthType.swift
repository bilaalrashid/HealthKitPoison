//
//  HealthType.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct HealthType {

    static let stepCount = HKQuantityType.quantityType(forIdentifier: .stepCount)!
    static let heartRate = HKQuantityType.quantityType(forIdentifier: .heartRate)!

}
