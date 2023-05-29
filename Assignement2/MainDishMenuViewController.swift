//
//  MainDishMenuViewController.swift
//  Assignement2
//
//  Created by Kevin Vo Le on 20/10/19.
//  Copyright © 2019 19396431. All rights reserved.
//

import UIKit

class MainDishMenuViewController: UIViewController {


    var mainsDetail = [String]() // empty array for detail
    var mains = [String]()

    @IBOutlet weak var mainsTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let db = dataBaseManager()
        mains = db.retrieveRowsTableMain()
        mainsDetail = db.retrieveRowsTableMainDetails()
        mainsTable.reloadData()
        
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

extension MainDishMenuViewController: UITableViewDataSource, UIPickerViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.reuseIdentifier, for: indexPath) as? MainTableViewCell else {
            fatalError("Unexpected Index Path")
        }
        
        cell.nameAndPrice.text = mains[indexPath.row]
        cell.detail.text = mainsDetail[indexPath.row]
        
        
        return cell
    }
    
    
    
}
