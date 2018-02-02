//
//  ViewController.swift
//  <<New>>CMD
//
//  Created by CAUADC on 2018. 2. 1..
//  Copyright © 2018년 minkyung. All rights reserved.
//

import UIKit

class FirstCustomCell: UITableViewCell {
    
    
    @IBOutlet weak var whereMoneySpent: UILabel!
    @IBOutlet weak var inOrOutLabel: UILabel!
    @IBOutlet weak var howMuchSpent: UILabel!
    @IBOutlet weak var memoLabel: UILabel!
    @IBOutlet weak var receiptImage: UIImageView!
}

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var tmpMoneyData = MoneyDataProvider().depositDatas
    
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
        return tmpMoneyData.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
        
        cell.whereMoneySpent.text = tmpMoneyData[indexPath.row].title
        cell.inOrOutLabel.text = String(tmpMoneyData[indexPath.row].isDeposit)
        cell.memoLabel.text = tmpMoneyData[indexPath.row].subtitle
        cell.receiptImage.image = UIImage(named: tmpMoneyData[indexPath.row].bills)
        cell.howMuchSpent.text = String(tmpMoneyData[indexPath.row].money)
    
        return cell
    }
    
    
}
extension ViewController: UITableViewDelegate {
    
}

