//
//  VendorScheduleInfo.swift
//  eggmap3
//
//  Created by Mei on 21/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import Foundation

struct VendorScheduleInfo {
  //no id, no itemholdings, stops at lat lng
  var userRef: String?
  var userRefName: String?
  var name: String?
  var desc: String?
  var locationOwner: String?
  var locationOwnerName: String?
  var isHouseLocation: String?
  var closeOnPublicHolidays: String?
  var unitNo: String?
  var streetNo: String?
  var streetName: String?
  var city: String?
  var stateProvince: String?
  var country: String?
  var zipPostalCode: String?
  var lat: String?
  var long: String?
  var schedule: [OfficeHours]?
}

struct OfficeHours {
  var day: String?
  var hoursOpen: String?
  var hoursClose: String?
}
