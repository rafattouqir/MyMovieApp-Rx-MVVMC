//
//  HomeViewModel.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import RxSwift
import RxCocoa

protocol HomeViewModelInputs {
  var tabIndexTrigger: PublishSubject<Int> { get }
}

protocol HomeViewModelOutputs {
  
}

protocol HomeViewModelCoordinates {
  var navigateTabIndex: PublishSubject<Int> { get }
}

protocol HomeViewModelType {
  var inputs: HomeViewModelInputs { get }
  var outputs: HomeViewModelOutputs { get }
  var coordinates: HomeViewModelCoordinates { get }
}

class HomeViewModel: HomeViewModelType, HomeViewModelInputs, HomeViewModelOutputs, HomeViewModelCoordinates {
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  // MARK: Init
    
  public init() {
    inputs
      .tabIndexTrigger
      .bind(to: coordinates.navigateTabIndex)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  var tabIndexTrigger = PublishSubject<Int>()
  
  // MARK: Output
  
  // MARK: Coordinate
  var navigateTabIndex = PublishSubject<Int>()
  
  // MARK: Input&Output&Coordinate
    
  public var outputs: HomeViewModelOutputs { return self }
  public var inputs: HomeViewModelInputs { return self }
  public var coordinates: HomeViewModelCoordinates { return self }
}
