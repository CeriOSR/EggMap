//
//  LocationInfo.swift
//  eggmap3
//
//  Created by Mei on 21/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import Foundation

struct Location {
  var locationName: String
  var locationAddress: String
}

struct LocationInfo {
  var id: String?
  var userRef: String?
  var userRefName: String?
  var name: String?
  var desc: String?
  var locationOwner: String?
  var locationOwnerName: String?
  var isHouseLocation: String?
  var closeOnPublicHolidays: String?
  var itemHolding: String?
  var totalItemHolding: String?
  var unitNo: String?
  var streetNo: String?
  var streetName: String?
  var city: String?
  var stateProvince: String?
  var country: String?
  var zipPostalCode: String?
  var lat: String?
  var long: String?
  var staticLocation: String?
  var status: String?
  var statusName: String?
  var operatingStatus: String?
  var operatingStatusName: String?
}
