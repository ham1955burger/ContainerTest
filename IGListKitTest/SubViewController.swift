//
//  SubViewController.swift
//  IGListKitTest
//
//  Created by ouniwang on 11/3/16.
//  Copyright © 2016 ham. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    @IBOutlet var containerButtons: [UIButton]!
    
    var containerView: ContainerViewController?
    
    
    override func viewDidLoad() {
        
        self.containerButtons[0].isSelected = true
        /*
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController")
    self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChildViewController(self.currentViewController!)
        self.addSubview(subView: self.currentViewController!.view, toView: self.containerView)
        */
        
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sub_to_container" {
            self.containerView = segue.destination as? ContainerViewController
        }
    }
    
    // MARK: - Actions
    
    
    @IBAction func actionContainerButtons(_ sender: AnyObject) {
        
        for containerButton in self.containerButtons {
            if containerButton.isSelected && containerButton.tag == sender.tag {
                // 이미 선택되어있는 button 누르면 retrun
                return
            }
            
            // 전체 select효과를 풀어줌
            containerButton.isSelected = false
            
            if sender.tag == containerButton.tag {
                // 선택한 button selected true
                containerButton.isSelected = true
            }
        }
        
        var segueIdentifier: String = ""
        
        switch sender.tag {
        case 0:
            segueIdentifier = "container_to_first"
        case 1:
            segueIdentifier = "container_to_second"
        case 2:
            segueIdentifier = "container_to_third"
        default:
            print("never not execute")
        }
        
        self.containerView!.segueIdentifierReceivedFromParent(segueIdentifier: segueIdentifier)
        
         
        /*
        
        var identifier: String = ""
        
        switch sender.tag {
        case 0:
            identifier = "FirstViewController"
        case 1:
            identifier = "SecondViewController"
        case 2:
            identifier = "ThirdViewController"
        default:
            print("never not execute")
        }
        
        let newViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier)
        newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
        self.currentViewController = newViewController
        */
    }
    
    
    // MARK: - Functions
    
    
    /*
    func addSubview(subView:UIView, toView parentView:UIView) {
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
        parentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[subView]|",
                                                                                 options: [], metrics: nil, views: viewBindingsDict))
    }
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView:self.containerView!)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
        UIView.animate(withDuration: 0.5, animations: {
            newViewController.view.alpha = 1
            oldViewController.view.alpha = 0
            },
                                   completion: { finished in
                                    oldViewController.view.removeFromSuperview()
                                    oldViewController.removeFromParentViewController()
                                    newViewController.didMove(toParentViewController: self)
        })
    }
 
 */
}
