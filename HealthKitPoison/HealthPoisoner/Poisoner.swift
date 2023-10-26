//
//  Poisoner.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct Poisoner {

    enum ActivityLevel {
        case resting, awake, moderateExercise, intenseExercise
    }

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
        return [
            0: .resting,
            1: .resting,
            2: .resting,
            3: .resting,
            4: .resting,
            5: .resting,
            6: .resting,
            7: .resting,
            8: .awake,
            9: .awake,
            10: .awake,
            11: .awake,
            12: .moderateExercise,
            13: .awake,
            14: .awake,
            15: .awake,
            16: .awake,
            17: .awake,
            18: .awake,
            19: .intenseExercise,
            20: .moderateExercise,
            21: .awake,
            22: .resting,
            23: .resting,
        ]
    }

    func values(for hour: Date, activityLevel: ActivityLevel) -> [HealthValue] {
        let types = [HealthType.stepCount]

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
                value = Int.random(in: 1..<30)
            case .moderateExercise:
                value = Int.random(in: 20..<50)
            case .intenseExercise:
                value = Int.random(in: 50..<120)
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

        // Tracker issue/outage (happens often)
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
