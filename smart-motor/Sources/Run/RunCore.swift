//
//  File.swift
//  
//
//  Created by DOMINIC NDONDO on 12/8/22.
//

import Foundation
import ComposableArchitecture

public struct RunFeature: ReducerProtocol {
    public init() {}
    
    public enum Action: Equatable {
        case none
    }
    
    public struct State: Equatable {
        public init() {
            
        }
    }
    
    public func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .none:
            return .none
        }
    }
}
