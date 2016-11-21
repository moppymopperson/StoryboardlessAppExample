//
//  CodedView.swift
//  StoryboardlessViewAndController
//
//  Created by Erik Hornberger on 2016/11/21.
//  Copyright © 2016年 EExT. All rights reserved.
//

import UIKit

class CodedView: UIView {

    // MARK: Public Members
    // Other classes can and should interact with these
    var text:String? {
        didSet {
            label.text = text
        }
    }
    
    init() {
        super.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Private Members
    // No other classes can access anything below this
    // These are strictly for use within this context
    
    /// A label that will take up the top half of the view.
    private lazy var label = UILabel()
    
    /// A stack view that will show a bunch of colored rectangles in the bottom half of the view.
    /// If you use something other than image views, you need need to make sure they have the same size 
    /// either intrinsically or with constraints.
    private lazy var stackView:UIStackView = {
        
        // Note: The social media icons are courtesy of Vicki Wenderlich – you can purchase her art from Game Art Guppy.
        // Borrowed from Ray Wenderlich's tutorial here https://www.raywenderlich.com/125718/coding-auto-layout
        var icons = [UIImageView]()
        icons.append(UIImageView(image: UIImage(named: "icon_facebook")))
        icons.append(UIImageView(image: UIImage(named: "icon_pinterest")))
        icons.append(UIImageView(image: UIImage(named: "icon_twitter")))
        
        icons[0].backgroundColor = .red
        icons[1].backgroundColor = .purple
        icons[2].backgroundColor = .green
        
        icons.forEach{ $0.contentMode = .scaleAspectFit }
        
        let socialMediaView = UIStackView(arrangedSubviews: icons)
        socialMediaView.translatesAutoresizingMaskIntoConstraints = false
        socialMediaView.axis = .horizontal
        socialMediaView.distribution = .equalCentering
        return socialMediaView
    }()
    
    
    

    /// This is called when this view is added to another view. We perform view setup and adding of constraints here, because there is no point in doing it earlier.
    /// Note that the label and stack view are initialied lazily, which means they won't be created until this point either. That's good use of memory.
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        
        setupView()
        setupConstraints()
    }
    
    
    
    
    
    /// Here we add all the subviews to the view
    private func setupView() {
        backgroundColor           = .cyan
        
        label.backgroundColor     = .blue
        label.textColor           = .white
        label.textAlignment       = .center
        
        addSubview(label)
        addSubview(stackView)
    }
    
    
    
    
    /// And here we add all the constraints using the new NSLayoutAnchor class
    private func setupConstraints() {
        
        // 1. This must be set to false an any view that was programatically created to which layout constraints will be applied
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // 2. Constrain the label to the top half of the screen
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        // 3. Constrain the stack view to the bottom half
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        stackView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
    }
}
