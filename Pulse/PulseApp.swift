//
//  PulseApp.swift
//  Pulse
//
//  Created by Sasha Jaroshevskii on 13.07.2025.
//

import ComposableArchitecture
import SwiftUI

@main
struct PulseApp: App {
    static let store = Store(initialState: CounterFeature.State()) {
        CounterFeature()
            ._printChanges()
    }
    
    var body: some Scene {
        WindowGroup {
            CounterView(store:  Self.store)
        }
    }
}
