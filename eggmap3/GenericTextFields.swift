//
//  GenericTextFields.swift
//  eggmap3
//
//  Created by Mei on 07/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

@IBDesignable

class GenericTextField: UITextField {
  
  var placeholderFont: UIFont? {
    didSet {
      guard let placeholder = placeholder else { return }
      attributedPlaceholder = NSAttributedString(string: placeholder,
                                                 attributes: [
                                                  NSAttributedString.Key.font: placeholderFont ?? font ?? UIFont.systemFont(ofSize: 17),
                                                  NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.15)
        ])
    }
  }
  
  override var placeholder: String? {
    didSet {
      guard let placeholder = placeholder else { return }
      attributedPlaceholder = NSAttributedString(string: placeholder,
                                                 attributes: [
                                                  NSAttributedString.Key.font: placeholderFont ?? font ?? UIFont.systemFont(ofSize: 17),
                                                  NSAttributedString.Key.foregroundColor: UIColor.black.withAlphaComponent(0.15)
        ])
    }
  }
  
  @IBInspectable var borderWidth: CGFloat = 1 {
    didSet {
      layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable var cornerRadius: CGFloat = 4 {
    didSet {
      layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable var insetX: CGFloat = 16
  @IBInspectable var insetY: CGFloat = 0
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    afterInit()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    afterInit()
  }
  
  func afterInit() {
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return bounds.insetBy(dx: insetX, dy: insetY)
  }
  
}

