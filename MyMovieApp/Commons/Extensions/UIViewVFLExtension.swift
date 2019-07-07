//
//  UIViewVFLExtension.swift
//  MyMovieApp
//
//  Created by RAFAT TOUQIR RAFSUN on 7/7/19.
//  Copyright © 2019 RAFAT TOUQIR RAFSUN. All rights reserved.
//

import UIKit

//MARK:- VFL Extensions
extension UIView {
  
  func addConstraintsWithFormat(format: String, views: UIView... , options: NSLayoutConstraint.FormatOptions = NSLayoutConstraint.FormatOptions()) {
    
    var viewsDictionary = [String: UIView]()
    for (index, view) in views.enumerated() {
      let key = "v\(index)"
      viewsDictionary[key] = view
      view.translatesAutoresizingMaskIntoConstraints = false
      
    }
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: options, metrics: nil, views: viewsDictionary))
  }
  
  
  func boundInside(superView: UIView,inset:UIEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)){
    
    self.translatesAutoresizingMaskIntoConstraints = false
    superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-\(inset.left)-[subview]-\(inset.right)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics:nil, views:["subview":self]))
    superView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(inset.top)-[subview]-\(inset.bottom)-|", options: NSLayoutConstraint.FormatOptions.directionLeadingToTrailing, metrics:nil, views:["subview":self]))
    
  }
  
}
