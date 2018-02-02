//
//  ViewController.swift
//  <<New>>CMD
//
//  Created by CAUADC on 2018. 2. 1..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var moneySpent = ["일에","대한","출금","내역이 여기에"]
    let images = ["영수증1","영수증1-1","영수증1-2","영수증1-3"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moneySpent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        
        cell.whereMoneySpent.text = moneySpent[indexPath.row]
        cell.inOrOutLabel.text = moneySpent[indexPath.row]
        cell.memoLabel.text = moneySpent[indexPath.row]
        cell.receiptImage.image = UIImage(named: images[indexPath.row])
        cell.howMuchSpent.text = moneySpent[indexPath.row]
    
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    
}

