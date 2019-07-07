//
//  UpcomingTabViewController.swift
//  MyMovieApp
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit


extension UpcomingTabViewController: UICollectionViewDelegateFlowLayout {
  fileprivate var sectionInsets: UIEdgeInsets { return .zero }
  
  fileprivate var itemsPerRow: CGFloat { return 2 }
  
  fileprivate var interitemSpace: CGFloat { return 8 }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let sectionPadding = sectionInsets.left * (itemsPerRow + 1) // sectionInsets.left = sectionsInsets.right
    let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
    let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
    let widthPerItem = availableWidth / itemsPerRow
    let heightPerItem = widthPerItem * 11/9
    return CGSize(width: widthPerItem, height: heightPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return interitemSpace
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return interitemSpace
  }
}
