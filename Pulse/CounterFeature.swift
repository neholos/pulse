//
//  CounterFeature.swift
//  Pulse
//
//  Created by Sasha Jaroshevskii on 02.07.2025.
//

import ComposableArchitecture
import UIKit

@Reducer
struct CounterFeature {
    @ObservableState
    struct State {
        var count = 0
    }
    
    enum Action {
        case incrementButtonTapped
        case decrementButtonTapped
        case resetButtonTapped
        case hapticFeedbackRequested(HapticType)
    }
    
    enum HapticType {
        case success, warning, error
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .incrementButtonTapped:
                state.count += 1
                return .send(.hapticFeedbackRequested(.success))
                
            case .decrementButtonTapped:
                state.count -= 1
                return .send(.hapticFeedbackRequested(.warning))

            case .resetButtonTapped:
                state.count = 0
                return .send(.hapticFeedbackRequested(.error))
                
            case let .hapticFeedbackRequested(type):
                return .run { send in
                    let generator = await UINotificationFeedbackGenerator()
                    await generator.prepare()
                    switch type {
                    case .success:
                        await generator.notificationOccurred(.success)
                    case .warning:
                        await generator.notificationOccurred(.warning)
                    case .error:
                        await generator.notificationOccurred(.error)
                    }
                }
            }
        }
    }
}
