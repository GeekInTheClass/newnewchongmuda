
//  DetailTableViewController.swift
//  0202NewCMD
//
//  Created by CAUADC on 2018. 2. 3..
//  Copyright © 2018년 minkyung. All rights reserved.
//
import UIKit

typealias sentBackData = (whereMoneySpent: String, moneyDescription: String, bills: UIImage)

var dataToBeSentBack:sentBackData?


protocol SendBackProtocol {
    func sendDataBack(dataSentBack:sentBackData)
}

class DetailTableViewController: UITableViewController, SendBackProtocol {
    
    
    var delegate:SendBackProtocol?
    var data:MoneyData?

    
    @IBOutlet weak var moneyDescription: UITextField!

    @IBAction func moneyDescriptionInit(_ sender: Any) {
        moneyDescription.text = ""
    }
    @IBOutlet weak var howMuchSpent: UILabel!
    @IBOutlet weak var inOrOutLabel: UILabel!
    @IBOutlet weak var whereMoneySpent: UITextField!
    

    
    var image = UIImagePickerController()

    
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
        
        //레이블 색깔 바꾸기
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
        
        //데이터 뒤로 넘기기 아직 구현 못함
        if let text = whereMoneySpent.text{
            dataToBeSentBack?.whereMoneySpent = text
        }
        if let text = moneyDescription.text {
            dataToBeSentBack?.moneyDescription = text
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
    
    
}

//사진 변경 적용 및 전송 데이터 적용
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
            dataToBeSentBack?.bills = editedImage
        }
        
        //Dismiss the UIImagePicker after selection
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("Cancelled")
    }
    
}

