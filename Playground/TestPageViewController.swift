//
//  TestPageViewController.swift
//  Playground
//
//  Created by IT Mac on 2/19/16.
//  Copyright © 2016 IT Mac. All rights reserved.
//

import UIKit

class TestPageViewController: UIPageViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController], direction: .Forward, animated: true, completion: nil)
        }
    }

}

// MARK: Page view controller data source

extension TestPageViewController: UIPageViewControllerDataSource {
    
    // what happen when finding previous page
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    // what happen when finding next page
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.indexOf(viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
        
    }
}

// define array to reference the view controllers

private func newPageController(label: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("\(label)Page")
}

private(set) var orderedViewControllers: [UIViewController] = {
    return [newPageController("first"), newPageController("second")]
    
}()
