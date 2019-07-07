//
//  NowPlayingTabCoordinator.swift
//  MyMovieApp
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift

class NowPlayingTabCoordinator: BaseCoordinator<Void> {
  
  override func start() -> Observable<Void> {
    let viewModel = NowPlayingTabViewModel()
    let viewController = NowPlayingTabViewController()
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
