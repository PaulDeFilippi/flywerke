//
//  Tweet.swift
//  flywerke
//
//  Created by Paul Defilippi on 12/9/16.
//  Copyright © 2016 Paul Defilippi. All rights reserved.
//

import Foundation

class Tweet {
    
    var text: String?
    var date: String?
    
    init(text: String, date: String) {
        self.text = text
        self.date = date
    }
}
