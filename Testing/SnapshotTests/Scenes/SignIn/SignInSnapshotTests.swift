import PixelTest
@testable import Snapshot

final class SignInSnapshotTests: PixelTestCase {

    override func setUp() {
        super.setUp()
        mode = .test
    }

    func testSignInView() {
        let storyboard = UIStoryboard(name: Constants.storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: Constants.signInViewControllerIdentifier)
        verify(controller, layoutStyle: .fixed(width: 400, height: 700))
    }

}

private extension SignInSnapshotTests {

    enum Constants {
        static let storyboardName = "SignIn"
        static let signInViewControllerIdentifier = "SignInController"
    }

}
