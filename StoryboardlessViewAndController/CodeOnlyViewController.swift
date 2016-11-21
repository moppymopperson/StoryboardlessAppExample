//
//  CodeOnlyViewController.swift
//  StoryboardlessViewAndController
//
//  Created by Erik Hornberger on 2016/11/21.
//  Copyright © 2016年 EExT. All rights reserved.
//

import UIKit

class CodeOnlyViewController: UIViewController {

    // MARK: Public
    // Don't give direct public access to the label. Go through a public property.
    // This allows us to easily change the label to another class down the road.
    var text:String? {
        didSet {
            customView.text = text
        }
    }

    // MARK: Private
    private lazy var customView = CodedView()
    
    
    // MARK: Initialization
    
    /// This is a custom initializer that can be used to pass info into the ViewController.
    init(word:String) {
        super.init(nibName: nil, bundle: nil)
        customView.text = word // The didSet block for text does not begin working until after init, so we have to set this directly here
        setupViews()
        setupConstraints()
    }
    
    /// This is the initializer used when initializing from a storyboard.
    /// The compiler forces us to include it, but it is never used.
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    /// This is where we add all the subviews to the view hierarchy.
    private func setupViews() {
        view.backgroundColor = .brown
        customView.frame = CGRect(x: 30, y: 30, width: 200, height: 200)
        view.addSubview(customView)
    }
    
    /// And this is where we setup their relationship.
    private func setupConstraints() {
        //view.translatesAutoresizingMaskIntoConstraints = false
        customView.translatesAutoresizingMaskIntoConstraints = false
        
        customView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        customView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        customView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
    }
    
}
