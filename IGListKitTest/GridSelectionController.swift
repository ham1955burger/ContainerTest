//
//  GridSelectionController.swift
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit
import IGListKit

class GridItem: NSObject {
    let color: UIColor
    let itemCount: Int
    
    init(color: UIColor, itemCount: Int) {
        self.color = color
        self.itemCount = itemCount
    }
}

class GridSectionController: IGListSectionController, IGListSectionType {
    
    var object: GridItem?
    
    override init() {
        super.init()
        self.minimumInteritemSpacing = 1
        self.minimumLineSpacing = 1
    }
    
    func numberOfItems() -> Int {
        return object?.itemCount ?? 0
    }
    
    func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext?.containerSize.width ?? 0
        let itemSize = floor(width / 3.0125)
        return CGSize(width: itemSize, height: itemSize)
    }
    
    func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CenterLabelCell.self, for: self, at: index) as! CenterLabelCell
        cell.label.text = "\(index + 1)"
        cell.backgroundColor = object?.color
        return cell
    }
    
    func didUpdate(to object: Any) {
        self.object = object as? GridItem
    }
    
    func didSelectItem(at index: Int) {
        print("selected cell!!")
        print(index)
    }
}
