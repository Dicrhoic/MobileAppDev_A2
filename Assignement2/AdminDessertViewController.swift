//
//  AdminDessertViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class AdminDessertViewController: UIViewController {

    @IBOutlet weak var adminDessert: UITableView!
    var desserts = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = dataBaseManager()
        desserts = db.retrieveRowsTableDessertAll()
        adminDessert.reloadData()

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
extension AdminDessertViewController: UITableViewDataSource, UIPickerViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return desserts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DessertTableViewCell.reuseIdentifier, for: indexPath) as? DessertTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        
        
        cell.adminDessert.text = desserts[indexPath.row]
        
        
        return cell
    }
    
}
