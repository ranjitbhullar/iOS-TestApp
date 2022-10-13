//
//  ContentView.swift
//  Shared
//
//  Created by Ranjit Singh
//

import SwiftUI
import Swinject

struct ContentView: View {
    
    public init() {
        FriendsModule.registerDependencies()
    }
    
    var body: some View {
        NavigationView{
            initializeView()
        }
    }
    
    func initializeView() -> FriendsListView {
        return (Dependency.container?.resolve(FriendsListView.self))!
    }
}
