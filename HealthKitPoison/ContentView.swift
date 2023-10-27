//
//  ContentView.swift
//  HealthKitPoison
//
//  Created by Bilaal Rashid on 26/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            var totalSteps = 0.0
            Poisoner().poisonValues(for: Date()).filter { $0.sampleType == HealthType.stepCount } .sorted { $0.date < $1.date } .forEach {
                print($0.date, $0.value)
                totalSteps += $0.value
            }

            print(totalSteps)
        }
    }
}

#Preview {
    ContentView()
}
