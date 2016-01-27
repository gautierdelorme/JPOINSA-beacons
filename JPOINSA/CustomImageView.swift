//
//  CustomImageView.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 27/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class CustomImageView: UIImageView {

    init() {
        super.init(frame: CGRectZero)
        self.layer.cornerRadius = 10
        self.contentMode = .ScaleAspectFill
        self.clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
