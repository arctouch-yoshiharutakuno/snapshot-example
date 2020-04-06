import UIKit

final class BlogPostListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var viewModel: BlogPostListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        configureTableViewCells()
    }

    private func configureTableViewCells() {
        let nib = UINib(nibName: viewModel.blogPostCellIdentifier, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: viewModel.blogPostCellIdentifier)
    }

    private func configureViewModel() {
        viewModel = BlogPostListViewModel()
    }

}

extension BlogPostListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.blogPostList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.blogPostCellIdentifier) as? BlogPostListTableViewCell,
            let cellViewModel = viewModel.blogPostList?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(viewModel: cellViewModel)
        return cell
    }

}
