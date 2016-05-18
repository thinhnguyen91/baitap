//
//  SettingVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//




import UIKit

class SettingVC: UIViewController {
    var place: Place!
    var myListtableVC:ListtableView!
    @IBOutlet weak var tableSetting: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SETTING"
        self.navigationController?.navigationBar.barTintColor = uicolorFromHex(16729344)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableSetting.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        self.tableSetting.delegate = self
    }
    
    // MARK: tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ListtableView = self.tableSetting.dequeueReusableCellWithIdentifier("Cell") as! ListtableView
        let item = indexPath.row
        if item == 0 {
            let imageview: UIImage = UIImage(named: "Apple180x180")!
            cell.nameLable.text = "NAM"
            cell.avatar.image = imageview
        } else if item == 1 {
            cell.nameLable.text = "Follower"
        } else if item == 2 {
            cell.nameLable.text = "Folowing"
        }
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 48
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.tableSetting.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = indexPath.row
        if item == 0 {
        
            let mydetailvc = DetailVC(nibName: "DetailVC", bundle: nil)
            mydetailvc.title = "NAM"
            self.navigationController?.pushViewController(mydetailvc, animated: true)
            
        } else if item == 1 {
            let mydetailFowoerl = DetailFollowerVC(nibName: "DetailFollowerVC", bundle: nil)
            mydetailFowoerl.title = "FOLLOWER"
            self.navigationController?.pushViewController(mydetailFowoerl, animated: true)
        } else if item == 2 {
            
        }
        
        
        print("Cell \(indexPath.row) of Section \(indexPath.section) ")
        
    }
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}
extension SettingVC: UITableViewDelegate,  UITableViewDataSource {
    
}