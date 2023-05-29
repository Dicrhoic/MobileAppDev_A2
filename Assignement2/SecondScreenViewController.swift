//
//  SecondScreenViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 17/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {
     var entrees = [String]() // empty int. array for name + price
    var entreesDetail = [String]() // empty array for detail
    var mains = [String]()
    @IBOutlet weak var entreeTableView: UITableView!
    @IBOutlet weak var mainTable: UITableView!
    
    @IBOutlet weak var dessertTable: UITableView!
    @IBOutlet weak var staffNumber: UILabel!
    @IBOutlet weak var tableID: UILabel!
    
    var textStr1 :String? // pass by reference
    var textStr2 :String? //
    var tableNumber: String = "Table number: "
    var staffNum: String = "Staff Number: "
    var entree: Bool = false // used to display or hide table
    var main: Bool = false
    var dessert: Bool = false
    var selection: String = "Customer choose:"
    @IBOutlet weak var input: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(textStr1 != nil)
        {
              tableNumber = tableNumber + textStr1! // loads value passed from previous page
              tableID.text = tableNumber
        }
        if(textStr2 != nil)
        {
              staffNum = staffNum + textStr2!
                 staffNumber.text = staffNum
        }
      
        if ( entree == false) {
            entreeTableView.isHidden = true
        }// if statmement for table view
        let db = dataBaseManager()
        entrees = db.retrieveRowsTableEntree()
        entreesDetail = db.retrieveRowsTableEntreeDetails()
        entreeTableView.reloadData()
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
    
}

extension SecondScreenViewController: UITableViewDataSource, UIPickerViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EntreeTableViewCell.reuseIdentifier, for: indexPath) as? EntreeTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        cell.nameAndPrice.text = entrees[indexPath.row]
        cell.detail.text = entreesDetail[indexPath.row]

        
        return cell
    }

    
    
}
