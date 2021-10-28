//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import XCTest

class ProgrammingLanguageWikiUITests: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app = nil
    }

    func test_PHP검색후_즐겨찾기추가했을때_즐겨찾기항목에추가되는지() {
        // given
        let phpCell = app.cells["PHP 언어 보기"]
        
        // when
        let mainviewcontrollerSearchbarSearchField = app.searchFields["MainViewController.searchBar"]
        mainviewcontrollerSearchbarSearchField.tap()
        app.keys["P"].tap()
        app.keys["h"].tap()
        app.keys["p"].tap()
        app.tables["PHP 언어 보기"].buttons["PHP IsLikeButton"].tap()
        mainviewcontrollerSearchbarSearchField.buttons["Clear text"].tap()
        app.buttons["Search"].tap()
        app.buttons["MainViewController.listSegmentControl.subview[0]"].tap()
        
        // then
        XCTAssertTrue(phpCell.exists)
    }
}

