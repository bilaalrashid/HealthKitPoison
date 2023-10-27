//
//  Poisoner.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct Poisoner {

    func poisonValues(for date: Date) -> [HealthValue] {
        let activityHours = self.activityHours(for: date)

        var values = [HealthValue]()

        for (hour, activityLevel) in activityHours {
            let hourDate = Calendar.current.date(bySetting: .hour, value: hour, of: date)!
            values.append(contentsOf: self.values(for: hourDate, activityLevel: activityLevel))
        }

        return values
    }

    func activityHours(for date: Date) -> [Int: ActivityLevel] {
        let shouldChooseAnomaly = Int.random(in: 0..<30) == 1
        if shouldChooseAnomaly {
            return Personas.anomalies.randomElement()!
        }

        if Calendar.current.isDateInWeekend(date) {
            return Personas.weekend.randomElement()!
        } else {
            return Personas.weekdays.randomElement()!
        }
    }

    func values(for hour: Date, activityLevel: ActivityLevel) -> [HealthValue] {
        let types = [HealthType.stepCount, HealthType.heartRate]

        var values = [HealthValue]()

        types.forEach { type in
            let minutes = self.randomMinutes()
            minutes.forEach { minute in
                if let value = self.randomValue(for: hour, minute: minute, activityLevel: activityLevel, type: type) {
                    values.append(value)
                }
            }
        }

        return values
    }

    func randomValue(for hour: Date, minute: Int, activityLevel: ActivityLevel, type: HKQuantityType) -> HealthValue? {
        let adjustedMinute = Calendar.current.date(bySetting: .minute, value: minute, of: hour)!
        let date = Calendar.current.date(bySetting: .second, value: Int.random(in: 0..<59), of: adjustedMinute)!
        switch type {
        case HealthType.stepCount:
            var value = 0
            switch activityLevel {
            case .resting:
                return nil
            case .awake:
                value = Int.random(in: 1..<20)
            case .lowIntensity:
                value = Int.random(in: 5..<50)
            case .mediumIntensity:
                value = Int.random(in: 50..<80)
            case .highIntensity:
                value = Int.random(in: 80..<150)
            case .extremeIntensity:
                value = Int.random(in: 140..<300)
            }
            return HealthValue(sampleType: type, value: Double(value), unit: .count(), date: date)
        case HealthType.heartRate:
            var value = 0
            switch activityLevel {
            case .resting:
                value = Int.random(in: 50..<70)
            case .awake:
                value = Int.random(in: 50..<70)
            case .lowIntensity:
                value = Int.random(in: 55..<80)
            case .mediumIntensity:
                value = Int.random(in: 67..<85)
            case .highIntensity:
                value = Int.random(in: 80..<100)
            case .extremeIntensity:
                value = Int.random(in: 100..<140)
            }
            return HealthValue(sampleType: type, value: Double(value), unit: .count(), date: date)
        default:
            fatalError()
        }
    }

    func randomMinutes() -> [Int] {
        var minutes = [Int]()

        for minute in 0..<59 {
            let highAvailability = Bool.random()
            let chance = highAvailability ? Int.random(in: 1..<4) : Int.random(in: 1..<5)
            let shouldChoose = chance == 1

            if shouldChoose {
                minutes.append(minute)
            }
        }

        // Simulate tracker issue/outage (happens often)
        let shouldDropData = Int.random(in: 1..<4) == 1
        if shouldDropData {
            let half = minutes.count / 2 + minutes.count % 2
            let head = minutes[0..<half]
            let tail = minutes[half..<minutes.count]

            let shouldChooseHead = Bool.random()
            return Array(shouldChooseHead ? head : tail)
        } else {
            return minutes
        }
    }

}
