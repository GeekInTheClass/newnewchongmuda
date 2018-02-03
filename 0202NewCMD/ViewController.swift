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
    var p: Int!
    
    var tmpMoneyData = MoneyDataProvider().depositDatas
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let nib = UINib(nibName: "FirstCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "FirstCustomCell")
        
        tableView.dataSource = self
        tableView.delegate = self
    
        p = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchCustomTableViewAction(_ sender: UISegmentedControl) {
        p = sender.selectedSegmentIndex
        tableView.reloadData()
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

