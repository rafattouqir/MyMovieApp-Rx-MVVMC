//
//  BaseCoordinatorExtension.swift
//  Created by RAFAT TOUQIR RAFSUN
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit

enum CoordinatorTransitionType {
  case push
  case modal
  case rootWindow
  case rootNavigation
}

extension BaseCoordinator {
  
  func transition(to destinationViewController: UIViewController) {
    switch transitionType {
    case .push:
      baseViewController.navigationController?.pushViewController(destinationViewController, animated: animated)
    case .modal:
      baseViewController.present(destinationViewController, animated: animated, completion: nil)
    case .rootWindow:
      window.rootViewController = destinationViewController
    case .rootNavigation:
      (baseViewController as! UINavigationController).pushViewController(destinationViewController, animated: false)
    }
  }
  
  func navigateBack() {
    switch transitionType {
    case .push:
      baseViewController.navigationController?.popViewController(animated: animated)
    case .modal:
      baseViewController.dismiss(animated: animated, completion: nil)
    case .rootWindow:
      break
    case .rootNavigation:
      break
    }
  }
  
}
