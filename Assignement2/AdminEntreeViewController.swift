//
//  AdminEntreeViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class AdminEntreeViewController: UIViewController {

    @IBOutlet weak var adminEntree: UITableView!
    var entrees = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = dataBaseManager()
        entrees = db.retrieveRowsTableEntreeAll()
        adminEntree.reloadData()
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
extension AdminEntreeViewController: UITableViewDataSource, UIPickerViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entrees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AdminEntreeTableViewCell.reuseIdentifier, for: indexPath) as? AdminEntreeTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        
        
        cell.entreeDish.text = entrees[indexPath.row]
        
        
        return cell
    }
    
}
