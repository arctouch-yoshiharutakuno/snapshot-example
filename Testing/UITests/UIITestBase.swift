import XCTest

class UIITestBase: XCTestCase {

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

extension XCUIElement {

    func tapAndTypeText(_ text: String) {
        tap()
        typeText(text)
    }

}
