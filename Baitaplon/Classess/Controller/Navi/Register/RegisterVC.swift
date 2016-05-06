//
//  RegisterVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var userRegi: UITextField!
    @IBOutlet weak var passRegi: UITextField!
    @IBOutlet weak var newpassRegi: UITextField!
    @IBOutlet weak var emailRegi: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "REGISTER"
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
            style: UIBarButtonItemStyle.Plain,
            target: self,
            action: "done:")
            avatar.layer.cornerRadius = avatar.frame.size.width / 2
            avatar.clipsToBounds = true
        
            userRegi.delegate = self
            passRegi.delegate = self
            newpassRegi.delegate = self
            emailRegi.delegate = self
        
        
    }
    
    func done(sender: UIBarButtonItem){
        AppDelegate.sharedInstance().loginSuccess()
        print("done")
    }
    
    //MARK: toucher textfiled
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension RegisterVC: UITextFieldDelegate {
    
}