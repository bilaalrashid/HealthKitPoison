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
            Poisoner().poisonValues(for: Date()).sorted { $0.date < $1.date } .forEach {
                print($0)
                totalSteps += $0.value
            }

            print(totalSteps)
        }
    }
}

#Preview {
    ContentView()
}
