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
    static let basalEnergyBurned = HKQuantityType.quantityType(forIdentifier: .basalEnergyBurned)!
    static let activeEnergyBurned = HKQuantityType.quantityType(forIdentifier: .activeEnergyBurned)!
    static let heartRate = HKQuantityType.quantityType(forIdentifier: .heartRate)!

}
