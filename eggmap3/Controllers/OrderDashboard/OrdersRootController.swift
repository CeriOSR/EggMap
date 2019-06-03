//
//  OrdersRootController.swift
//  eggmap3
//
//  Created by Mei on 09/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

fileprivate enum Segue: String {
  case toQRScanner = "seg_QRReader"
  case toLoginForm = "seg_toLoginForm"
  case toWebViewForm = "seg_WebViewForm"
  
  func perform(inViewController vc: UIViewController) {
    vc.performSegue(withIdentifier: rawValue, sender: vc)
  }
}

class OrdersRootController: UIViewController {
  
  let pageController = OrdersPageController()
  
  @IBOutlet weak var blackScreenView: UIView!
  @IBOutlet weak var topMenuView: UIView!
  @IBOutlet weak var readyBtn: UIButton!
  @IBOutlet weak var deliveredBtn: UIButton!
  @IBOutlet weak var pageContainerView: UIView!
  @IBOutlet weak var menuView: UIView!
  
  @IBOutlet weak var profileImageView: UIImageView!
  
  //Menu btns to hide if client
  @IBOutlet weak var earningsBtn: UIButton!
  @IBOutlet weak var scantToolBtn: UIButton!
  @IBOutlet weak var requestListBtn: UIButton?
  @IBOutlet weak var requestMapBtn: UIButton?
  @IBOutlet weak var deliveredMenuBtn: UIButton?
  @IBOutlet weak var ordersTakenBtn: UIButton?
  
  
  var menuOut: Bool = false
  var tag = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    blackScreenView.isHidden = true
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
  
  @IBAction func didTapMenuBarBtn(_ sender: Any) {
    if menuOut == false {
      menuOut = true
      UIView.animate(withDuration: 0.3, animations: { [weak self] in
        self?.menuView.transform = CGAffineTransform(translationX: 247.5, y: 0)
        self?.blackScreenView.isHidden = false
        self?.blackScreenView.layer.zPosition = 0
      }) { (_) in
        //load user info here
      }
    } else {
      menuOut = false
      UIView.animate(withDuration: 0.3, animations: { [weak self] in
        self?.menuView.transform = .identity
        self?.blackScreenView.isHidden = true
        self?.blackScreenView.layer.zPosition = 1
      }) { (_) in
//        completion here
      }
    }
    
    
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
  
  
  //Menu buttons
  @IBAction func didTapEditProfileBtn(_ sender: Any) {
    tag = 1
  }
  
  
  @IBAction func didTapOrderSummaryBtn(_ sender: Any) {
    tag = 2
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapMarketBtn(_ sender: Any) {
    tag = 3
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapRatingsBtn(_ sender: Any) {
    tag = 4
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapRequestListBtn(_ sender: Any) {
    tag = 5
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapRequestMapBtn(_ sender: Any) {
    tag = 6
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapOrdersTakenBtn(_ sender: Any) {
    tag = 7
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapDeliveredMenuBtn(_ sender: Any) {
    tag = 8
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapEarningsBtn(_ sender: Any) {
    tag = 9
    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapScanToolBtn(_ sender: Any) {
    tag = 10
    Segue.toQRScanner.perform(inViewController: self)
  }
  
  @IBAction func didTapLogoutBtn(_ sender: Any) {
    tag = 11
    Segue.toLoginForm.perform(inViewController: self)
  }
  
}

extension OrdersRootController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //send URLs here for webviews
    //pass data here
    
    if segue.identifier == Segue.toWebViewForm.rawValue {
      let navDestination = segue.destination as! UINavigationController
      let destination = navDestination.topViewController as! WebViewController
      switch tag {
      case 1:
        destination.urlString = "https://facebook.com"
      case 2:
        destination.urlString = "https://youtube.com"
      case 3:
        destination.urlString = "https://starbucks.com"
      case 4:
        destination.urlString = "https://medium.com"
      default:
        return
      }
    }
  }
}

