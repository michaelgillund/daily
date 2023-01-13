//
//  DailyApp.swift
//  Daily
//
//  Created by Michael Gillund on 1/6/23.
//

import SwiftUI

var initial = true
@main
struct DailyApp: App {
    
    @StateObject
    private var model = ViewModel()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(model)
                .onChange(of: scenePhase) { newPhase in
                    if newPhase == .active {
                        print("Active")
                        Task{
                            await model.fetch()
                        }
                    } else if newPhase == .inactive {
                        print("Inactive")
                    } else if newPhase == .background {
                        print("Background")
                    }
                }
        }
    }
}
