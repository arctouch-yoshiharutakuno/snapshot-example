import UIKit

final class BlogPostListViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!

    private var viewModel: BlogPostListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        configureTableView()
    }

    private func configureViewModel() {
        viewModel = BlogPostListViewModel()
    }

    private func configureTableView() {
        let nib = UINib(nibName: BlogPostIdentifiers.cell, bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: BlogPostIdentifiers.cell)
        tableView.accessibilityIdentifier = BlogPostIdentifiers.tableView
    }

}

extension BlogPostListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.blogPostList?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: BlogPostIdentifiers.cell) as? BlogPostListTableViewCell,
            let cellViewModel = viewModel.blogPostList?[indexPath.row] else {
            return UITableViewCell()
        }
        cell.configure(viewModel: cellViewModel)
        return cell
    }

}
