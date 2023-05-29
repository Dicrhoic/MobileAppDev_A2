//
//  AddDishViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 17/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class AddDishViewController: UIViewController {

    @IBOutlet weak var dishName: UITextField!
    @IBOutlet weak var dishDetail: UITextField!
    @IBOutlet weak var dishPrice: UITextField!
    var name: String = ""
    var detail: String = ""
    var price: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addEntree(_ sender: Any) {
        name = dishName.text!
        detail = dishDetail.text!
        price = dishPrice.text!
        let db = dataBaseManager()
        db.addDataEntree(name: name, detail: detail, price: price)
        let alertController = UIAlertController(title: "Add Entree", message:  name + " is successfully added!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    @IBAction func addMain(_ sender: Any) {
        name = dishName.text!
        detail = dishDetail.text!
        price = dishPrice.text!
        let db = dataBaseManager()
        db.addDataMain(name: name, detail: detail, price: price)
        let alertController = UIAlertController(title: "Add Main", message:  name + " is successfully added!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }

    @IBAction func addDesert(_ sender: Any) {
        name = dishName.text!
        detail = dishDetail.text!
        price = dishPrice.text!
        let db = dataBaseManager()
        db.addDataDessert(name: name, detail: detail, price: price)
        let alertController = UIAlertController(title: "Add Dessert", message:  name + " is successfully added!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alertController, animated:  true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
