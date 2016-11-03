//
//  CenterLabelCell.swift
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit

class CenterLabelCell: UICollectionViewCell {
    
    lazy var label: UILabel = {
        let view = UILabel()
        view.backgroundColor = .clear
        view.textAlignment = .center
        view.textColor = .white
        view.font = .boldSystemFont(ofSize: 18)
        self.contentView.addSubview(view)
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = contentView.bounds
    }
    
}
