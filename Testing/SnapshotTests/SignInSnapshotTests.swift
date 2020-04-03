import PixelTest
@testable import Snapshot

final class SignInSnapshotTests: PixelTestCase {

    override func setUp() {
        super.setUp()
        mode = .test
    }

    func testSignInView() {
        let storyboard = UIStoryboard(name: "SignIn", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "SignInController")
        verify(controller, layoutStyle: .fixed(width: 400, height: 700))
    }

}
