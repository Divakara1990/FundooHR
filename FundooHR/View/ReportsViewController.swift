//
//  ReportsViewController.swift
//  FundooHR
//
//  Created by BridgeLabz on 25/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

class ReportsViewController: UIViewController {

   
    @IBOutlet weak var reportCollView: UICollectionView!
    @IBOutlet weak var secondaryReportView: UIView!
    @IBOutlet weak var reportLabel: UILabel!
    
//    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var slideMenuButton: UIButton!
   
//    @IBOutlet weak var slideView: UIView!
//    @IBOutlet weak var slideTableView: UITableView!
//    @IBOutlet weak var slideMenuLeadingConstraint: NSLayoutConstraint!
//    var names: [String] = ["email id", "Dashboard", "Engineers", "Attendance Summary", "Reports" ,"Clients", "Logout"]
    
    var reportData = ["Salary Payslip","Attendance Report","Invoice"]
    var repfinalData : [String]!
    var menuShowing = false
    var customView = UIView()
    var repFieldName : String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

       //gives the seperate view, SlideBar.
        slideMenuButton.addTarget(self.revealViewController(), action:
            #selector(SWRevealViewController.revealToggle(_:)),
                            for: .touchUpInside)
        
        // Do any additional setup after loading the view.
        self.reportCollView.dataSource = self
        self.reportCollView.delegate = self
        self.secondaryReportView.layer.shadowColor = UIColor.black.cgColor
        self.secondaryReportView.layer.shadowOpacity = 0.5
        self.secondaryReportView.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.secondaryReportView.layer.shadowRadius = 2.0
        reportCollView.dataSource = self
        
        if repFieldName != nil{
            reportLabel.text = repFieldName
        }
        repfinalData = reportData
        
//        let currentDate = Date()
//        
//        // initialize the date formatter and set the style
//        let formatter = DateFormatter()
//        
//        formatter.dateFormat = "dd MM yyyy"
//        formatter.dateStyle = .long
//        // get the date time String from the date object
//        let convertedDate = formatter.string(from: currentDate)
//        date.text = convertedDate
//        
//        customView.frame = CGRect.init(x: slideMenuBtn.frame.width, y: 0, width: view.frame.width-slideMenuBtn.frame.width, height: view.frame.height)
//        customView.backgroundColor = UIColor.lightGray

    }

    
//    func reload(){
//        self.reportCollView.reloadData()
//    }
//    
//    func addGestureRecognizer(){
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapBlurButton(_:)))
//        self.customView.addGestureRecognizer(tapGesture)
//        
//    }
//    
//    func removeGestureRecognizer(){
//        for recognizer in reportCollView.gestureRecognizers ?? [] {
//            customView.removeGestureRecognizer(recognizer)
//        }
//    }
//    
//    func tapBlurButton(_ sender: UIButton) {
//        slideMenuLeadingConstraint.constant = -250
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
//        menuShowing = !menuShowing
//        
//        //to remove custom view after removing slidemenu
//        self.customView.removeFromSuperview()
//        menuShowing = !menuShowing
//        
//        //3rd case of removing  gesture when we click on collectionview
//        removeGestureRecognizer()
//        
//        
//    }
//    @IBAction func menuClicked(_ sender: Any)
//    {
//        if(menuShowing)
//        {
//            slideMenuLeadingConstraint.constant = -250
//            
//            //1st case of removing tap gesture(papre) when we click on the icon
//            removeGestureRecognizer()
//        }else{
//            slideMenuLeadingConstraint.constant = 0
//            self.view.addSubview(customView)
//            customView.alpha = 0.5
//            addGestureRecognizer()
//        }
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
//        menuShowing = !menuShowing
//    }
//


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

//extension ReportsViewController: UITableViewDataSource{
//    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        return names.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
//        let cell = slideTableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//        cell.textLabel?.text = names[indexPath.row]
//        let color = UIColor.init(red: 59/255, green: 83/255, blue: 114/255, alpha: 1)
//        cell.textLabel?.textColor = color
//        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
//        
//        if (indexPath.row == 0) {
//            let color = UIColor.init(red: 157/255, green: 212/255, blue: 237/255, alpha: 1)
//            
//            cell.backgroundColor = color
//            cell.imageView?.frame = CGRect(x: (cell.imageView?.frame.origin.x)!, y: (cell.imageView?.frame.origin.y)!, width: 60, height: 60)
//            
//            //cell.imageView?.image = #imageLiteral(resourceName: "user1")
//            
//            
//        } else {
//            cell.backgroundColor = UIColor.white
//        }
//        
//        if(indexPath.row == names.count-1){
//            //cell.imageView?.image = #imageLiteral(resourceName: "logout")
//        }
//        return cell
//    }
//}
//
////extension of tableview cell
//extension ReportsViewController: UITableViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
//        
//        if(indexPath.row == 2){
//            performSegue(withIdentifier: "segueFromSecondIndex", sender: nil)
//        }
//        
//        if(indexPath.row == 3){
//            performSegue(withIdentifier: "segueFromSecondCell", sender: nil)
//        }
//        if(indexPath.row == 4){
//            performSegue(withIdentifier: "segueFromFourthIndex", sender: nil)
//        }
//        if(indexPath.row == 5){
//            performSegue(withIdentifier: "segueFromFifthIndex", sender: nil)
//        }
//        if(indexPath.row == 6){
//            performSegue(withIdentifier: "segueFromSixthIndex", sender: nil)
//        }
//        slideMenuLeadingConstraint.constant = -250
//        UIView.animate(withDuration: 0.3, animations: {
//            self.view.layoutIfNeeded()
//        })
//        menuShowing = !menuShowing
//        
//        //2nd case of removing the tap gesture(paper) when we click on table view
//        self.customView.removeFromSuperview()
//        removeGestureRecognizer()
//    }
//    
//    //func to set the height of the cell
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
//    {
//        return 70.0;//Choose your custom row height
//    }
//
//}

extension ReportsViewController : UICollectionViewDataSource, UICollectionViewDelegate
{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return repfinalData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reportcell", for: indexPath) as! ReportCollectionViewCell
        
        cell.reportCellHeading?.text = repfinalData[indexPath.row]
        cell.contentView.layer.cornerRadius = 8
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.cyan.cgColor
        cell.contentView.backgroundColor = UIColor.white
        cell.layer.shadowOpacity = 0.6
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 0.2)
        cell.layer.shadowRadius = 2.0
        cell.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        if indexPath.row == 0 {
           self.performSegue(withIdentifier: "gotoSalaryPayslip", sender: nil)
        }
        else if indexPath.row == 1 {
            self.performSegue(withIdentifier: "gotoAttendanceReport", sender: nil)
        }
        else{
            self.performSegue(withIdentifier: "gotoInvoiceReport", sender: nil)
        }
        
    }
}
