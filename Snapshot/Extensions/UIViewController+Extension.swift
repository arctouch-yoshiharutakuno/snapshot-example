import UIKit

extension UIViewController {

    func setLoadingViewVisible(_ visible: Bool, completion: (() -> Void)? = nil) {
        if visible {
            let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
            loadingIndicator.hidesWhenStopped = true
            loadingIndicator.style = .medium
            loadingIndicator.startAnimating()

            let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
            alert.view.addSubview(loadingIndicator)
            present(alert, animated: true, completion: completion)
        } else {
            dismiss(animated: true, completion: completion)
        }
    }

    func showAlert(with title: String = "Attention", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

}
