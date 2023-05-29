//
//  ModifyEntreeViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class ModifyEntreeViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var detail: UITextField!
    @IBOutlet weak var price: UITextField!
    
    var dishName: String = ""
    var dishDetail: String = ""
    var dishPrice: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func updateEntree(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        dishPrice = price.text!
        dishDetail = detail.text!
        db.updateEntree(name: dishName, detail: dishDetail, price: dishPrice)
        let alertController = UIAlertController(title: "Update Entree", message:  dishName + " is successfully updated!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    @IBAction func deleteEntree(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        db.delEntreeName(name: dishName)
        let alertController = UIAlertController(title: "Delete Entree", message:  dishName + " is successfully deleted!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    
    /*@IBAction func deleteDessert(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        db.delMainName(name: dishName)
        let alertController = UIAlertController(title: "Delete Dessert", message:  dishName + " is successfully deleted!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }*/
    
    @IBAction func deleteMain(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        db.delMainDessert(name: dishName)
        let alertController = UIAlertController(title: "Delete Main", message:  dishName + " is successfully deleted!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    @IBAction func updateDesert(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        dishPrice = price.text!
        dishDetail = detail.text!
        db.updateEntree(name: dishName, detail: dishDetail, price: dishPrice)
        let alertController = UIAlertController(title: "Update Dessert", message:  dishName + " is successfully updated!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
        
    }
    @IBAction func updateMain(_ sender: Any) {
        let db = dataBaseManager()
        dishName = name.text!
        dishPrice = price.text!
        dishDetail = detail.text!
        db.updateEntree(name: dishName, detail: dishDetail, price: dishPrice)
        let alertController = UIAlertController(title: "Update Main", message:  dishName + " is successfully updated!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    
    
}
