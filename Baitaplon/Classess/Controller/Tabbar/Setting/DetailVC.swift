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
        self.navigationItem.leftBarButtonItem!.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "MarkerFelt-Thin", size: 15)!],
            forState: UIControlState.Normal)
        
        self.imgAvatar.layer.cornerRadius = imgAvatar.frame.size.width / 2
        self.imgAvatar.clipsToBounds = true
        
        if let image = UIImage(named: imageName!) {
            self.imgAvatar.image = image
        }
        
    }
    func barButtonItemClicked(sender: UIBarButtonItem){
        print("kich edit")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 

}
