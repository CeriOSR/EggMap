//
//  AuthCredentials.swift
//  eggmap3
//
//  Created by Mei on 21/04/2019.
//  Copyright © 2019 CeriOS_Rey. All rights reserved.
//

import Foundation

struct AuthCredentials: Decodable {
  var uid: String?
  var uuid: String?
  var userType: String?
}
