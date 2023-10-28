//
//  Poisoner.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct Poisoner {

    let poisonTypes = [HealthType.stepCount, HealthType.heartRate]

    func poison(for date: Date) async throws {
        let poisonValues = self.poisonValues(for: date)

        for value in poisonValues {
            let quantity = HKQuantity(unit: value.unit, doubleValue: value.value)
            let sample = HKQuantitySample(type: value.sampleType, quantity: quantity, start: value.date, end: value.date)
            try await HKHealthStore().save(sample)
        }
    }

    func poisonValues(for date: Date) -> [HealthValue] {
        var activityHours = self.activityHours(for: date)
        activityHours[-1] = activityHours[0]
        activityHours[24] = activityHours[23]

        var values = [HealthValue]()

        let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: date, direction: .forward)!

        for index in 0...23 {
            let hour = index
            let activityLevel = activityHours[hour]!
            let previousActivityLevel = activityHours[hour-1]!
            let nextActivityLevel = activityHours[hour+1]!

            let hourDate = Calendar.current.date(bySetting: .hour, value: hour, of: midnight)!
            values.append(contentsOf: self.values(for: hourDate, activityLevel: activityLevel, previousActivityLevel: previousActivityLevel, nextActivityLevel: nextActivityLevel))
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

    func values(for hour: Date, activityLevel: ActivityLevel, previousActivityLevel: ActivityLevel, nextActivityLevel: ActivityLevel) -> [HealthValue] {
        var values = [HealthValue]()

        self.poisonTypes.forEach { type in
            let minutes = self.randomMinutes()
            minutes.forEach { minute in
                if let value = self.randomValue(for: hour, minute: minute, activityLevel: activityLevel, previousActivityLevel: previousActivityLevel, nextActivityLevel: nextActivityLevel, type: type) {
                    values.append(value)
                }
            }
        }

        return values
    }

    func randomValue(for hour: Date, minute: Int, activityLevel: ActivityLevel, previousActivityLevel: ActivityLevel, nextActivityLevel: ActivityLevel, type: HKQuantityType) -> HealthValue? {
        guard let config = self.config(for: activityLevel, type: type) else { return nil }

        let range = config.range
        let unit = config.unit
        let minValue = config.min

        var value = Int.random(in: range)

        let adjustedMinute = Calendar.current.date(bySetting: .minute, value: minute, of: hour)!
        let date = Calendar.current.date(bySetting: .second, value: Int.random(in: 0..<59), of: adjustedMinute)!

        let previousHourDifference = previousActivityLevel.rawValue - activityLevel.rawValue
        let previousMinuteThreshold = Double(abs(previousHourDifference) * 10)

        let nextHourDifference = nextActivityLevel.rawValue - activityLevel.rawValue
        let nextMinuteThreshold = Double(abs(nextHourDifference) * 10)

        // This is deliberately imperfect - there should be some dramatic spikes in activity (as long as they don't occur on hour boundaries)
        if Double(minute) < previousMinuteThreshold {
            let averagePreviousValue = range.middle!
            let transitionAverage = (Double(averagePreviousValue) + Double(value)) / 2.0

            let difference = value - Int(transitionAverage)
            value = value - difference - (minute * previousHourDifference)
        } else if Double(minute) > (60 - nextMinuteThreshold) {
            let averageNextValue = range.middle!
            let transitionAverage = (Double(averageNextValue) + Double(value)) / 2.0

            let difference = value - Int(transitionAverage)
            value = value - difference - ((60 - minute) * previousHourDifference)
        }

        if value < minValue {
            return nil
        }

        return HealthValue(sampleType: type, value: Double(value), unit: unit, date: date)
    }

    func config(for activityLevel: ActivityLevel, type: HKQuantityType) -> (range: Range<Int>, unit: HKUnit, min: Int)? {
        switch type {
        case HealthType.stepCount:
            switch activityLevel {
            case .resting:
                return nil
            case .awake:
                return (1..<20, .count(), 0)
            case .lowIntensity:
                return (5..<50, .count(), 0)
            case .mediumIntensity:
                return (50..<80, .count(), 0)
            case .highIntensity:
                return (80..<150, .count(), 0)
            case .extremeIntensity:
                return (140..<300, .count(), 0)
            }
        case HealthType.heartRate:
            switch activityLevel {
            case .resting:
                return (50..<70, .count().unitDivided(by: .minute()), 50)
            case .awake:
                return (50..<70, .count().unitDivided(by: .minute()), 50)
            case .lowIntensity:
                return (55..<80, .count().unitDivided(by: .minute()), 50)
            case .mediumIntensity:
                return (67..<85, .count().unitDivided(by: .minute()), 50)
            case .highIntensity:
                return (80..<100, .count().unitDivided(by: .minute()), 50)
            case .extremeIntensity:
                return (100..<140, .count().unitDivided(by: .minute()), 50)
            }
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
