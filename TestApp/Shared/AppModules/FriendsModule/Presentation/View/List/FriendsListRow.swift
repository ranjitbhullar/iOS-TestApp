//
//  FriendsListRow.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI

struct FriendsListRow: View {
    
    let item: FriendsListRowViewModel
    
    public init(item: FriendsListRowViewModel) {
        self.item = item
    }
    
    var body: some View {
        NavigationLink(destination: FriendsModule.getFriendDetailView(friendId: self.item.friendId))
         {
            HStack {
                AsyncImage(url: URL(string: item.avatarUrl ?? "")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    Color.gray.opacity(AppConstants.Constants.opacity_01)
                }
                .frame(width: AppConstants.Constants.imageListSize, height: AppConstants.Constants.imageListSize)
                .cornerRadius(AppConstants.Constants.imageCornerRadius)
                
                Text(item.nickname.uppercased()).padding(AppConstants.Constants.padding_10)
                
            }.frame(height: AppConstants.Constants.listRowHeight)
        }
    }
}

