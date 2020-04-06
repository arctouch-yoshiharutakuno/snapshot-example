import XCTest

enum SignInScreen {
    case emailTextfield
    case passwordTextfield
    case signInButton
    case alertTitle
    case alertBody

    var element: XCUIElement {
        switch self {
        case .emailTextfield:
            return XCUIApplication().textFields["Email"]
        case .passwordTextfield:
            return XCUIApplication().secureTextFields["Password"]
        case .signInButton:
            return XCUIApplication().buttons["Sign in"]
        case .alertTitle:
            return XCUIApplication().alerts.element.staticTexts["Attention"]
        case .alertBody:
            return XCUIApplication().alerts.element.staticTexts["Invalid email or password"]
        }
    }
}
