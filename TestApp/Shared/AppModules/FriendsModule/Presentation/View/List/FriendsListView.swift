//
//  FriendsListView.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI

struct FriendsListView: View {
    
    @ObservedObject private var viewModel: FriendsListViewModel
    
    init(viewModel: FriendsListViewModel) {
        self.viewModel = viewModel
        viewModel.fetchFriends()
    }
    
    var body: some View {
        List(viewModel.friends) { item in
            FriendsListRow(item: item)
        }
        .navigationTitle(AppConstants.Constants.friendsListTitle)
        .accessibilityIdentifier(AppConstants.Constants.friendsTableIdentifier)
    }
}
