//
//  AgentProfileController.swift
//  eggmap3
//
//  Created by Mei on 07/06/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import UIKit

struct Address {
  let name: String
  let address: String
  let town: String
  let province: String
  let available: Bool
}

class AgentProfileController: UITableViewController {

  var addressList = [Address]()
    override func viewDidLoad() {
        super.viewDidLoad()
      
      addressList = [Address(name: "Meta Cafe", address: "1234 Here St.", town: "Richmond", province: "BC", available: true),
                    Address(name: "Home", address: "1234 Laurence St.", town: "Surrey", province: "BC", available: true),
                    Address(name: "Wife's house", address: "1234 Andrea St.", town: "Vancouver", province: "BC", available: false)]
      
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return addressList.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileAddressCell.identifier, for: indexPath) as! ProfileAddressCell
        let address = addressList[indexPath.item]
          cell.nameLbl?.text = address.name
          cell.addressLbl?.text = address.address
          cell.townLbl?.text = address.town + address.province
      if address.available == true {
        cell.availableImageView?.image = #imageLiteral(resourceName: "notificationMarker")
        cell.availableLbl?.text = "Available"
      } else {
        cell.availableImageView?.image = #imageLiteral(resourceName: "tick")
        cell.availableLbl?.text = "Unavailable"
      }


        return cell
    }
  
  override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return "My Locations:"
  }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
  

}

class ProfileAddressCell: UITableViewCell {
  @IBOutlet weak var nameLbl: UILabel?
  @IBOutlet weak var addressLbl: UILabel?
  @IBOutlet weak var townLbl: UILabel?
  @IBOutlet weak var availableLbl: UILabel?
  @IBOutlet weak var availableImageView: UIImageView?
  
  override func awakeFromNib() {
    availableImageView?.layer.cornerRadius = 15
    availableImageView?.layer.masksToBounds = true
  }

}
