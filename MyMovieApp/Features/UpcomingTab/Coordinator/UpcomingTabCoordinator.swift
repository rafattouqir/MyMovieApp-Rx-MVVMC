//
//  UpcomingTabCoordinator.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift

class UpcomingTabCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let viewModel = UpcomingTabViewModel()
    let viewController = UpcomingTabViewController()
    viewController.viewModel = viewModel
    
    viewModel.coordinates.navigateToTabDetail
      .flatMapLatest { [weak self] _ -> Observable<Void> in
        guard let `self` = self else { return Observable.just(()) }
        return self.navigateToTabDetail(window: self.window, baseViewController: viewController)
      }
      .subscribe()
      .disposed(by: disposeBag)
    
    transition(to: viewController)
    
    return .never()
  }
  
  private func navigateToTabDetail(window: UIWindow, baseViewController: UIViewController) -> Observable<Void> {
    let tabDetailCoordinator = TabDetailCoordinator(window: window, baseViewController: baseViewController, transitionType: .push)
    return coordinate(to: tabDetailCoordinator)
  }
}
