//
//  SlideMenuViewController.swift
//  FundooHR
//
//  1. Slide viewcontroller class.
//  2. contains the data to be displayed in the slidebar
//  3. it also contains the function for logout.
//
//  Created by BridgeLabz on 16/12/16.
//  Copyright © 2016 BridgeLabz. All rights reserved.
//

import UIKit

var mUtil : Utility?

class SlideMenuViewController: UIViewController
{
    //outlet to the label to display the email of the user
    @IBOutlet weak var usernamefield: UILabel!
    
    //outlet for the table view
    @IBOutlet weak var slideTableView: UITableView!
    
    //variable of class type dashboard viewcontroller
    var mDashBoard : DashboardViewController?
    
    //variable of class type login viewcontroller
    var mLoginVC : ViewController?
    
    //array which contains the data to be displayed in slidebar's table view
    var mArray = ["Dashboard","Engineers","Attendance Summary","Reports","Clients"]
    
    //variable which holds the email in slide menu view
    var mEmailIDLabel : String?
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        mUtil = Utility()
        
        //creating the object of login viewcontroller
       // mLoginVC = ViewController()
        
        //setting the tableview datasource and delegates
        slideTableView.dataSource = self
        self.slideTableView.delegate = self
        
        //storing the email which is fetched from the coredata
        let musername = mUtil?.fetchEmail()
        
        //assigning the fetched value to the label field
        usernamefield.text = musername
    }//end of the viewDidLoad()

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }//end of the didReceiveMemoryWarning()
    
    // function to logout from the application, this is called when the logout button is clicked
    @IBAction func logoutButtonClicked(_ sender: Any)
    {
        //setting the alertview which needs to be displayed
        let alertView = UIAlertController.init(title: "Logout", message: "Click on Yes to Logout", preferredStyle: UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title: "yes", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
            //programetically connecting to the login viewcontroller after successful logout
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
            //displaying the login viewcontroller
            self.present(viewController, animated: false, completion: nil)
        }//end of the alertview action
        
        let action1 = UIAlertAction.init(title: "No", style: UIAlertActionStyle.default)
        {
            UIAlertAction in
        }//end of the alertview action
        
        //adding the actions to the alertview
        alertView.addAction(action)
        alertView.addAction(action1)
        
        
        //presenting the alertview
        self.present(alertView, animated: true, completion:nil)
        
    }//logoutButtonClicked
}//end of the class

//defining the tableview datasource and delegate methods
extension SlideMenuViewController : UITableViewDataSource, UITableViewDelegate
{
    //method to define the number of sections in the tableview
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }//end of the tableviews numberOfSections() function
    
    
    //method to define the number of rows in each sections of the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mArray.count
    }//end of the tableviews numberOfRowsInSection() function
    
    
    //method to display the contents of the tableview cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! SlideMenuTableViewCell
        
        cell.label.text = mArray[indexPath.row]
        
        return cell
    }//end of the cellForRowAt() function
    
    
    //delegate method to perform the segue when the particular cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        switch indexPath.row
        {
        case 0:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: "gotoEngineers", sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: "gotoReports", sender: nil)
            break
        case 4:
            self.performSegue(withIdentifier: "gotoDashboard", sender: nil)
            break
        default:
            return  //NSNull.self
        }//end of switch case
    }//end of the tableviews didSelectRowAt() function
}//end of the extension class
