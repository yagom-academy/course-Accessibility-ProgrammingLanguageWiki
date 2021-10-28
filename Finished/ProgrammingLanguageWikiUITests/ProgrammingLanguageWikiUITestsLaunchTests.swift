//
// © 2021. yagom academy all rights reserved
// This tutorial is produced by Yagom Academy and is prohibited from redistributing or reproducing.
//

import XCTest

class ProgrammingLanguageWikiUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}

func test_PHP검색후_즐겨찾기추가했을때_즐겨찾기항목에추가되는지() {

let app = XCUIApplication()
let mainviewcontrollerSearchbarSearchField = app.searchFields["MainViewController.searchBar"]
mainviewcontrollerSearchbarSearchField.tap()
app.buttons["Next keyboard"].tap()

let hKey = app/*@START_MENU_TOKEN@*/.keys["h"]/*[[".keyboards.keys[\"h\"]",".keys[\"h\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
hKey.tap()
hKey.tap()

let pKey = app/*@START_MENU_TOKEN@*/.keys["p"]/*[[".keyboards.keys[\"p\"]",".keys[\"p\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
pKey.tap()
pKey.tap()
app.tables["PHP 언어 보기"]/*@START_MENU_TOKEN@*/.buttons["PHP IsLikeButton"]/*[[".cells[\"PHP 언어 보기\"]",".buttons[\"즐겨찾기\"]",".buttons[\"PHP IsLikeButton\"]",".cells[\"MainViewController.mainTableView.PHPCell\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
mainviewcontrollerSearchbarSearchField.buttons["Clear text"].tap()
app/*@START_MENU_TOKEN@*/.buttons["MainViewController.listSegmentControl.subview[0]"]/*[[".segmentedControls",".buttons[\"즐겨찾기 항목 보기\"]",".buttons[\"MainViewController.listSegmentControl.subview[0]\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()


}



