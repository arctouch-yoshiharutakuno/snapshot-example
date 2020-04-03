import UIKit
import Combine

final class SignInController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    private var viewModel: SignInViewModel?
    private var subscriber: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
    }

    private func configureViewModel() {
        viewModel = SignInViewModel()
        subscriber = viewModel?.$state.sink(receiveValue: { [weak self] (state) in
            self?.stateDidChange(withState: state)
        })
    }

    @IBAction private func signinDidTap(_ sender: Any) {
        viewModel?.signIn(email: emailTextField.text, password: passwordTextField.text, completion: {
            
        })
    }

}

extension SignInController {

    private func stateDidChange(withState state: SignInViewModelState) {
        switch state {
        case .loading:
            setLoadingViewVisible(true)
        case .success:
            setLoadingViewVisible(false)
        case .error(let error):
            setLoadingViewVisible(false) { [weak self] in
                self?.showAlert(message: error)
            }
        case .none: break
        }
    }
}
