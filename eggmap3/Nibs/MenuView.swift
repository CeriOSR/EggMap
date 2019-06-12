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
  
  @IBOutlet weak var profileImageView: UIImageView?
  @IBOutlet weak var nameLbl: UILabel?
  
  //Menu btns to hide if client
  @IBOutlet weak var earningsBtn: UIButton!
  @IBOutlet weak var scantToolBtn: UIButton!
  @IBOutlet weak var requestListBtn: UIButton?
  @IBOutlet weak var requestMapBtn: UIButton?
  @IBOutlet weak var deliveredMenuBtn: UIButton?
  @IBOutlet weak var ordersTakenBtn: UIButton?
  
  override func awakeFromNib() {
    super.awakeFromNib()
    profileImageView?.layer.cornerRadius = 37.5
    profileImageView?.layer.masksToBounds = true
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
    delegate?.didTapEditBtn()
  }
  
  
  @IBAction func didTapOrderSummaryBtn(_ sender: Any) {
    delegate?.didTapOrderSummaryBtn()
  }
  
  @IBAction func didTapMarketBtn(_ sender: Any) {
    delegate?.didTapMarketBtn()
  }
  
  @IBAction func didTapRatingsBtn(_ sender: Any) {
    //nothing yet
  }
  
  @IBAction func didTapRequestListBtn(_ sender: Any) {
    delegate?.didTapRequestListBtn()
  }
  
  @IBAction func didTapRequestMapBtn(_ sender: Any) {
    delegate?.didTapRequestMapBtn()
  }
  
  @IBAction func didTapOrdersTakenBtn(_ sender: Any) {
    delegate?.didTapOrdersTakenBtn()
  }
  
  @IBAction func didTapDeliveredMenuBtn(_ sender: Any) {
    delegate?.didTapDeliveredMenuBtn()
  }
  
  @IBAction func didTapEarningsBtn(_ sender: Any) {
    delegate?.didTapEarningsBtn()
  }
  
  @IBAction func didTapScanToolBtn(_ sender: Any) {
    delegate?.didTapScanToolBtn()
  }
  
  @IBAction func didTapLogoutBtn(_ sender: Any) {
    delegate?.didTapLogoutBtn()
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
