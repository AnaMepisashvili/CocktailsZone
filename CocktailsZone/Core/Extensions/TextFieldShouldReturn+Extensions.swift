//
//  textFieldShouldReturn+Extensions.swift
//  CocktailsZone
//
//  Created by Ana Mepisashvili on 19.02.22.
//

import UIKit

class BaseViewController: UIViewController, UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
}
