//
//  Utils.swift
//  GeckoApp
//
//  Created by Denis Vásquez on 8/26/20.
//  Copyright © 2020 Denis Vásquez. All rights reserved.
//

import Foundation

/// class that allows me to handle validations on fields
public class Utils: NSObject {
    static let shared = Utils()
    /// validate email
    func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }
    /// validate Pass
    func validatePass(enteredPass: String) -> Bool {
        let passFormat = "^(?=.*[a-zA-Z])(?=.*[$@$#!%*?&]).{6,}$"
        let passPredicate = NSPredicate(format:"SELF MATCHES %@", passFormat)
        return passPredicate.evaluate(with: enteredPass)
    }
    /// validate number
    func validateNumber(enteredNumber: String) -> Bool {
        let numberFormat = "^[0-9].{9,}$"
        let numberPredicate = NSPredicate(format:"SELF MATCHES %@", numberFormat)
        return numberPredicate.evaluate(with: enteredNumber)
    }
}

extension String {
    /// validate if a field is alphanumeric
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
}
