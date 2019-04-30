//
//  ReadyOrdersController.swift
//  eggmap3
//
//  Created by Mei on 10/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

fileprivate enum Segue: String {
  case showClientMapView = "ShowClientMapView"
  
  func perform(inViewController vc: UIViewController) {
    vc.performSegue(withIdentifier: rawValue, sender: vc)
  }
}

class ReadyOrdersController: UITableViewController {
  
  var readyOrders = [DeliveredOrder]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let oneOrderDetails = OrderDetails.init(productName: "Marlboro Lights", qty: "2")
    let one = DeliveredOrder.init(id: "12334565", contractNo: "123", memo: "pick up tommorow", policyStatusName: "abc123", orderDetails: [oneOrderDetails], date: "2019-3-10")
    let twoOrderDetails = OrderDetails.init(productName: "Marlboro Red", qty: "5")
    let two = DeliveredOrder.init(id: "13512341", contractNo: "135", memo: "this is awesome", policyStatusName: "abc135", orderDetails: [twoOrderDetails], date: "2019-4-20")
    let threeOrderDetails = OrderDetails.init(productName: "Marlboro Black", qty: "10")
    let three = DeliveredOrder.init(id: "432134644", contractNo: "432", memo: "Cool as hell", policyStatusName: "abc987", orderDetails: [threeOrderDetails], date: "2019-4-5")
    readyOrders = [one, two, three]
    
  }
}

extension ReadyOrdersController {
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return readyOrders.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: ReadyOrdersCell.identifier, for: indexPath) as! ReadyOrdersCell
    let order = readyOrders[indexPath.row]
    cell.dateLbl.text = order.date
    cell.orderIdLbl.text = order.id
    cell.orderStatusLbl.text = order.policyStatusName
    cell.productLbl.text = order.orderDetails?[0].productName
    return cell
    
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    Segue.showClientMapView.perform(inViewController: self)
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
