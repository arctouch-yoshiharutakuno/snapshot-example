import XCTest
import Combine
@testable import Snapshot

final class SignInTests: XCTestCase {

    private var viewModel: SignInViewModel!
    private var subscriber: AnyCancellable?
    private var isLoadingCalled: Bool!
    private var isSuccessCalled: Bool!
    private var isErrorCalled: Bool!
    private var errorMessage: String!

    override func setUpWithError() throws {
        configureViewModel()
        isLoadingCalled = false
        isSuccessCalled = false
        isErrorCalled = false
        errorMessage = ""
    }

    override func tearDownWithError() throws {
        viewModel = nil
        subscriber?.cancel()
    }

    func testSuccessSignIn() throws {
        let email = "yoshi@arctouch.com"
        let password = "123"

        viewModel.signIn(email: email, password: password)

        XCTAssertTrue(isLoadingCalled)
        XCTAssertTrue(isSuccessCalled)
        XCTAssertFalse(isErrorCalled)
        XCTAssertEqual(errorMessage, "")
    }

    func testSignInWithInvalidEmail() throws {
        let email = "yoshi"
        let password = "123"

        viewModel.signIn(email: email, password: password)

        XCTAssertTrue(isLoadingCalled)
        XCTAssertFalse(isSuccessCalled)
        XCTAssertTrue(isErrorCalled)
        XCTAssertEqual(errorMessage, "Invalid email or password")
    }

    func testSignInWithInvalidPassword() throws {
        let email = "yoshi"
        let password = ""

        viewModel.signIn(email: email, password: password)

        XCTAssertTrue(isLoadingCalled)
        XCTAssertFalse(isSuccessCalled)
        XCTAssertTrue(isErrorCalled)
        XCTAssertEqual(errorMessage, "Invalid email or password")
    }

    func testSignInWithEmptyValues() throws {
        let email = ""
        let password = ""

        viewModel.signIn(email: email, password: password)

        XCTAssertTrue(isLoadingCalled)
        XCTAssertFalse(isSuccessCalled)
        XCTAssertTrue(isErrorCalled)
        XCTAssertEqual(errorMessage, "Invalid email or password")
    }

    private func configureViewModel() {
        viewModel = SignInViewModel()
        subscriber = viewModel.$state.sink(receiveValue: { [weak self] state in
            switch state {
            case .loading:
                self?.isLoadingCalled = true
            case .success:
                self?.isSuccessCalled = true
            case .error(let error):
                self?.isErrorCalled = true
                self?.errorMessage = error
            case .none: break
            }
        })
    }

}
