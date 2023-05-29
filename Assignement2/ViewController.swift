//
//  ViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 17/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var entreeSwitch: UISwitch!
    @IBOutlet weak var mainSwitch: UISwitch!
    @IBOutlet weak var dessertSwitch: UISwitch!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var picker: UIPickerView!
    
    
    var pickerData = ["1", "2", "3", " 4", "5"];
    var message: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        entreeSwitch.isOn = false
        mainSwitch.isOn = false
        dessertSwitch.isOn = false
        self.picker.dataSource = self
        self.picker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0){
            message = "1"
        }
        if (row == 1){
            message = "2"
        }
        if (row == 2){
            message = "3"
        }
        if (row == 3){
            message = "4"
        }
        if (row == 4){
            message = "5"
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController2 = segue.destination as? SecondScreenViewController {
            viewController2.textStr1 = tableNumber.text
            viewController2.textStr2 = message
            if (entreeSwitch.isOn == true){
                viewController2.entree = true
            } else
            {
                viewController2.entree  = false
            }
            
            if (mainSwitch.isOn == true){
                viewController2.main = true
            } else {
                viewController2.main  = false
            }
            if (dessertSwitch.isOn == true){
                viewController2.dessert  = true
            } else {
                viewController2.dessert  = false
            }
            
        }
    }
    
}

