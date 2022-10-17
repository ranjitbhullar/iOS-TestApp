//
//  PresentationConstants.swift
//  TestApp (iOS)
//
//  Created by Ranjit Singh
//

import Foundation

enum AppConstants {

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
}

public extension String {
    func localizedString() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
}
