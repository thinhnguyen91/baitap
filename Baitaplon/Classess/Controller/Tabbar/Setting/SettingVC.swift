//
//  SettingVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {
    var myListtableVC:ListtableView!
    var arrays: [String] = ["NAM","Follower", "Folowing"]
     var btn1 = UIButton()
    
    @IBOutlet weak var tableSetting: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "SETTING"
        self.navigationController?.navigationBar.barTintColor = uicolorFromHex(16729344)
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "MarkerFelt-Thin", size: 20)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        //custom button
        btn1.setImage(UIImage(named: "star50"), forState: .Normal)
        btn1.frame = CGRectMake(0, 0, 25, 25)
        btn1.addTarget(self, action: Selector("logout:"), forControlEvents: .TouchUpInside)
        let item1 = UIBarButtonItem()
        item1.customView = btn1
        self.navigationItem.rightBarButtonItem = item1
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableSetting.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        self.tableSetting.delegate = self
     
    }
    
    // MARK: tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrays.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ListtableView = self.tableSetting.dequeueReusableCellWithIdentifier("Cell") as! ListtableView
        cell.nameLable.text = arrays[indexPath.row]
        cell.avatar.image = UIImage(named: arrays[indexPath.row])
        cell.avatar.layer.cornerRadius = cell.avatar.frame.size.width/2
        cell.avatar.clipsToBounds = true
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
            self.tableSetting.delegate = self
            let row = arrays[indexPath.row]
            mydetailvc.title = row
            mydetailvc.imageName = row
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