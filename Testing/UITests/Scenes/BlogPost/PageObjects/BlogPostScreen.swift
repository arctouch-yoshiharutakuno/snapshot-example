import XCTest

enum BlogPostScreen {
    case tableView

    var element: XCUIElement {
        switch self {
        case .tableView:
            return XCUIApplication().tables.matching(identifier: "blogPostTableView").element
        }
    }
}
