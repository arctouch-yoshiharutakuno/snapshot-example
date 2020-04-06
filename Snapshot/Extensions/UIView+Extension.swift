import UIKit

extension UIView {

    static var nib: UINib {
        return UINib(nibName: "\(classForCoder())", bundle: Bundle(for: self))
    }

    static func loadFromNib<T>() -> T {
        return nib.instantiate(withOwner: nil, options: nil).first as! T
    }

}
