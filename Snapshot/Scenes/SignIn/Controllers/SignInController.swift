import UIKit
import Combine

final class SignInController: UIViewController {

    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
    private var viewModel: SignInViewModel!
    private var subscriber: AnyCancellable?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureViewModel()
        configureIdentifiers()
    }

    private func configureViewModel() {
        viewModel = SignInViewModel()
        subscriber = viewModel.$state.sink(receiveValue: { [weak self] state in
            self?.stateDidChange(withState: state)
        })
    }

    private func configureIdentifiers() {
        emailTextField.accessibilityIdentifier = SignInIdentifiers.emailTextField
        passwordTextField.accessibilityIdentifier = SignInIdentifiers.passwordTextField
        signInButton.accessibilityIdentifier = SignInIdentifiers.signInButton
    }

    @IBAction private func signinDidTap(_ sender: Any) {
        viewModel.signIn(email: emailTextField.text, password: passwordTextField.text)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

}

extension SignInController {

    private func stateDidChange(withState state: SignInViewModelState) {
        switch state {
        case .loading:
            setLoadingViewVisible(true)
        case .success:
            setLoadingViewVisible(false) { [weak self] in
                guard let self = self else { return }
                self.performSegue(withIdentifier: SegueIdentifiers.blogPost, sender: nil)
            }
        case .error(let error):
            setLoadingViewVisible(false) { [weak self] in
                self?.showAlert(message: error)
            }
        case .none: break
        }
    }
}
