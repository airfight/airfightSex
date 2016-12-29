//
//  BooksViewController.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit
import YTKNetwork

class BooksViewController: GYBaseVC {

    
    //MARK: - Attributes
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        
        tableView = UITableView()
        tableView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        tableView.backgroundColor = UIColor.blue
 
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        view.addSubview(tableView)

        
        
        
    }

    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
