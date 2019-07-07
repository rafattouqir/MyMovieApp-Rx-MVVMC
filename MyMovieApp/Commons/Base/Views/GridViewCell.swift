//
//  LandingPageCell.swift
//  Poll
//
//  Created by RAFAT TOUQIR RAFSUN on 3/28/17.
//  Copyright © 2017 GagaGugu. All rights reserved.
//

import UIKit

class GridViewCell: UICollectionViewCell {
  
  class var indentifier: String{
    return "cellGridViewCell"
  }
  
  //@IBOutlet weak var view: UIView!
  @IBOutlet weak var labelTitle: UILabel!
  
  @IBOutlet weak var imageViewTop: UIImageView!
  
  @IBOutlet weak var labelState: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  
  func addDefaultDropShadow() {
    
    guard let view = Optional(self) else { return }
    
    view.contentView.layer.cornerRadius = 2.0
    view.contentView.layer.borderWidth = 1.0
    view.contentView.layer.borderColor = UIColor.clear.cgColor
    view.contentView.layer.masksToBounds = true
    
    view.layer.shadowColor = #colorLiteral(red: 0.1176470588, green: 0.1529411765, blue: 0.2862745098, alpha: 1).cgColor
    view.layer.shadowOffset = CGSize(width: 0, height: 2.0)
    view.layer.shadowRadius = 2.0
    view.layer.shadowOpacity = 0.5
    view.layer.masksToBounds = false
    view.layer.shadowPath = UIBezierPath(roundedRect: view.bounds, cornerRadius: view.contentView.layer.cornerRadius).cgPath
    
  }
  
}
