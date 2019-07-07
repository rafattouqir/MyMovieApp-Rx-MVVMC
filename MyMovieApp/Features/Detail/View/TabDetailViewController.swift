//
//  TabDetailViewController.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class TabDetailViewController: UIViewController {
  
  // MARK: IBOutlet
  
  // MARK: Property
  
  var viewModel: TabDetailViewModelType!
  let disposeBag = DisposeBag()
  var leftBarButtonItem: UIBarButtonItem!
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  func setup() {
    view.backgroundColor = .white
    leftBarButtonItem = UIBarButtonItem(title: "<Back", style: .done, target: self, action: nil/*#selector()*/)
    self.navigationItem.leftBarButtonItem = leftBarButtonItem
  }
  
  
  func bindViewModel() {
    leftBarButtonItem
      .rx
      .tap
      .bind(to: viewModel.inputs.navigateBackTrigger)
      .disposed(by: disposeBag)
    
  }
  
  
}
