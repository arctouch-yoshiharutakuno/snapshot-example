import UIKit

final class BlogPostListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blogPostImageView: UIImageView!

    func configure(viewModel: BlogPostListCellViewModel) {
        titleLabel.text = viewModel.title
        blogPostImageView.image = UIImage(named: viewModel.imageName)
    }

}
