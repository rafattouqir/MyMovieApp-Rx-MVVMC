//
//  UpcomingTabViewModel.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//
import RxSwift
import RxCocoa

protocol UpcomingTabViewModelInputs {
  var rightBarButtonTrigger: PublishSubject<Movie> { get }
}

protocol UpcomingTabViewModelOutputs {
    
}

protocol UpcomingTabViewModelCoordinates {
  var navigateToTabDetail: PublishSubject<Movie> { get }
}

protocol UpcomingTabViewModelType {
  var inputs: UpcomingTabViewModelInputs { get }
  var outputs: UpcomingTabViewModelOutputs { get }
}

class UpcomingTabViewModel: UpcomingTabViewModelType, UpcomingTabViewModelInputs, UpcomingTabViewModelOutputs, UpcomingTabViewModelCoordinates {
  
  // MARK: Property
  
  let disposeBag = DisposeBag()
  
  // MARK: Init
    
  public init() {
    inputs.rightBarButtonTrigger
      .bind(to: coordinates.navigateToTabDetail)
      .disposed(by: disposeBag)
  }
  
  // MARK: Private
  
  // MARK: Input
  
  var rightBarButtonTrigger = PublishSubject<Movie>()
    
  // MARK: Output
  
  // MARK: Coordinate
  
  var navigateToTabDetail = PublishSubject<Movie>()
    
  // MARK: Input&Output&Coordinate
    
  public var outputs: UpcomingTabViewModelOutputs { return self }
  public var inputs: UpcomingTabViewModelInputs { return self }
  internal var coordinates: UpcomingTabViewModelCoordinates { return self }
  
}
