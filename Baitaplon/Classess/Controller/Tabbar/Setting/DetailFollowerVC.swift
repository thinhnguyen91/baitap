//
//  DetailFollowerVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 5/16/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit
 import MapKit
class DetailFollowerVC: UIViewController {
    var places = [Place]()
    
    @IBOutlet weak var tableDetailFollower: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        let nib = UINib(nibName: "Cell", bundle: nil)
        tableDetailFollower.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        for var i = 0 ; i <= 10 ; i++ {
            
            let place = Place(title: "",
                locationName: "",
                discipline: "",
                coordinate: CLLocationCoordinate2D(latitude: 0, longitude: 0))
            if i%2 == 0 {
                place.name = "Nam"
            } else {
                place.name = "Nu"
            }
            place.avatar  = "Apple180x180"
            
            places.append(place)
        }
        
        let barButton = UIBarButtonItem(image: UIImage(named: "Delete Filled-30"), landscapeImagePhone: nil, style: .Done, target: self, action:  Selector("action:"))
        
        self.navigationItem.rightBarButtonItem = barButton
        
        self.tableDetailFollower.delegate = self
        self.tableDetailFollower.dataSource = self
    }
    
    func action(sender: UIBarButtonItem){
        let alert = UIAlertController(title: "DELETE ALL", message: "Would you like to continue Delete all?", preferredStyle: UIAlertControllerStyle.Alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        // show the alert
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    // MARK: tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return places.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ListtableView = self.tableDetailFollower.dequeueReusableCellWithIdentifier("Cell") as! ListtableView
        let place = places[indexPath.row]
        let imageview: UIImage = UIImage(named: place.avatar)!
        cell.avatar.image = imageview
        cell.nameLable.text = place.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 48
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            places.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


}
extension DetailFollowerVC: UITableViewDelegate,  UITableViewDataSource {
    
}