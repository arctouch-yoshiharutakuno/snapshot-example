import XCTest

final class BlogPostUITests: UITestBase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testValidSignIn() {
        whenISignIn(with: "yoshi@arctouch.com", and: "123")
        XCTAssert(app.tables.matching(identifier: "blogPostTableView").element.exists)
    }

}

