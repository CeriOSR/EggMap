//
//  OrdersPageController.swift
//  eggmap3
//
//  Created by Mei on 15/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class OrdersPageController: UIPageViewController {
  
  var currentIndex = 0
  var index: Int = 0
  lazy var subviewControllers: [UIViewController]  = {
    
    let sb = UIStoryboard(name: "OrderDashboard", bundle: nil)
    let vc1 = sb.instantiateViewController(withIdentifier: "ReadyOrdersController") as! ReadyOrdersController
    let vc2 = sb.instantiateViewController(withIdentifier: "DeliveredOrdersController") as! DeliveredOrdersController
    
    
    return [vc1, vc2]
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    self.delegate = self
    //    self.dataSource = self          //uncomment to allow the gesture based scrolling
    guard let firstVc = subviewControllers.first else {return}
    
    setViewControllers([firstVc], direction: .forward, animated: true, completion: nil)
  }
  
  func nextPageWithIndex(index: Int) {
    if index < currentIndex {
      let vc = subviewControllers[index]
      setViewControllers([vc], direction: .reverse, animated: true, completion: nil)
    } else {
      let vc = subviewControllers[index]
      setViewControllers([vc], direction: .forward, animated: true, completion: nil)
    }
    
  }

  
}

extension OrdersPageController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
  func presentationCount(for pageViewController: UIPageViewController) -> Int {
    return subviewControllers.count
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let vcIndex = subviewControllers.index(of: viewController) else {return nil}
    let previousIndex = vcIndex - 1
    guard previousIndex >= 0 else {return nil}
    guard subviewControllers.count >= previousIndex else {return nil}
    
    return subviewControllers[previousIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let vcIndex = subviewControllers.index(of: viewController) else {return nil}
    let nextIndex = vcIndex + 1
    guard subviewControllers.count != nextIndex else {return nil}
    guard subviewControllers.count > nextIndex else {return nil}
    return subviewControllers[nextIndex]
  }
  
  func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    if completed {
      index += 1
      
      //testing
      guard let viewControllerIndex = subviewControllers.index(of: self.viewControllers!.first!) else {return}
      
      
      self.currentIndex = viewControllerIndex
      
      
      
    }
  }
  
}

