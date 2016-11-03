//
//  CustomSegue.swift
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit

class CustomSegue: UIStoryboardSegue {
    override func perform() {
        let sourceVC = self.source
        let destinationVC = self.destination
        
        sourceVC.view.addSubview(destinationVC.view)
    }
}
