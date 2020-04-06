import XCTest

final class SignInUITests: UITestBase {

    func testValidSignIn() {
        whenISignIn(with: "yoshi@arctouch.com", and: "123")
    }

    func testInvalidSignIn() {
        whenISignIn(with: "yoshi", and: "123")
        XCTAssert(SignInScreen.alertController.element.exists)
    }

    func testEmptyValues() {
        whenISignIn(with: "", and: "")
        XCTAssert(SignInScreen.alertController.element.exists)
    }

}
