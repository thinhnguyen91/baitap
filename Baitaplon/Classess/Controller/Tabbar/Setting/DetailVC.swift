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
    var imageName : String?
    var btn = UIButton()
    @IBOutlet weak var imgAvatar: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "DetailVC"
        self.navigationController?.navigationBar.titleTextAttributes = [ NSFontAttributeName: UIFont(name: "MarkerFelt-Thin", size: 20)!,
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        self.navigationItem.setRightBarButtonItem(UIBarButtonItem(barButtonSystemItem: .Edit, target: self, action: "barButtonItemClicked:"), animated: true)
        self.navigationItem.rightBarButtonItem!.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "MarkerFelt-Thin", size: 15)!],
            forState: UIControlState.Normal)
        self.navigationItem.hidesBackButton = true
        
        //custom button
        btn.setImage(UIImage(named: "Back-25"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 25, 25)
        btn.setTitle("", forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("back:"), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem()
        item.customView = btn
        self.navigationItem.leftBarButtonItem = item
        
        self.imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width / 2
        self.imgAvatar.clipsToBounds = true
        
        if let image = UIImage(named: imageName!) {
            self.imgAvatar.image = image
        }
        
    }
    func barButtonItemClicked(sender: UIBarButtonItem){
        print("kich edit")
    }
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewControllerAnimated(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
