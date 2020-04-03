import XCTest

final class SignInUITests: UIITestBase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testValidSignIn() {
        SignInScreen.emailTextfield.element.tapAndTypeText("yoshi@arctouch.com")
        SignInScreen.passwordTextfield.element.tapAndTypeText("123")
        hideKeyboard()
        SignInScreen.signInButton.element.tap()
    }

    func testInvalidSignIn() {
        SignInScreen.emailTextfield.element.tapAndTypeText("yoshi")
        SignInScreen.passwordTextfield.element.tapAndTypeText("123")
        hideKeyboard()
        SignInScreen.signInButton.element.tap()
        XCTAssertEqual(app.alerts.element.label, "Attention")
        XCTAssert(app.alerts.element.staticTexts["Invalid email or password"].exists)
    }

    func testEmptyValues() {
        SignInScreen.emailTextfield.element.tapAndTypeText("")
        SignInScreen.passwordTextfield.element.tapAndTypeText("")
        hideKeyboard()
        SignInScreen.signInButton.element.tap()
        XCTAssertEqual(app.alerts.element.label, "Attention")
        XCTAssert(app.alerts.element.staticTexts["Invalid email or password"].exists)
    }

}
