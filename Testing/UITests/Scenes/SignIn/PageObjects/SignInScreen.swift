import XCTest

enum SignInScreen: String {
    case emailTextField
    case passwordTextField
    case signInButton
    case alertController

    var element: XCUIElement {
        switch self {
        case .emailTextField:
            return XCUIApplication().textFields[rawValue]
        case .passwordTextField:
            return XCUIApplication().secureTextFields[rawValue]
        case .signInButton:
            return XCUIApplication().buttons[rawValue]
        case .alertController:
            return XCUIApplication().alerts[rawValue]
        }
    }
}
