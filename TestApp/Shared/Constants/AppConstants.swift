//
//  AppConstants.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import Foundation

enum AppConstants {
    
    enum ApiEndpoints {
        static let friendsApiUrl = "https://run.mocky.io/v3/ed22f4d0-0ebd-417d-9e08-5e8c0ec631c5"
    }
    
    enum Constants {
        static let friendsListTitle = "list_screen_title".localizedString()
        static let friendsDetailTitle = "detail_screen_title".localizedString()
        static let viewMoreDetailsTitle = "view_more_detail".localizedString()
        static let friendsListCellName = "FriendsListCell"
        static let friendsTableIdentifier = "FriendsTableView"
        static let friendsStoryboardName = "main"
        static let imageCornerRadius = 20.0
        static let imageDetailSize = 200.0
        static let imageListSize = 70.0
        static let padding_10 = 10.0
        static let listRowHeight = 80.0
        static let opacity_01 = 0.1
    }
    
    enum ErrorConstants {
        static let kServiceFailedErrorMeesage = "friends_service_failed".localizedString()
        static let kRepositoryFailedErrorMessage = "repository_failed".localizedString()
        static let kUseCaseFailedErrorMessage = "usecase_failed".localizedString()
        static let kErrorMessage = "error_message".localizedString()
        static let kCellNotFoundError = "cell_not_found".localizedString()
        static let kStoryboardError = "storyboard_failed".localizedString()
    }
}

public extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
}

