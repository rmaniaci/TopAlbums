//
//  TopAlbumsUITests.swift
//  TopAlbumsUITests
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import XCTest

class TopAlbumsUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        
        // given
        let topAlbums = app.navigationBars["TopAlbums"].otherElements["TopAlbums"]
        
        // then
        app.navigationBars["TopAlbums"].otherElements["TopAlbums"].tap()
        
        // when
        XCTAssert(topAlbums.exists)
    }

}
