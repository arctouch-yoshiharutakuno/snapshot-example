import XCTest

final class SignInUITests: UITestBase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testValidSignIn() {
        whenISignIn(with: "yoshi@arctouch.com", and: "123")
    }

    func testInvalidSignIn() {
        whenISignIn(with: "yoshi", and: "123")
        XCTAssertEqual(app.alerts.element.label, "Attention")
        XCTAssert(app.alerts.element.staticTexts["Invalid email or password"].exists)
    }

    func testEmptyValues() {
        whenISignIn(with: "", and: "")
        XCTAssertEqual(app.alerts.element.label, "Attention")
        XCTAssert(app.alerts.element.staticTexts["Invalid email or password"].exists)
    }

}
