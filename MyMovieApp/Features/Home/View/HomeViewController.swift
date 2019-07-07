//
//  HomeViewController.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UITabBarController {

    // MARK: IBOutlet
    
    // MARK: Property
    
    var viewModel: HomeViewModelType!
    let disposeBag = DisposeBag()
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        delegate = self
    }
    
    func bindViewModel() {
    }
}

extension HomeViewController: UITabBarControllerDelegate {
  
  func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
    guard let viewControllers = viewControllers else { return false }
    if viewControllers[tabBarController.selectedIndex] == viewController {
      viewModel.inputs.tabIndexTrigger.onNext(tabBarController.selectedIndex)
      return false
    }
    return true
  }
  
}
