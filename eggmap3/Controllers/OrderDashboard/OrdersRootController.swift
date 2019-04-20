//
//  OrdersRootController.swift
//  eggmap3
//
//  Created by Mei on 09/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class OrdersRootController: UIViewController {
  
  let pageController = OrdersPageController()
  
  @IBOutlet weak var topMenuView: UIView!
  @IBOutlet weak var readyBtn: UIButton!
  @IBOutlet weak var deliveredBtn: UIButton!
  @IBOutlet weak var pageContainerView: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    
    topMenuView.layer.borderWidth = 0.5
    topMenuView.layer.borderColor = UIColor.lightGray.cgColor
    
    guard let pageView = pageController.view else {return}
    pageView.translatesAutoresizingMaskIntoConstraints = false
    pageContainerView.addSubview(pageView)
    pageView.topAnchor.constraint(equalTo: pageContainerView.topAnchor, constant: 0).isActive = true
    pageView.leftAnchor.constraint(equalTo: pageContainerView.leftAnchor, constant: 0).isActive = true
    pageView.bottomAnchor.constraint(equalTo: pageContainerView.bottomAnchor, constant: 0).isActive = true
    pageView.rightAnchor.constraint(equalTo: pageContainerView.rightAnchor, constant: 0).isActive = true

  }
  
  @IBAction func didTapReadyBtn(_ sender: Any) {
    self.pageController.nextPageWithIndex(index: 0)
    self.pageController.currentIndex = 0
    deliveredBtn.setTitleColor(UIColor.lightGray, for: .normal)
    readyBtn.setTitleColor(view.tintColor, for: .normal)
  }
  
  @IBAction func didTapDeliveredBtn(_ sender: Any) {
    pageController.nextPageWithIndex(index: 1)
    pageController.currentIndex = 1
    deliveredBtn.setTitleColor(view.tintColor, for: .normal)
    readyBtn.setTitleColor(UIColor.lightGray, for: .normal)
  }
}
