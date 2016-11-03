//
//  ContainerViewController.swift
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {
    //TODO: 여기서 REST Code를 넣고 변수optional로 만들어서 nil이면 REST호출 nil이 아니면 REST호출없이 바로 View띄우게 하면 될듯.
    
//    var vc : UIViewController!
    var segueIdentifier : String!
    var lastViewController: UIViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 기본은 첫번쨰
        segueIdentifierReceivedFromParent(segueIdentifier: "container_to_first")
    }
    
    func segueIdentifierReceivedFromParent(segueIdentifier: String){
        self.performSegue(withIdentifier: segueIdentifier, sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Avoids creation of a stack of view controllers
        let vc = segue.destination
        
        if lastViewController != nil{
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            vc.view.alpha = 0
            vc.view.layoutIfNeeded()
            UIView.animate(withDuration: 0.5, animations: {
                vc.view.alpha = 1
                self.lastViewController.view.alpha = 0
                },
                           completion: { finished in
                            self.lastViewController.view.removeFromSuperview()
                            vc.didMove(toParentViewController: self)
                            self.lastViewController = vc
            })
        } else {
            //Adds View Controller to Container "first" or "second"
            
            self.addChildViewController(vc)
//            vc.view.frame = CGRect(x: 0,y: 0, width: self.view.frame.width,height: self.view.frame.height)
            self.view.addSubview(vc.view)
            vc.didMove(toParentViewController: self)
            lastViewController = vc
        }
    }
}
