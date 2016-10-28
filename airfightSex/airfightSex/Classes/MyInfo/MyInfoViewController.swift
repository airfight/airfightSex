//
//  MyInfoViewController.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/21.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

let kImageHeight:CGFloat = 200

class MyInfoViewController: UITableViewController{

    
    var headImageView: UIImageView!
    var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //将头像添加到Nav上面 并给予缩放的效果
        let titleView = UIView()
        self.navigationItem.titleView = titleView
        
        headImageView = UIImageView(image: UIImage(named:"Mine_AboutUs_Logo"))
        headImageView.layer.cornerRadius = 35;
        headImageView.layer.masksToBounds = true;
        headImageView.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        headImageView.center = CGPoint(x: titleView.center.x, y: 0)
        titleView.addSubview(headImageView)
        
        self.navigationController?.transView?.backgroundColor = UIColor.red
        
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        //navigationBar设置 底部黑线
//        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        let tableHeadView = UINib.init(nibName: "MyInfoHeadView", bundle: nil).instantiate(withOwner: nil, options: nil).last as! MyInfoHeadView
        tableHeadView.frame = CGRect(x: 0, y: 0, width:SCREEN_WIDTH, height: 45)
        tableHeadView.backgroundColor = UIColor.clear
        self.tableView.tableHeaderView = tableHeadView
        self.tableView.backgroundColor = UIColor.clear
        self.tableView.contentInset = UIEdgeInsets(top: CGFloat(kImageHeight), left: 0, bottom: 0, right: 0)
        topView = UIView(frame: CGRect(x: 0, y: -kImageHeight, width: SCREEN_WIDTH, height: kImageHeight))
        topView.backgroundColor = UIColor.blue
        self.tableView.insertSubview(topView, at: 0)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MyInfoViewController {
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y + scrollView.contentInset.top
        
        var scale: CGFloat = 1.0
        
        //放大
        if offsetY < 0 {
            //允许下拉放大的最大距离为300
            // 1.5是放大的最大倍数，当达到最大时，大小为：1.5 * 70 = 105
            
            scale = CGFloat(min(1.5,Double(1 - offsetY / 300)))
        } else if (offsetY > 0) {//缩小
            // 允许向上超过导航条缩小的最大距离为300
            // 为了防止缩小过度，给一个最小值为0.45，其中0.45 = 31.5 / 70.0，表示
            // 头像最小是31.5像素
            scale = max(0.45, (1 - offsetY / 300))
        }
        
        headImageView.transform = CGAffineTransform(scaleX: scale, y: scale)
        var frame = headImageView.frame
        frame.origin.y = -headImageView.layer.cornerRadius
            / 2
        headImageView.frame = frame
        
        let offsetY1 = scrollView.contentOffset.y
        // 修改导航的透明度
        let p = CGFloat((offsetY1 + CGFloat(kImageHeight)) / (CGFloat(kImageHeight) - 64.0))
        self.navigationController?.transView?.alpha = p
        //缩放图片
        if offsetY1 < -kImageHeight {
            //缩放系数
            let s:CGFloat = 0.01
            let sc: CGFloat = (-offsetY1 - kImageHeight) * s
            
            self.topView.transform = CGAffineTransform(scaleX: 1 + sc, y: 1 + sc)
            
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "infoPushID", sender: nil)
    }
    
    
}
