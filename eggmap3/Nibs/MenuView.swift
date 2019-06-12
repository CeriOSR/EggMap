//
//  MenuView.swift
//  eggmap3
//
//  Created by Mei on 12/06/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class MenuView: UIView {
  
  var delegate: MenuViewDelegate?
  
  //Menu btns to hide if client
  @IBOutlet weak var earningsBtn: UIButton!
  @IBOutlet weak var scantToolBtn: UIButton!
  @IBOutlet weak var requestListBtn: UIButton?
  @IBOutlet weak var requestMapBtn: UIButton?
  @IBOutlet weak var deliveredMenuBtn: UIButton?
  @IBOutlet weak var ordersTakenBtn: UIButton?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
  
  //Menu buttons
  @IBAction func didTapEditProfileBtn(_ sender: Any) {
    tag = 1
  }
  
  
  @IBAction func didTapOrderSummaryBtn(_ sender: Any) {
    tag = 2
  }
  
  @IBAction func didTapMarketBtn(_ sender: Any) {
    tag = 3
  }
  
  @IBAction func didTapRatingsBtn(_ sender: Any) {
    tag = 4
  }
  
  @IBAction func didTapRequestListBtn(_ sender: Any) {
    tag = 5
  }
  
  @IBAction func didTapRequestMapBtn(_ sender: Any) {
    tag = 6
  }
  
  @IBAction func didTapOrdersTakenBtn(_ sender: Any) {
    tag = 7
//    Segue.toWebViewForm.perform(inViewController: self)
  }
  
  @IBAction func didTapDeliveredMenuBtn(_ sender: Any) {
    tag = 8
  }
  
  @IBAction func didTapEarningsBtn(_ sender: Any) {
    tag = 9
  }
  
  @IBAction func didTapScanToolBtn(_ sender: Any) {
    tag = 10
  }
  
  @IBAction func didTapLogoutBtn(_ sender: Any) {
    tag = 11
  }

}

protocol MenuViewDelegate {
  
  func didTapEditBtn()
  func didTapOrderSummaryBtn()
  func didTapMarketBtn()
  func didTapRequestListBtn()
  func didTapRequestMapBtn()
  func didTapOrdersTakenBtn()
  func didTapDeliveredMenuBtn()
  func didTapEarningsBtn()
  func didTapScanToolBtn()
  func didTapLogoutBtn()
  
}
