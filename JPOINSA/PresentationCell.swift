//
//  PresentationCell.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class PresentationCell: UITableViewCell {
    
    static let ReuseIdentifier = "PresentationCell"
    static let margin: CGFloat = 15
    
    private let titleLabel: UILabel
    private let customView: UIImageView
    
    var presentation: Presentation! {
        didSet {
            updateComponents()
        }
    }

    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        self.titleLabel = CustomLabel()
        self.customView = CustomImageView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        self.contentView.backgroundColor = self.backgroundColor
        
        self.customView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.customView)
    }
    
    func updateComponents() {
        self.customView.image = UIImage(named: self.presentation.image)
        self.titleLabel.text = "\(self.presentation.title) \n \(self.presentation.place)"
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.customView.frame = CGRectMake(PresentationCell.margin, PresentationCell.margin, self.contentView.bounds.width-2*PresentationCell.margin, self.contentView.bounds.height-2*PresentationCell.margin)
        self.titleLabel.frame = self.customView.bounds
        
        let textHeight = titleLabel.text?.heightWithConstrainedWidth(self.customView.bounds.width, font: titleLabel.font)
        if let textHeight = textHeight {
            titleLabel.frame = CGRectMake(self.customView.bounds.origin.x, (self.customView.bounds.origin.y + self.customView.bounds.height) - textHeight, self.customView.bounds.width, textHeight)
        } else {
            titleLabel.frame = CGRectZero
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}