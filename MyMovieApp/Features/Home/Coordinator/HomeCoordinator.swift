//
//  HomeCoordinator.swift
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxSwift

class HomeCoordinator: BaseCoordinator<Void> {
  
  
  var upcomingTabBarCoordinator: UpcomingTabCoordinator!
  var nowPlayingTabBarCoordinator: NowPlayingTabCoordinator!
  
  override func start() -> Observable<Void> {
    let homeViewModel = HomeViewModel()
    let homeViewController = HomeViewController()
    homeViewController.viewModel = homeViewModel
    
    // Setup FirstNavigation
    let upcomingNav = UINavigationController()
    upcomingNav.tabBarItem = UITabBarItem(title: "Upcoming", image: nil, selectedImage: nil)
    
    // Setup SecondNavigation
    let nowPlayingNav = UINavigationController()
    nowPlayingNav.tabBarItem = UITabBarItem(title: "NowPlaying", image: nil, selectedImage: nil)
    
    // Setup TabBarViewController
    homeViewController.viewControllers = [upcomingNav, nowPlayingNav]
    
    transition(to: homeViewController)
    
    upcomingTabBarCoordinator = UpcomingTabCoordinator(window: window, baseViewController: upcomingNav, transitionType: .rootNavigation)
    coordinate(to: upcomingTabBarCoordinator)
      .subscribe()
      .disposed(by: disposeBag)
    
    nowPlayingTabBarCoordinator = NowPlayingTabCoordinator(window: window, baseViewController: nowPlayingNav, transitionType: .rootNavigation)
    coordinate(to: nowPlayingTabBarCoordinator)
      .subscribe()
      .disposed(by: disposeBag)
    
    homeViewModel
      .coordinates
      .navigateTabIndex
      .subscribe(onNext: { index in
        switch index {
        case 0:
          print("0")
        case 1:
          print("1")
        default:
          break
        }
      }).disposed(by: disposeBag)
    
    return .never()
  }
  
  
}
