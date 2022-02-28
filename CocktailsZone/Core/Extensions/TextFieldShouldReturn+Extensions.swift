import UIKit

extension UITextField {
    func textFieldShouldReturn() {
        let nextTag = self.tag + 1
        
        if let nextResponder = self.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            self.resignFirstResponder()
        }
    }
}
