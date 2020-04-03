import XCTest

enum SignInScreen: String {
    case emailTextfield
    case passwordTextfield
    case signInButton

    var element: XCUIElement {
        switch self {
        case .emailTextfield:
            return XCUIApplication().textFields["Email"]
        case .passwordTextfield:
            return XCUIApplication().secureTextFields["Password"]
        case .signInButton:
            return XCUIApplication().buttons["Sign in"]
        }
    }
}
