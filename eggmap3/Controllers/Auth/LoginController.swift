//
//  ViewController.swift
//  eggmap3
//
//  Created by Mei on 07/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
  
  fileprivate enum Segue: String {
    case ShowOrdersForm = "ShowOrdersForm"
    
    
    func perform(inViewController vc: UIViewController) {
      vc.performSegue(withIdentifier: rawValue, sender: vc)
    }
  }
  

  
  @IBOutlet weak var emailTxtFld: GenericTextField!
  
  @IBOutlet weak var passwordTxtFld: GenericTextField!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  @IBAction func didTapLoginBtn(_ sender: Any) {
    Segue.ShowOrdersForm.perform(inViewController: self)
  }
  

}

