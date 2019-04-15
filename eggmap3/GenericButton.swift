//
//  GenericButton.swift
//  eggmap3
//
//  Created by Mei on 07/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class GenericButton: UIButton {
  
  @IBInspectable var firstColor: UIColor = UIColor.clear {
    didSet {
      updateView()
    }
  }
  @IBInspectable var secondColor: UIColor = UIColor.clear {
    didSet {
      updateView()
    }
  }
  override class var layerClass: AnyClass {
    get {
      return CAGradientLayer.self
    }
  }
  @IBInspectable var cornerRadius: CGFloat = 0 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable var borderColor: UIColor = UIColor.lightGray {
    didSet {
      layer.borderColor = borderColor.cgColor
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 0.5 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var isHorizontal: Bool = true {
    didSet {
      updateView()
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  func updateView() {
    let layer = self.layer as! CAGradientLayer
    layer.colors = [firstColor, secondColor].map{$0.cgColor}
    if (self.isHorizontal) {
      layer.startPoint = CGPoint(x: 0, y: 0.5)
      layer.endPoint = CGPoint (x: 1, y: 0.5)
    } else {
      layer.startPoint = CGPoint(x: 0.5, y: 0)
      layer.endPoint = CGPoint (x: 0.5, y: 1)
    }
  }

  
}
