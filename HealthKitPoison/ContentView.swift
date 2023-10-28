//
//  ContentView.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import SwiftUI

struct ContentView: View {

    @State private var message = "Loading...\n"

    var body: some View {
        ScrollView {
            Text(self.message)

            Button("Poison Today") {
                Task {
                    await self.savePoisonData(for: Date())
                }
            }
            .buttonStyle(.borderedProminent)

            if #available(iOS 16, *) {
                Button("Poison Last Month") {
                    Task {
                        await self.savePoisonDataForPastMonth()
                    }
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .onAppear {
            Task {
                await authorise()
            }
        }
    }

    private func authorise() async {
        do {
            let _ = try await HealthManager.authorise()
            self.message += "Authorised\n"
        } catch let error {
            self.message += "Error: \(error.localizedDescription)\n"
        }
    }

    @available(iOS 16, *)
    private func savePoisonDataForPastMonth() async {
        let endDate = Date()
        let startDate = Calendar.current.date(byAdding: .day, value: -30, to: endDate)!

        let dayDurationInSeconds: TimeInterval = 60 * 60 * 24

        for date in stride(from: startDate, to: endDate, by: dayDurationInSeconds) {
            await self.savePoisonData(for: date)
        }
    }

    private func savePoisonData(for date: Date) async {
        do {
            try await Poisoner().poison(for: date)
            self.message += "Poisoned \(date.formatted())\n"
        } catch let error {
            self.message += "Error: \(error.localizedDescription)\n"
        }
    }

}

#Preview {
    ContentView()
}
