import XCTest
@testable import Snapshot

final class StringExtensionTests: XCTestCase {

    func testValidEmail() throws {
        let email = "yoshi@arctouch.com"
        XCTAssertTrue(email.isValidEmail)
    }

    func testEmailWithoutAtSign() throws {
        let email = "yoshiarctouch.com"
        XCTAssertFalse(email.isValidEmail)
    }

    func testEmailWithoutDot() throws {
        let email = "yoshi@arctouchcom"
        XCTAssertFalse(email.isValidEmail)
    }

    func testEmptyEmail() throws {
        let email = ""
        XCTAssertFalse(email.isValidEmail)
    }

}
