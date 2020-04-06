import XCTest

enum BlogPostScreen: String {
    case tableView = "blogPostTableView"

    var element: XCUIElement {
        switch self {
        case .tableView:
            return XCUIApplication().tables.matching(identifier: rawValue).element
        }
    }
}
