//
//  GYTabBarTitleView.swift
//  airfightSex
//
//  Created by zhuguangyang on 16/9/23.
//  Copyright © 2016年 giant. All rights reserved.
//

import UIKit

//今天发烧了
//不开心
class GYTabBarTitleView: UIView {

    var leftBtn:UIButton?
    var rightBtn: UIButton?
    var imageView: UIImageView?
    
    init(frame: CGRect, leftBtnTitle: String,rightBtnTitle: String) {
        super.init(frame: frame)

        setUI(left: leftBtnTitle, right: rightBtnTitle)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    private func setUI(left: String,right: String) {
        
        leftBtn = UIButton.createButton(imageName: nil, slectImageName: nil, title: left, target: nil, action: nil)
        leftBtn?.backgroundColor = tabbarbgColor
        leftBtn?.setTitleColor(tabbarbgColor, for: UIControlState.selected)
        leftBtn?.setTitleColor(UIColor.white, for: UIControlState.normal)
        rightBtn = UIButton.createButton(imageName: nil, slectImageName: nil, title: right, target: nil, action: nil)
        rightBtn?.backgroundColor = tabbarbgColor
        rightBtn?.setTitleColor(tabbarbgColor, for: UIControlState.selected)
        rightBtn?.setTitleColor(UIColor.white, for: UIControlState.normal)
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: self.frame.size.height))
        imageView?.image = #imageLiteral(resourceName: "mycity_highlight.png")
        imageView?.center = CGPoint(x: self.frame.size.width * 1/2, y: self.frame.size.height * 1/2)
        
        addSubview(leftBtn!)
        addSubview(rightBtn!)
        addSubview(imageView!)
        
        leftBtn?.frame = CGRect(x: 0, y: 0, width: self.frame.size.width * 1/2, height: self.frame.size.height)
        
        rightBtn?.frame = CGRect(x: self.frame.size.width * 2/4, y: 0, width: self.frame.size.width * 1/2, height: self.frame.size.height)
      
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
