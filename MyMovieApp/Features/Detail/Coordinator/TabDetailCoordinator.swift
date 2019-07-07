//
//  TabDetailCoordinator.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift

protocol TabDetailInputsParamsType {
  
}

class TabDetailCoordinator: BaseCoordinator<Void>, TabDetailInputsParamsType {
  
  // MARK: Property
  
  // MARK: Public
  
  override func start() -> Observable<Void> {
    let viewModel = TabDetailViewModel()
    let viewController = TabDetailViewController()
    viewController.viewModel = viewModel
    
    viewModel
      .coordinates
      .navigateBack
      .subscribe(onNext: { [weak self] _ in
        self?.navigateBack()})
      .disposed(by: disposeBag)
    
    transition(to: viewController)
    return viewModel.coordinates.navigateBack
  }
  
  // MARK: Private
  
  // MARK: InputParams
  
  public var inputsParams: TabDetailInputsParamsType { return self }
}
