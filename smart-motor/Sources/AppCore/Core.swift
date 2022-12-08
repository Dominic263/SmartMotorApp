//
//  File.swift
//  
//
//  Created by DOMINIC NDONDO on 12/8/22.
//
import ComposableArchitecture
import Foundation

//MARK - Tabs in the app
public enum Tab {
    case configurations
    case train
    case run
}

public struct AppFeature: ReducerProtocol {
    
    public init() {}
    
   
    public struct State: Equatable {
        
        public var selectedTab: Tab
        
        public init(tab: Tab = .train) {
            self.selectedTab = tab
        }
    }
    
    public enum Action: Equatable {
        case none
        case changeTab(Tab)
    }
    
    //Dependencies go here
    public var body: some ReducerProtocol<State, Action> {
        Reduce { state, action in
            switch action {
            case .none:
                return .none
            case .changeTab(let newTab):
                state.selectedTab = newTab
                return .none
            }
        }
        //Other Reducers being scoped into this App Reducer Goes here
    }
}
