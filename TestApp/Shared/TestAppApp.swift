//
//  TestAppApp.swift
//  Shared
//
//  Created by Ranjit Singh
//

import SwiftUI
import Swinject

@main
struct TestAppApp: App {
  
    public init() {
        let _ = Dependency(container: Container())
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
