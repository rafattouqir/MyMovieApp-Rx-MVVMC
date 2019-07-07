//
//  Storyboard.swift
//  Created by RAFAT TOUQIR RAFSUN
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

enum Storyboard {
  case main
  
  var identifier: String {
    switch self {
    case .main:
      return "Main"
    }
  }
}
