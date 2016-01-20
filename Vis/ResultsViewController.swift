//
//  ResultsViewController.swift
//  Vis
//
//  Created by Lee Brimelow on 1/19/16.
//  Copyright © 2016 Lee Brimelow. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, PagingMenuControllerDelegate {

    @IBOutlet weak var container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pagingMenuController = self.childViewControllers.first as! PagingMenuController
        pagingMenuController.delegate = self
        
        let average = self.storyboard!.instantiateViewControllerWithIdentifier("average")
        average.title = "Average Results"
        
        let another = self.storyboard!.instantiateViewControllerWithIdentifier("another")
        another.title = "More Results"
        
        let options = PagingMenuOptions()
        options.menuHeight = 50
        options.backgroundColor = UIColor.clearColor()
        options.selectedBackgroundColor = UIColor.clearColor()
        options.font = UIFont.systemFontOfSize(17, weight: UIFontWeightRegular)
        options.selectedFont = UIFont.systemFontOfSize(17, weight: UIFontWeightSemibold)
        options.textColor = UIColor.whiteColor()
        options.selectedTextColor = UIColor(red:0.99, green:0.22, blue:0.53, alpha:1)
        options.menuDisplayMode = PagingMenuOptions.MenuDisplayMode.SegmentedControl
        
        let viewControllers = [average, another]
        pagingMenuController.setup(viewControllers: viewControllers, options: options)
    }
}
