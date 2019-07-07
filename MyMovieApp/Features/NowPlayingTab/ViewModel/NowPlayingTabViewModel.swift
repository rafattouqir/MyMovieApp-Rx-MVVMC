//
//  NowPlayingTabViewModel.swift
//  MyMovieApp
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import RxSwift
import RxCocoa

protocol NowPlayingTabViewModelInputs {
  var rightBarButtonTrigger: PublishSubject<Movie> { get }
}

protocol NowPlayingTabViewModelOutputs {
  
}

protocol NowPlayingTabViewModelCoordinates {
  var navigateToTabDetail: PublishSubject<Movie> { get }
}

protocol NowPlayingTabViewModelType {
  var inputs: NowPlayingTabViewModelInputs { get }
  var outputs: NowPlayingTabViewModelOutputs { get }
}

class NowPlayingTabViewModel: NowPlayingTabViewModelType, NowPlayingTabViewModelInputs, NowPlayingTabViewModelOutputs, NowPlayingTabViewModelCoordinates {
  
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
  
  public var outputs: NowPlayingTabViewModelOutputs { return self }
  public var inputs: NowPlayingTabViewModelInputs { return self }
  internal var coordinates: NowPlayingTabViewModelCoordinates { return self }
  
}
