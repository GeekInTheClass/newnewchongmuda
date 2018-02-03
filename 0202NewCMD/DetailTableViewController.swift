
//  DetailTableViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 3..
//  Copyright © 2018년 minkyung. All rights reserved.
//
import UIKit

class DetailTableViewController: UITableViewController {
    
    var data:MoneyData?
    
    @IBOutlet weak var moneyDescription: UITextField!
    @IBOutlet weak var howMuchSpent: UILabel!
    @IBOutlet weak var inOrOutLabel: UILabel!
    @IBOutlet weak var whereMoneySpent: UILabel!
    
    var image = UIImagePickerController()
    var billArray:[UIImage] = []
    
    @IBOutlet weak var addphoto1: UIButton!
    @IBOutlet weak var bills1: UIImageView!
    
    @IBAction func addPhoto(_ sender: Any) {
        image.delegate = self
        //        self.btnEdit.setTitleColor(UIColor.white, for: .normal)
        //        self.btnEdit.isUserInteractionEnabled = true
        
        let alert = UIAlertController(title: "사진선택", message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "카메라", style: .default, handler: { _ in
            self.openCamera()
        }))
        
        alert.addAction(UIAlertAction(title: "갤러리", style: .default, handler: { _ in
            self.openGallary()
        }))
        
        alert.addAction(UIAlertAction.init(title: "취소", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func openCamera()
    {
        if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerControllerSourceType.camera))
        {
            image.sourceType = UIImagePickerControllerSourceType.camera
            image.allowsEditing = true
            self.present(image, animated: true, completion: nil)
        }
        else
        {
            let alert  = UIAlertController(title: "경고", message: "카메라가 없습니다", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "승인", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func openGallary()
    {
        image.sourceType = UIImagePickerControllerSourceType.photoLibrary
        image.allowsEditing = true
        self.present(image, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inOrOutLabel?.text = data?.isDeposit
        whereMoneySpent?.text = data?.title
        howMuchSpent?.text = data?.money
        if inOrOutLabel.text == "출금" {
            inOrOutLabel.textColor = UIColor.cyan
        } else {
            inOrOutLabel.textColor = UIColor.orange
        }
        if inOrOutLabel.text == "출금" {
            howMuchSpent.textColor = UIColor.cyan
        } else {
            howMuchSpent.textColor = UIColor.orange
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    /*
     override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
     // Configure the cell...
     return cell
     }
     */
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension DetailTableViewController:  UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        /*
         Get the image from the info dictionary.
         If no need to edit the photo, use `UIImagePickerControllerOriginalImage`
         instead of `UIImagePickerControllerEditedImage`
         */
        if let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            self.bills1.image = editedImage
            self.addphoto1.isHidden = true
            billArray.append(editedImage)
        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
    }
    
}

