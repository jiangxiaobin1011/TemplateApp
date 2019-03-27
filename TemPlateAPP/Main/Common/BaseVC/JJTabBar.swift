//
//  JJTabBar.swift
//  TemPlateAPP
//
//  Created by lorne on 2019/3/20.
//  Copyright © 2019 ice. All rights reserved.
//

import Foundation
import UIKit



class JJTabBar: UITabBar {
    
    
    var centerBtn : UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() -> Void {
        centerBtn = UIButton(type: .contactAdd)
        centerBtn.backgroundColor = UIColor.red
        centerBtn.layer.cornerRadius = 20
        centerBtn.clipsToBounds = true
        self.addSubview(centerBtn)
        
    }
    override func layoutSubviews() -> Void {
        
        super.layoutSubviews()
        
        let newCount : Int!  = (self.items?.count)! + 1
        
        let width : CGFloat = UIScreen.main.bounds.size.width / CGFloat(newCount!)
        
        var index : Int = 0
        
        for subView in subviews {
            
            if subView.isKind(of: NSClassFromString("UITabBarButton")!){
                subView.frame.size.width = width
                subView.frame.origin.x = CGFloat(index) * width
                index += 1
            }
            if index == (self.items?.count)! / 2 {
                index += 1
            }
        }
        
        centerBtn.frame.size.width = 40
        centerBtn.frame.size.height = 40
        centerBtn.center.x = self.bounds.size.width * 0.5
        centerBtn.center.y = self.bounds.size.height * 0.5

        
        
    }
    
    
}


