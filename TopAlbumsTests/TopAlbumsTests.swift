//
//  TopAlbumsTests.swift
//  TopAlbumsTests
//
//  Created by Ross Maniaci on 11/30/18.
//  Copyright © 2018 Ross Maniaci. All rights reserved.
//

import XCTest
@testable import TopAlbums

class TopAlbumsTests: XCTestCase {
    var controller: TopAlbumsViewController!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        controller = TopAlbumsViewController()
        controller.loadViewIfNeeded()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        controller = nil
        super.tearDown()
    }

    func testAlbumCell() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let albumCell = controller.topAlbumsTableView.dequeueReusableCell(withIdentifier: "AlbumCell")
        XCTAssertNotNil(albumCell, "Top Albums View Controller should be able to dequeue reusable cell with identifier 'AlbumCell'")
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            controller.topAlbumsTableView.reloadData()
        }
    }

}
