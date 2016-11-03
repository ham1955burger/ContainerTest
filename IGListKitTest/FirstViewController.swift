//
//  FirstViewController
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit
import IGListKit

class FirstViewController: UIViewController, IGListAdapterDataSource {
    
    lazy var adapter: IGListAdapter = {
        return IGListAdapter(updater: IGListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView = IGListCollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    let data = [
        GridItem(color: UIColor(red: 237/255.0, green: 73/255.0, blue: 86/255.0, alpha: 1), itemCount: 11)/*,
        GridItem(color: UIColor(red: 56/255.0, green: 151/255.0, blue: 240/255.0, alpha: 1), itemCount: 5),
        GridItem(color: UIColor(red: 112/255.0, green: 192/255.0, blue: 80/255.0, alpha: 1), itemCount: 3),
        GridItem(color: UIColor(red: 163/255.0, green: 42/255.0, blue: 186/255.0, alpha: 1), itemCount: 7)*/
        ] as [Any]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("FirstViewController did load")
        
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        adapter.collectionView = collectionView
        adapter.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
    //MARK: - IGListAdapterDataSource
    
    func objects(for listAdapter: IGListAdapter) -> [IGListDiffable] {
//        guard selectedClass != nil else {
//            return data.map { $0 as! IGListDiffable }
//        }
//        return data.filter { type(of: $0) == selectedClass! }
//            .map { $0 as! IGListDiffable }
        return data as! [IGListDiffable]
    }
    
    func listAdapter(_ listAdapter: IGListAdapter, sectionControllerFor object: Any) -> IGListSectionController {
//        switch object {
//        case is String:   return ExpandableSectionController()
//        case is GridItem: return GridSectionController()
//        default:          return UserSectionController()
//        }
        
        return GridSectionController()
    }
    
    func emptyView(for listAdapter: IGListAdapter) -> UIView? { return nil }
}
