//
//  CounterView.swift
//  Pulse
//
//  Created by Sasha Jaroshevskii on 03.07.2025.
//

import SwiftUI
import ComposableArchitecture

struct CounterView: View {
    let store: StoreOf<CounterFeature>
    
    var body: some View {
        VStack {
            Text("\(store.count)")
                .font(.largeTitle)
                .monospacedDigit()
                .padding()
                .contentTransition(.numericText())
            
            HStack {
                Button("-") {
                    store.send(.decrementButtonTapped, animation: .default)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
                
                Button("+") {
                    store.send(.incrementButtonTapped, animation: .default)
                }
                .font(.largeTitle)
                .padding()
                .background(Color.black.opacity(0.1))
                .cornerRadius(10)
            }
            
            Button("Reset") {
                store.send(.resetButtonTapped, animation: .default)
            }
            .font(.largeTitle)
            .padding()
            .background(Color.black.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

#Preview {
    CounterView(
        store: Store(initialState: CounterFeature.State()) {
            CounterFeature()
        }
    )
}
