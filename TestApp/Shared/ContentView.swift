//
//  ContentView.swift
//  Shared
//
//  Created by Ranjit Singh
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            FriendsModule.createFriendListView()
        }
    }
}
