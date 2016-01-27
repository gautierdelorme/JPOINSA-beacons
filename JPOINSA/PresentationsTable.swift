//
//  PresentationsTable.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 27/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class PresentationsTable: UITableView {
    
    init(frame: CGRect, delegate: UITableViewDelegate) {
        super.init(frame: frame, style: .Plain)
        self.registerClass(PresentationCell.self, forCellReuseIdentifier: PresentationCell.ReuseIdentifier)
        self.delegate = delegate
        self.dataSource = PresentationManager.sharedInstance
        self.backgroundColor = UIColor.clearColor()
        self.separatorStyle = .None
        self.showsVerticalScrollIndicator = false
        self.allowsSelection = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
