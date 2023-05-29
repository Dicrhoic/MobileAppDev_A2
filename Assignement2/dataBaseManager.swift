//
//  dataBaseManager.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 17/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit
import CoreData

class dataBaseManager: NSObject {
    var products: [NSManagedObject] = []
    func addDataEntree(name: String, detail: String ,price: String){
        //set core data to access the Product Entity
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entityEntree = NSEntityDescription.entity(forEntityName: "Entree", in: managedContext)
        let product = NSManagedObject(entity: entityEntree!, insertInto: managedContext)
        product.setValue(name, forKey: "name")
        product.setValue(price, forKey: "price")
        product.setValue(detail, forKey: "detail")
        do {
            try managedContext.save()
            products.append(product)
            print("Information is added")
        }
        catch let error as NSError {
            print("Error while adding to core data")
        }
    }
    
    func addDataMain(name: String, detail: String ,price: String){
        //set core data to access the Product Entity
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entityEntree = NSEntityDescription.entity(forEntityName: "Main", in: managedContext)
        let product = NSManagedObject(entity: entityEntree!, insertInto: managedContext)
        product.setValue(name, forKey: "name")
        product.setValue(price, forKey: "price")
        product.setValue(detail, forKey: "detail")
        do {
            try managedContext.save()
            products.append(product)
            print("Information is added")
        }
        catch let error as NSError {
            print("Error while adding to core data")
        }
    }
    
    func retrieveRows() -> String {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return ""
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            products = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError {
            print("Error occured while retrieving data")
        }
        var data: String = ""
        for products in products {
            let name = String(products.value(forKey: "name") as! String)
            let price = String(products.value(forKey: "price") as! String)
            data = name + ", " + price + "\n"
            
        }
        return data
    }
    
    func removeRecords () {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Pizza")
        
        do {
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                managedContext.delete(product)
            }
        } catch {
            print ("There was an error")
        }
    }
    
    func retrieveRowsTableEntree() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableEntreeDetails() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "detail") as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableEntreeAll() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)! + ", Detail: " + (product.value(forKey: "detail")as? String)!)

        }
        return msg
        
    }
    
    func delEntreeName(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                managedContext.delete(product)
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    func updateEntree(name: String, detail: String, price : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Entree")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                product.setValue(price, forKey: "price")
                product.setValue(detail, forKey: "detail")
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    func retrieveRowsTableMain() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Main")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableMainDetails() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Main")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "detail") as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableMainAll() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Main")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)! + ", Detail: " + (product.value(forKey: "detail")as? String)!)
            
        }
        return msg
        
    }
    
    func delMainName(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Main")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                managedContext.delete(product)
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    func updateMain(name: String, detail: String, price : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Main")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                product.setValue(price, forKey: "price")
                product.setValue(detail, forKey: "detail")
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    func addDataDessert(name: String, detail: String ,price: String){
        //set core data to access the Product Entity
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let entityEntree = NSEntityDescription.entity(forEntityName: "Dessert", in: managedContext)
        let product = NSManagedObject(entity: entityEntree!, insertInto: managedContext)
        product.setValue(name, forKey: "name")
        product.setValue(price, forKey: "price")
        product.setValue(detail, forKey: "detail")
        do {
            try managedContext.save()
            products.append(product)
            print("Information is added")
        }
        catch let error as NSError {
            print("Error while adding to core data")
        }
    }
    
    func retrieveRowsTableDessert() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dessert")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableDessertDetails() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dessert")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "detail") as? String)!)
        }
        return msg
        
    }
    func retrieveRowsTableDessertAll() -> [String] {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return [""]}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dessert")
        do {
            products  = try managedContext.fetch(fetchRequest)
        }
        catch let error as NSError{
            print("Error occured while retrieving data to table")
        }
        var msg : [String] = []
        for product in products {
            msg.append((product.value(forKeyPath: "name") as? String)! + ", Price: " + (product.value(forKey: "price")as? String)! +  ", Detail: " + (product.value(forKey: "detail")as? String)!)
            
        }
        return msg
        
    }
    
    func delMainDessert(name: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dessert")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                managedContext.delete(product)
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    func updateDessert(name: String, detail: String, price : String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Dessert")
        do {
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            products = try managedContext.fetch(fetchRequest)
            for product in products {
                product.setValue(price, forKey: "price")
                product.setValue(detail, forKey: "detail")
            }
        }
        catch { }
        do {
            try managedContext.save()
        }
        catch {}
    }
    
    
}

