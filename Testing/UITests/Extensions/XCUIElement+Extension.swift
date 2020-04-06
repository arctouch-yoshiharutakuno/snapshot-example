import XCTest

extension XCUIElement {

    func tapAndTypeText(_ text: String) {
        tap()
        typeText(text)
    }

}
