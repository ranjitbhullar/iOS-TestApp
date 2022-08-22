//
//  FriendsTableUITests.swift
//  TestApp
//
//  Created by Ranjit Singh
//

import XCTest

class FriendsUITests: XCTestCase {
    
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
        friendstableviewTable.cells.containing(.staticText, identifier:"JOSH").element.tap()
        
        sleep(1)
        XCTAssert(app.staticTexts["Joshua Peek"].exists)
        let friendsButton = app.buttons["Friends"]
        friendsButton.tap()
        sleep(1)
        friendstableviewTable.cells.containing(.staticText, identifier:"RBAZINET").element.tap()
        sleep(1)
        XCTAssert(app.staticTexts["Rob Bazinet"].exists)
        friendsButton.tap()
        friendstableviewTable.cells.containing(.staticText, identifier:"TREVORTURK").element.tap()
        
        XCTAssert(app.staticTexts["Trevor Turk"].exists)
        app.buttons[" View More Detail "].tap()
        sleep(1)
        XCTAssert(app.otherElements["URL"].exists)
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
            
            let expectation = expectation(description: "Wait for table cells")
            
            for i in stride(from: 0, to: count , by: 1) {
                // Grab the first cell and verify that it exists and tap it
                let tableCell = tableCells.element(boundBy: i)
                // It takes to next screen
                tableCell.tap()
                if i == (count - 1) {
                    expectation.fulfill()
                }
                sleep(1)
                // Back
                app.navigationBars.buttons.element(boundBy: 0).tap()
            }
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(true, "Finished validating the table cells")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
}
