//
//  DetailVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 5/13/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    var mySetting: SettingVC!
    var myListtableVC: ListtableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = ""
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
