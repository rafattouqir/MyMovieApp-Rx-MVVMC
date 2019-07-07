//
//  AppCoordinator.swift
//  Created by RAFAT TOUQIR RAFSUN
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let mainCoordinator = HomeCoordinator(window: window)
    //mainCoordinator.inputParams.param1 = param1
    return coordinate(to: mainCoordinator)
  }
}
