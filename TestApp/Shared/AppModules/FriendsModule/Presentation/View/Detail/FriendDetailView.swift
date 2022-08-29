//
//  FriendDetailView.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import SwiftUI

struct FriendDetailView: View {
    
    @ObservedObject var viewModel: FriendsDetailViewModel
    
    init(viewModel: FriendsDetailViewModel) {
        self.viewModel = viewModel
        viewModel.fetchFriendDetails()
    }
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: viewModel.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.opacity(AppConstants.Constants.opacity_01)
            }
            .frame(width: AppConstants.Constants.imageDetailSize, height: AppConstants.Constants.imageDetailSize)
            .cornerRadius(AppConstants.Constants.imageCornerRadius)
            
            Text(viewModel.username ?? "")
                .font(.title)
                .padding(.top)
            
            Button(AppConstants.Constants.viewMoreDetailsTitle) {
                
                viewModel.validateUrl()
            }
            .padding(.top)
            .buttonStyle(.borderedProminent)
        
            Spacer()
        }
        .sheet(isPresented: $viewModel.validUrl) {
            SafariView(url:URL(string: (viewModel.htmlUrl)!)!)
        }
    }
}



