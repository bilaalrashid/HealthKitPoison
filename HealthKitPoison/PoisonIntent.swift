//
//  PoisonIntent.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 28/10/2023.
//

import Foundation
import AppIntents

@available(iOS 16.0, *)
struct PoisonIntent: AppIntent {

    static var title: LocalizedStringResource = "Poison Health Data"

    static var description = IntentDescription("Poison a day's worth of health data")

    func perform() async throws -> some IntentResult {
        try await Poisoner().poison(for: Date())
        return .result()
    }

}
