import XCTest

final class BlogPostUITests: UITestBase {

    func testValidSignIn() {
        whenISignIn(with: "yoshi@arctouch.com", and: "123")
        XCTAssert(BlogPostScreen.tableView.element.exists)
    }

}

