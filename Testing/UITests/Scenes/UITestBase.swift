import XCTest

class UITestBase: XCTestCase {

    var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false
        XCUIApplication().launch()
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
        app.terminate()
        app = nil
    }

    func hideKeyboard() {
        app.children(matching: .window).element(boundBy: 0).tap()
    }

}

extension UITestBase {

    func whenISignIn(with email: String, and password: String) {
        XCTContext.runActivity(named: "When I Sign In (with username and password)") { _ in
            SignInScreen.emailTextfield.element.tapAndTypeText(email)
            SignInScreen.passwordTextfield.element.tapAndTypeText(password)
            hideKeyboard()
            SignInScreen.signInButton.element.tap()
        }
    }

}
