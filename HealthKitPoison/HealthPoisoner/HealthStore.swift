//
//  HealthStore.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import Foundation
import HealthKit

struct HealthKitStore {

    @available(*, renamed: "mostRecent(sample:type:)")
    static func mostRecent<T: HKSample>(sample sampleType: HKSampleType, type: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        Task {
            do {
                let result: T = try await mostRecent(sample: sampleType, type: type)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    static func mostRecent<T: HKSample>(sample sampleType: HKSampleType, type: T.Type) async throws -> T {
        let samples1 = try await self.samples(ofType: sampleType, limit: 1, ascending: false, type: type)
        if let mostRecent = samples1.first {
            return mostRecent
        } else {
            throw HealthError.noData
        }
    }

    @available(*, renamed: "samples(ofType:since:limit:ascending:type:)")
    static func samples<T: HKSample>(ofType sampleType: HKSampleType, since startDate: Date = Date.distantPast, limit: Int = 100, ascending: Bool = true, type: T.Type, completion: @escaping (Result<[T], Error>) -> Void) {
        Task {
            do {
                let result: [T] = try await samples(ofType: sampleType, since: startDate, limit: limit, ascending: ascending, type: type)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    static func samples<T: HKSample>(ofType sampleType: HKSampleType, since startDate: Date = Date.distantPast, limit: Int = 100, ascending: Bool = true, type: T.Type) async throws -> [T] {
        let predicate = HKQuery.predicateForSamples(withStart: startDate, end: Date(), options: .strictEndDate)
        let sort = NSSortDescriptor(key: HKSampleSortIdentifierStartDate, ascending: ascending)
        
        return try await withCheckedThrowingContinuation { continuation in
            let query = HKSampleQuery(sampleType: sampleType, predicate: predicate, limit: limit, sortDescriptors: [sort]) { query1, samples, error in
                DispatchQueue.main.async {
                    guard let samples1 = samples as? [T] else {
                        continuation.resume(with: .failure(error ?? HealthError.noData))
                        return
                    }
                    
                    continuation.resume(with: .success(samples1))
                }
            }
            
            HKHealthStore().execute(query)
        }
    }

    @available(*, renamed: "saveQuantity(sample:value:unit:date:metadata:)")
    static func saveQuantity(sample sampleType: HKQuantityType, value: Double, unit: HKUnit, date: Date, metadata: [String : Any]? = nil, completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let result = try await saveQuantity(sample: sampleType, value: value, unit: unit, date: date, metadata: metadata)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    static func saveQuantity(sample sampleType: HKQuantityType, value: Double, unit: HKUnit, date: Date, metadata: [String : Any]? = nil) async throws -> Bool {
        let quantity = HKQuantity(unit: HKUnit.count(), doubleValue: value)
        let sample = HKQuantitySample(type: sampleType, quantity: quantity, start: date, end: date, metadata: metadata)
        
        try await HKHealthStore().save(sample)
        return true
    }

    @available(*, renamed: "saveCategory(sample:value:date:metadata:)")
    static func saveCategory(sample sampleType: HKCategoryType, value: Int, date: Date, metadata: [String : Any]? = nil, completion: @escaping (Result<Bool, Error>) -> Void) {
        Task {
            do {
                let result = try await saveCategory(sample: sampleType, value: value, date: date, metadata: metadata)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
    }
    
    
    static func saveCategory(sample sampleType: HKCategoryType, value: Int, date: Date, metadata: [String : Any]? = nil) async throws -> Bool {
        let sample = HKCategorySample(type: sampleType, value: value, start: date, end: date, metadata: metadata)
        
        try await HKHealthStore().save(sample)
        return true
    }

}
