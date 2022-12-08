//
//  AppView.swift
//  
//
//  Created by DOMINIC NDONDO on 12/8/22.
//

import SwiftUI
import AppCore
import ComposableArchitecture

public struct AppView: View {
    
    public var store: StoreOf<AppFeature>
    
    public init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    public var body: some View {
        WithViewStore(self.store, observe: {$0}) { viewstore in
            
            TabView(
                selection: viewstore.binding(
                    get:  \.selectedTab ,
                    send:  AppFeature.Action.changeTab
                )
            ) {
                //MARK - VStacks to be replaced by Build Features
                VStack {
                    
                   Text("Train")
                     .font(.title)
                    
                }
                .tabItem({
                    Image(systemName: "figure.strengthtraining.traditional")
                    Text("Train")
                })
                .tag(Tab.train)
                
                    
                RunView(
                    store: store.scope(
                        state: \.runState,
                        action: AppFeature.Action.run
                    )
                )
                .tabItem({
                    Image(systemName: "figure.run")
                    Text("Run")
                        .font(.headline)
                })
                .tag(Tab.run)
                
                ConfigurationsView(
                    store: store.scope(
                        state: \.configState,
                        action: AppFeature.Action.config
                    )
                )
                .tabItem({
                    Image(systemName: "gearshape")
                    Text("Configurations")
                        .font(.headline)
                })
                .tag(Tab.run)
                
            }.background(.mint)
           
        }
    }
    
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(
            store: Store(
                initialState: AppFeature.State(
                    tab: .train,
                    runState: .init(),
                    configState: .init()),
                reducer: AppFeature()
                
            )
        )
    }
}
