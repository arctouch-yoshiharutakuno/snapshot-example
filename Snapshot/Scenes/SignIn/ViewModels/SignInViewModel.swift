import Combine

enum SignInViewModelState {
    case none
    case loading
    case success
    case error(String)
}

final class SignInViewModel {

    typealias CompletionHandler = () -> Void

    @Published private(set) var state: SignInViewModelState = .none

    func signIn(email: String?,
                password: String?,
                completion: CompletionHandler?) {
        state = .loading

        guard
            let email = email,
            let password = password,
            verifyCredentials(email: email, password: password) else {
                state = .error(Constants.defaultErrorMessage)
                return
        }

        guard login(email: email, password: password) else {
            state = .error(Constants.defaultErrorMessage)
            return
        }
        state = .success
        completion?()
    }

    private func verifyCredentials(email: String, password: String) -> Bool {
        return email.isValidEmail && !password.isEmpty
    }

    private func login(email: String, password: String) -> Bool {
        return email == Constants.correctEmail && password == Constants.correctPassword
    }

}

private extension SignInViewModel {

    enum Constants {
        static let correctEmail = "yoshi@arctouch.com"
        static let correctPassword = "123"
        static let defaultErrorMessage = "Invalid email or password"
    }

}
