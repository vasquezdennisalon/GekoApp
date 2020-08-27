//
//  ViewController.swift
//  GeckoApp
//
//  Created by Denis Vásquez on 8/26/20.
//  Copyright © 2020 Denis Vásquez. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UserProtocol {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var viewLogin: UIView!
    @IBOutlet weak var viewRegister: UIView!
    @IBOutlet weak var LoginEmailTxt: UITextField!
    @IBOutlet weak var LoginPassTxt: UITextField!
    @IBOutlet weak var RegisterNameTxt: UITextField!
    @IBOutlet weak var RegisterEmailTxt: UITextField!
    @IBOutlet weak var RegisterPassTxt: UITextField!
    @IBOutlet weak var RegisterNumberTxt: UITextField!
    var currentUser: NSManagedObject?
    var users = [NSManagedObject]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.viewRegister.isHidden = true
    }
    
    /// Action to change view
    @IBAction func changeView(_ sender: Any) {
        switch self.segmentControl.selectedSegmentIndex {
        case 0:
            self.viewLogin.isHidden = false
            self.viewRegister.isHidden = true
        case 1:
            self.viewLogin.isHidden = true
            self.viewRegister.isHidden = false
        default:
            break
        }
        self.clearTextField()
    }
    /// Clear inputs
    func clearTextField() {
        self.LoginEmailTxt.text = ""
        self.LoginPassTxt.text = ""
        
        self.RegisterNameTxt.text = ""
        self.RegisterEmailTxt.text = ""
        self.RegisterPassTxt.text = ""
        self.RegisterNumberTxt.text = ""
    }
    /// send values ​​to the other page
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detail = segue.destination as? LoginWelcomeViewController {
            if let user = self.currentUser {
                detail.user = user
            }
        }
    }
    /// Action to validate login
    @IBAction func SignInAction(_ sender: Any) {
        if !Utils.shared.validateEmail(enteredEmail: self.LoginEmailTxt.text!){
            self.alerts(title: "AVISO", message: "El email ingresado es invalido")
        }
        
        if !Utils.shared.validatePass(enteredPass: self.LoginPassTxt.text!) {
            self.alerts(title: "AVISO", message: "La Contraseña ingresada es invalida")
        }
        
        if let user = existsUser(email: self.LoginEmailTxt.text!) {
            let pass = (user.value(forKey: "pass") as? String)!
            if pass == self.LoginPassTxt.text! {
                self.currentUser = user
                performSegue(withIdentifier: "goToHome", sender: self)
            } else {
                self.alerts(title: "AVISO", message: "La contraseña ingresada no es la correcta")
            }
        } else {
            self.alerts(title: "AVISO", message: "El usuario ingresado no existe, registrate para poder continuar")
        }
    }
    
    /// Action to validate user creation
    @IBAction func CreateAccountAction(_ sender: Any) {
        if !self.RegisterNameTxt.text!.isAlphanumeric {
            self.alerts(title: "AVISO", message: "El nombre ingresado es invalido")
        }
        
        if !Utils.shared.validateEmail(enteredEmail: self.RegisterEmailTxt.text!){
            self.alerts(title: "AVISO", message: "El email ingresado es invalido")
        }
        
        if !Utils.shared.validatePass(enteredPass: self.RegisterPassTxt.text!) {
            self.alerts(title: "AVISO", message: "La Contraseña ingresada es invalida")
        }
        
        if !Utils.shared.validateNumber(enteredNumber: self.RegisterNumberTxt.text!){
            self.alerts(title: "AVISO", message: "El numero de telefono ingresado es invalido")
        }
        
        if existsUser(email: self.RegisterEmailTxt.text!) == nil {
                let isSave = saveUser(name: self.RegisterNameTxt.text!,
                                      email: self.RegisterEmailTxt.text!,
                                      pass: self.RegisterPassTxt.text!,
                                      number: self.RegisterNumberTxt.text!)
            if isSave {
                self.alerts(title: "Aviso", message: "Se ha guardado exitosamente tu registro")
            } else {
                self.alerts(title: "Aviso", message: "No se ha guardado tu registro")
            }
        } else {
            self.alerts(title: "AVISO", message: "El usuario ingresado ya existe")
        }
    }
}
