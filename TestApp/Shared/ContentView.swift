//
//  ContentView.swift
//  Shared
//
//  Created by Ranjit Singh
//

import SwiftUI

struct ContentView: View {
    
    public init() {
        FriendsModule.registerDependencies()
    }
    
    var body: some View {
        NavigationView{
            FriendsModule.getFriendsListView()
        }
    }
}
