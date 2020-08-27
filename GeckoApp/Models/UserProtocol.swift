//
//  UserProtocol.swift
//  GeckoApp
//
//  Created by Denis Vásquez on 8/27/20.
//  Copyright © 2020 Denis Vásquez. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// Protocol that allows me to handle user crud
public protocol UserProtocol {}

extension UserProtocol {
    func existsUser(email: String) -> NSManagedObject? {
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return nil
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")
        do {
            let users = try managedContext.fetch(fetchRequest)
            let user = users.filter { ($0.value(forKey: "email") as? String)! == email }
            if user.count == 0 {
                return nil
            } else {
                return user.first
            }
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return nil
        }
    }
    
    func saveUser(name: String, email: String, pass: String, number: String) -> Bool {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)
        let product = NSManagedObject(entity: entity!, insertInto: managedContext)

        product.setValue(name, forKey: "name")
        product.setValue(email, forKey: "email")
        product.setValue(pass, forKey: "pass")
        product.setValue(number, forKey: "number")

        do {
            try managedContext.save()
            return true
        } catch {
            return false
        }
    }
}
