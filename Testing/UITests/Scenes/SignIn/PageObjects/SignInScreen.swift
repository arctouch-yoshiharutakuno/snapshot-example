import XCTest

enum SignInScreen: String {
    case emailTextfield = "emailTextField"
    case passwordTextfield = "passwordTextField"
    case signInButton = "signInButton"
    case alert = "alertController"

    var element: XCUIElement {
        switch self {
        case .emailTextfield:
            return XCUIApplication().textFields[rawValue]
        case .passwordTextfield:
            return XCUIApplication().secureTextFields[rawValue]
        case .signInButton:
            return XCUIApplication().buttons[rawValue]
        case .alert:
            return XCUIApplication().alerts[rawValue]
        }
    }
}
