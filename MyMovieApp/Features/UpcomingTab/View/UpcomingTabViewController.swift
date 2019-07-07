//
//  LeftTabViewController.swift
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Kingfisher

class UpcomingTabViewController: UIViewController {
  
  // MARK: IBOutlet
  
  // MARK: Property 
  
  var viewModel: UpcomingTabViewModelType!
  let disposeBag = DisposeBag()
  
  lazy var reusableView : UICollectionView = {
    let flowLayout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
    view.backgroundColor = .clear
    return view
  }()
  
  
  let movies : BehaviorRelay<[Movie]> = BehaviorRelay(value: [])
  
  
  // MARK: View Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
    bindViewModel()
  }
  
  func setup() {
    view.backgroundColor = .white
    self.title = "Upcoming"
    
    view.addSubview(reusableView)
    reusableView.boundInside(superView: view, inset: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8))
    
  }
  
  func bindViewModel() {
    
    
    reusableView.delegate = self
    reusableView.register(UINib(nibName: "\(GridViewCell.self)", bundle: nil), forCellWithReuseIdentifier: GridViewCell.indentifier)
    
    movies.asObservable().bind(to: reusableView.rx.items(cellIdentifier: "cell\(GridViewCell.self)", cellType: GridViewCell.self)){(row, movie, cell) in
      
      if let photoUrl = URL(string: Urls.URL_IMAGE_BASE + movie.poster_path){
        cell.imageViewTop.kf.indicatorType = .activity
        cell.imageViewTop.kf.setImage(with: photoUrl, placeholder: nil, options: [.transition(ImageTransition.fade(1))])
      }
      
      cell.labelTitle.text = movie.title
      cell.labelState.text = movie.release_date
      
      cell.addDefaultDropShadow()
      
      }.disposed(by: disposeBag)
    
    reusableView
      .rx
      .modelSelected(Movie.self)
      .bind(to: self.viewModel.inputs.rightBarButtonTrigger).disposed(by: disposeBag)
    
    
    //TODO:- Api management will be refactored
    APIManager.shared.getDiscoverMovies(url: Urls.URL_UPCOMING) {[weak self] (pageWithMovie) in
      guard let `self` = self, let moviesData = pageWithMovie?.results else { return }
      
      self.movies.accept(moviesData)
      
    }
    
  }
  
}



