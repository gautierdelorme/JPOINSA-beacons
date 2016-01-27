//
//  CustomLabel.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 27/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {

    init() {
        super.init(frame: CGRectZero)
        self.textAlignment = .Center
        self.textColor = UIColor.whiteColor()
        self.shadowColor = UIColor.blackColor()
        self.shadowOffset = CGSizeMake(0, 1)
        self.numberOfLines = 0
        self.font = UIFont.systemFontOfSize(20)
        self.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
