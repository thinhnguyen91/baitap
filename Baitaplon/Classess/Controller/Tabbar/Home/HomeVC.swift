//
//  HomeVC.swift
//  Baitaplon
//
//  Created by ThinhNX on 4/26/16.
//  Copyright © 2016 AsianTech. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var tabBar: UITabBar?
    var items = [List]()
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "HOME"
        self.navigationController?.navigationBar.barTintColor = uicolorFromHex(16729344)
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        let nib = UINib(nibName: "ListtableView", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "cell")
        
        for var i = 0 ; i <= 20 ; i++ {
            
            let list = List()
            
            list.name_ = "Nhà Hàng \(i+1)"
            list.avatar_ = "nhahang"
            list.addess_ = "Đà Nẵng"
            list.start_ = "star30"
            
            items.append(list)
        }
        //tabbar
        tabBar = self.tabBarController!.tabBar
        tabBar!.selectionIndicatorImage = UIImage().makeImageWithColorAndSize(UIColor.whiteColor(), size: CGSizeMake(tabBar!.frame.width/CGFloat(tabBar!.items!.count), tabBar!.frame.height))
        
        // To change tintColor for unselect tabs
        for item in tabBar!.items! as [UITabBarItem] {
            if let image = item.image {
                item.image = image.imageWithColor(UIColor.whiteColor()).imageWithRenderingMode(.AlwaysOriginal)
            }
        }
    }
    
    // MARK: tableview
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:ListtableView = self.tableView.dequeueReusableCellWithIdentifier("cell") as! ListtableView
        let list = items[indexPath.row]
        let imageview: UIImage = UIImage(named: list.avatar_)!
        let imagestar: UIImage = UIImage(named: list.start_)!
        
        cell.nameList.text = list.name_
        cell.imageList.image = imageview
        cell.addessList.text = list.addess_
        cell.startList.image = imagestar
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let item = items[indexPath.row]
        let myshowVC = ShowVC(nibName: "ShowVC", bundle: nil)
        myshowVC.lists = item
        self.navigationController?.pushViewController(myshowVC, animated: true)
        
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
        // Dispose of any resources that can be recreated.
    }
    
    
}
extension HomeVC: UITableViewDelegate,  UITableViewDataSource {
    
}
extension UIImage {
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, size.width, size.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

extension UIImage {
    func imageWithColor(tintColor: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        
        let context = UIGraphicsGetCurrentContext()! as CGContextRef
        CGContextTranslateCTM(context, 0, self.size.height)
        CGContextScaleCTM(context, 1.0, -1.0);
        CGContextSetBlendMode(context, CGBlendMode.Normal)
        
        let rect = CGRectMake(0, 0, self.size.width, self.size.height) as CGRect
        CGContextClipToMask(context, rect, self.CGImage)
        tintColor.setFill()
        CGContextFillRect(context, rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext() as UIImage
        UIGraphicsEndImageContext()
        
        return newImage
    }
}