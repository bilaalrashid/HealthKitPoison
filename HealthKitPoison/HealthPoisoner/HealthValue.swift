//
//  HealthValue.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

class HealthValue {
    var sampleType: HKQuantityType
    var value: Double
    var unit: HKUnit
    var date: Date
    var previousDate: Date
    var metadata: [String : Any]? = nil

    init(sampleType: HKQuantityType, value: Double, unit: HKUnit, date: Date, metadata: [String : Any]? = nil) {
        self.sampleType = sampleType
        self.value = value
        self.unit = unit
        self.date = date
        self.previousDate = Calendar.current.date(byAdding: .second, value: -1, to: date)!
        self.metadata = metadata
    }
}
