//
//  LoginWelcomeViewController.swift
//  GeckoApp
//
//  Created by Denis Vásquez on 8/26/20.
//  Copyright © 2020 Denis Vásquez. All rights reserved.
//

import UIKit
import CoreData

class LoginWelcomeViewController: UIViewController {
    var user: NSManagedObject?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var number: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set info user
        if let user = self.user {
            let emailTxt = (user.value(forKey: "email") as? String)!
            let nameTxt = (user.value(forKey: "name") as? String)!
            let numberTxt = (user.value(forKey: "number") as? String)!
            self.name.text = nameTxt
            self.email.text = emailTxt
            self.number.text = numberTxt
        }
    }
}
