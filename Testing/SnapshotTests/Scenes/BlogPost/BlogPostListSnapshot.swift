import PixelTest
@testable import Snapshot

final class BlogPostListSnapshot: PixelTestCase {

    override func setUp() {
        super.setUp()
        mode = .test
    }

    func testBlogPostListTableViewCell() {
        let viewModel = BlogPostListCellViewModel(title: "Test", imageName: "shark")
        let view: BlogPostListTableViewCell = .loadFromNib()
        view.configure(viewModel: viewModel)
        verify(view, layoutStyle: .fixed(width: 320, height: 180))
    }

}
