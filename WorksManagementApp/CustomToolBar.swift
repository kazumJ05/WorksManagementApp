//
//  CustomToolBar.swift
//  WorksManagementApp
//
//  Created by 大原一倫 on 2018/12/26.
//  Copyright © 2018 oharakazumasa. All rights reserved.
//

import UIKit

class CustomToolBar: UIToolbar {
    
    let addHeight: CGFloat = 20
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height += addHeight
        return newSize
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
