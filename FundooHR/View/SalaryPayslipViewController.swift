//
//  SalaryPayslipViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 25/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class SalaryPayslipViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
   
    @IBOutlet weak var selectAllCB: UIButton!
    @IBOutlet weak var salaryCollView: UICollectionView!
    @IBOutlet weak var empCount: UILabel!
    @IBOutlet weak var generateBtn: UIButton!
    @IBOutlet weak var slideMenu: UIButton!
   
           
    var salPaySlipVMObj : SalaryPaySlipVM?
    

   
    var employees: [String] = ["Amith","Anand","Eshwar","Zakki","Vishwas","Bushan","Greshma","Hema","John","Jeeva","Kamal","Laxman","Ajith","Frenzy","Indhu","Manoj","Naveen","Divakar YN", "Chandra", "Darshan", "Dilip", "Diganth","Chethan", "Charan", "Ramesh", "Rakesh","Roopesh", "Rajesh", "Santhosh", "Sanjay","Sree Prasad", "Sunith", "Swamy", "Sugam","Pramodh", "Punith", "Pretham", "Pankaj"]
    var salData : [String]!
    var fieldName : String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        salPaySlipVMObj = SalaryPaySlipVM()
        salPaySlipVMObj?.salVCObj = self
        salPaySlipVMObj?.callFromVMToCSalDetails()
        
        self.salaryCollView.dataSource = self
        self.salaryCollView.delegate = self
        
        //gives the seperate view, SlideBar.
        slideMenu.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
                                  for: .touchUpInside)

        //empCount.backgroundColor = UIColor.blue
        empCount.layer.cornerRadius = 8
        empCount.layer.masksToBounds = true
        generateBtn.layer.cornerRadius = 5
        generateBtn.layer.masksToBounds = true
        generateBtn.layer.borderWidth = 1
        generateBtn.backgroundColor = UIColor(colorWithHexValue: 0x6FB8D9)
       // generateBtn.layer.borderColor = UIColor.blue.cgColor
       
//        if fieldName != nil{
//            collLabel.text = fieldName
//        }
//        generateButton.backgroundColor = UIColor.clear
//        generateButton.layer.cornerRadius = 5
//        generateButton.layer.borderWidth = 0.5
//        generateButton.layer.borderColor = UIColor.blue.cgColor
        salData = employees.sorted(by: {$0 < $1})
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return salData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "salarycell", for: indexPath) as! SalaryCollViewCell
            cell.collLabel?.text = salData[indexPath.row]
            cell.contentView.backgroundColor = UIColor.white
            return cell
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
    extension UIColor {
        convenience init(colorWithHexValue value: Int, alpha:CGFloat = 1.0){
            self.init(
                red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                green: CGFloat((value & 0x00FF00) >> 8) / 255.0,
                blue: CGFloat(value & 0x0000FF) / 255.0,
                alpha: alpha
            )
        }
       

}
