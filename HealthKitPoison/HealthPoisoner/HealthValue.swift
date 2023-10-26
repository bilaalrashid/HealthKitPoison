//
//  HealthValue.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct HealthValue {
    let sampleType: HKQuantityType
    let value: Double
    let unit: HKUnit
    let date: Date
    let metadata: [String : Any]? = nil
}
