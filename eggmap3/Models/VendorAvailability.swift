//
//  StoreAvailability.swift
//  eggmap3
//
//  Created by Mei on 21/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import Foundation

struct LocationClose {
  var oldOperatingStatus: String?
  var newOperatingStatus: String?
}

struct LocationOpen {
  var oldOperatingStatus: String?
  var newOperatingStatus: String?
}

struct RequestResult: Decodable {
  private enum CodingKeys: String, CodingKey {
    case action = "Action", params = "Params", data = "DATA"
  }
  var action : String?
  var params : Parameters?
  var data : UserData?
}

struct Parameters: Decodable {
  private enum CodingKeys: String, CodingKey{
    case actionGet = "Action_get", uid = "uid_get", id = "Id_get"
  }
  var actionGet: String?
  var uid: String?
  var id: String?
}

struct UserData: Decodable {
  private enum CodingKeys: String, CodingKey {
    case oldOperatingStatus = "OldOperatingStatus", newOperatingStatus = "NewOperatingStatus"
  }
  var oldOperatingStatus: String?
  var newOperatingStatus: String?
}
