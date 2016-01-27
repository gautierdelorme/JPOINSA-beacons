//
//  Presentation.swift
//  JPOINSA
//
//  Created by Gautier Delorme on 26/01/16.
//  Copyright © 2016 gautierdelorme. All rights reserved.
//

import UIKit

class Presentation: NSObject {
    
    let title       :   String
    let place       :   String
    let summary     :   String
    let image       :   String
    
    init(title: String, place: String, image: String, summary: String) {
        self.title = title
        self.place = place
        self.summary = summary
        self.image = image
    }    
}