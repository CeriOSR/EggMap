//
//  ReadyOrders.swift
//  eggmap3
//
//  Created by Mei on 21/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import Foundation

struct DeliveredOrder {
  var id: String?
  var contractNo: String?
  var memo: String?
  var policyStatusName: String?
  var orderDetails: [OrderDetails]?
  var date: String?
}

struct OrderItem {
  var orderNumber: String
  var orderDate: String
  var orderStatus: String
  var orderProduct: String
}

struct ReadyOrder {
  var id: String?
  var contractNo: String?
  var memo: String?
  var policyStatusName: String?
  var orderDetails: [OrderDetails]?
  var pickupCodeImgSrc: String?
  var date: String?
}

struct OrderDetails {
  var productName: String?
  var qty: String?
}

