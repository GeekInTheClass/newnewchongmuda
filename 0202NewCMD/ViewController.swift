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




class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    var selectedSegment = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func switchSegments(_ sender: UISegmentedControl) {
        self.tableView.reloadData()
    }
    
    
    var tmpMoneyData = MoneyDataProvider().depositDatas
    
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

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var returnValue = 1

        return returnValue
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FirstCustomCell", for: indexPath) as! FirstCustomCell
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "DateCustomCell", for: indexPath) as! DateCustomCell
        
        
        cell.whereMoneySpent.text = tmpMoneyData[indexPath.row].title
        cell.inOrOutLabel.text = String(tmpMoneyData[indexPath.row].isDeposit)
        cell.memoLabel.text = tmpMoneyData[indexPath.row].subtitle
        cell.receiptImage.image = UIImage(named: tmpMoneyData[indexPath.row].bills)
        cell.howMuchSpent.text = String(tmpMoneyData[indexPath.row].money)
        
        if selectedSegment == 1 {
            return cell
        } else {
            return cell
        }
        
    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//    private func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell1 = tableView.dequeueReusableCell(withIdentifier: "cell1")! as UITableViewCell
//            let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell2")! as UITableViewCell
//
//            cell1.textLabel?.text = array1[indexPath.row]
//            cell2.textLabel?.text = array2[indexPath.row]
//
//        if selectedSegment == 1 {
//            return cell1
//        } else {
//            return cell2
//        }
//    }

    }
    


