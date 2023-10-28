//
//  HealthManager.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct HealthManager {

    // MARK: - Properties

    private static var sampleTypes: Set<HKSampleType> {
        return [
            HealthType.stepCount,
            HealthType.heartRate
        ]
    }

    // MARK: - Public methods

    @available(*, renamed: "authorise()")
    static func authorise(completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let result = try await authorise()
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }

    static func authorise() async throws -> Bool {
        guard HKHealthStore.isHealthDataAvailable() else {
            throw HealthError.notAvailableOnDevice
        }
        
        let write: Set<HKSampleType> = self.sampleTypes
        let read: Set<HKSampleType> = self.sampleTypes
        
        try await HKHealthStore().__requestAuthorization(toShare: write, read: read)
        return true
    }

}
