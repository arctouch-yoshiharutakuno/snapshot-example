import XCTest

enum BlogPostScreen: String {
    case tableView

    var element: XCUIElement {
        switch self {
        case .tableView:
            return XCUIApplication().tables.matching(identifier: rawValue).element
        }
    }
}
