//
//  FriendsTableUITests.swift
//  TechTest
//
//  Created by Ranjit Singh
//

import XCTest

class FriendsTableUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testBasic_Behavior() {
        
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Friends"].staticTexts["Friends"].tap()
        
        let friendstableviewTable = app.tables["FriendsTableView"]
        friendstableviewTable.cells.containing(.staticText, identifier:"Title1").element.tap()
        
//        let friendsButton = app.navigationBars["Friend"].buttons["Friends"]
        let friendsButton = app.buttons["Friends"]
        
        friendsButton.tap()
        friendstableviewTable.cells.containing(.staticText, identifier:"Title2").element.tap()
        friendsButton.tap()
        friendstableviewTable.cells.containing(.staticText, identifier:"Title3").element.tap()
        
        let app2 = app
        app2.buttons[" View More Detail "].tap()
//        app2.otherElements["URL"].tap()
    }

    func testFriendsTableView() {
        app.launch()
        
        let friendsTableView = app.tables["FriendsTableView"]
        
        XCTAssertTrue(friendsTableView.exists, "The friends tableview exists")
        
        //Gets an array of cells
        let tableCells = friendsTableView.cells
        XCTAssert(tableCells.element.waitForExistence(timeout: 3.0))
        
        if tableCells.count > 0 {
            //Loop through only first 4 cell.
            let count: Int = (tableCells.count > 4) ? 4 : (tableCells.count - 1)
            
            let promise = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                // It takes to next screen
                tableCell.tap()
                if i == (count - 1) {
                    promise.fulfill()
                }
                // Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            waitForExpectations(timeout: 20, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
