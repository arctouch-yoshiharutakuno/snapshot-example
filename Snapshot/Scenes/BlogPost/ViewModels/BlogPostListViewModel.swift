final class BlogPostListViewModel {

    private(set) lazy var blogPostCellIdentifier = "BlogPostListTableViewCell"
    private(set) var blogPostList: [BlogPostListCellViewModel]?

    init() {
        buildBlogPostList()
    }

    private func buildBlogPostList() {
        blogPostList = [BlogPostListCellViewModel(title: "Time to Build some Tests!!!", imageName: "shark"),
                        BlogPostListCellViewModel(title: "TDD?", imageName: "tdd"),
                        BlogPostListCellViewModel(title: "How writing better tests helps you build better apps", imageName: "pyramid"),
                        BlogPostListCellViewModel(title: "Behavior-driven development framework", imageName: "quick"),
                        BlogPostListCellViewModel(title: "Time to Build some Tests!!!", imageName: "shark"),
                        BlogPostListCellViewModel(title: "TDD?", imageName: "tdd"),
                        BlogPostListCellViewModel(title: "How writing better tests helps you build better apps", imageName: "pyramid"),
                        BlogPostListCellViewModel(title: "Behavior-driven development framework", imageName: "quick")]
    }

}
