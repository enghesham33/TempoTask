//
//  TempoTaskTests.swift
//  TempoTaskTests
//
//  Created by Hesham Donia on 29/10/2021.
//

import XCTest
@testable import TempoTask

class TempoTaskTests: XCTestCase {
    
    var view: MockNewsItemDetailsView?
    var presenter: NewsItemDetailsPresenter?

    override func setUpWithError() throws {
        view = NewsItemDetailsWireframe.createMockNewsItemDetailsView(newsItem: MockData.newsItem)
        presenter = view?.presenter as? NewsItemDetailsPresenter
    }

    override func tearDownWithError() throws {
        view = nil
        presenter = nil
    }

    func testPresenterNotNil() throws {
        XCTAssertTrue(presenter != nil)
    }
    
    func testAuthorName() throws {
        XCTAssertTrue(view?.getAuthorName() == presenter?.getNewsItemDetails()?.author)
    }
}
