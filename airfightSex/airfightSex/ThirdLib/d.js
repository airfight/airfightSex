/* 
 main.js
 airfightSex
 
 Created by zhuguangyang on 16/9/13.
 Copyright © 2016年 giant. All rights reserved.
 */


defineClass("ViewController", {
            //instance method definitions
            tableView_didSelectRowAtIndexPath: function(tableView, indexPath) {
            var row = indexPath.row()
            if (self.dataSource().length > row) {  //加上判断越界的逻辑
            var content = self.dataArr()[row];
            var ctrl = JPViewController.alloc().initWithContent(content);
            self.navigationController().pushViewController(ctrl);
            }
            }
            }, {})

require('UIColor');
defineClass('ViewController', {
            viewDidLoad: function() {
            super.viewDidLoad();
            
            self.view().setBackgroundColor(UIColor.redColor());
            NSLog("shuai??");
            },
            didReceiveMemoryWarning: function() {
            super.didReceiveMemoryWarning();
            // Dispose of any resources that can be recreated.
            },
            });