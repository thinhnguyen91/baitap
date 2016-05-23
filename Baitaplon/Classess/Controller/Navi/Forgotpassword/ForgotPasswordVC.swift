//
//  ForgotPasswordVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit

class ForgotPasswordVC: UIViewController {
    var btn = UIButton()
    
    @IBOutlet weak var forgotText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "FORGOT PASSWORD"
        self.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: "done:")
        self.navigationItem.setHidesBackButton(false, animated: false)
        self.navigationItem.hidesBackButton = true
        
        //custom button
        btn.setImage(UIImage(named: "Back-25"), forState: .Normal)
        btn.frame = CGRectMake(0, 0, 25, 25)
        btn.setTitle("", forState: UIControlState.Normal)
        btn.addTarget(self, action: Selector("back:"), forControlEvents: .TouchUpInside)
        let item = UIBarButtonItem()
        item.customView = btn
        self.navigationItem.leftBarButtonItem = item
        
        self.forgotText.delegate = self
        
    }
    func back(sender: UIBarButtonItem){
        self.navigationController?.popViewControllerAnimated(true)
    }
    func done(sender: UIBarButtonItem){
      
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    //MARK: toucher textfiled
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

extension ForgotPasswordVC: UITextFieldDelegate {
    
}