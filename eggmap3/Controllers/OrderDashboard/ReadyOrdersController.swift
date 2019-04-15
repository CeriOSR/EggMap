//
//  ReadyOrdersController.swift
//  eggmap3
//
//  Created by Mei on 10/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

class ReadyOrdersController: UITableViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
}

extension ReadyOrdersController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    return UITableViewCell()
    
  }
}

class ReadyOrdersCell: UITableViewCell {
  
  
  @IBOutlet weak var orderIdLbl: UILabel!
  @IBOutlet weak var orderStatusLbl: UILabel!
  @IBOutlet weak var dateLbl: UILabel!
  @IBOutlet weak var productLbl: UILabel!
  @IBOutlet weak var hourglassBtn: GenericButton!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  @IBAction func didTapHourglassBtn(_ sender: Any) {
    //animate to flip the hour glass
  }
  
}
