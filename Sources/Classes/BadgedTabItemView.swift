//
//  BadgedTabItemView.swift
//  EMRVisit
//
//  Created by Don Holly on 7/17/19.
//  Copyright © 2019 Don Holly. All rights reserved.
//

import Foundation
import UIKit

import SwipeMenuViewController

private class BadgeView: UIView {
    
    var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .clear
        label.textAlignment = .center
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 10)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(label)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height/2
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 2.0),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.0),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 4.0),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4.0),
            ])
    }
}

open class BadgedTabItemView: TabItemView {
    
    private var badgeView: BadgeView = {
        let view = BadgeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    open var badgeText: String? {
        get {
            return badgeView.label.text
        }
        set {
            badgeView.label.text = newValue
            badgeView.isHidden = newValue == nil || newValue?.isEmpty == true
        }
    }
    
    open var badgeColor: UIColor? {
        get {
            return badgeView.backgroundColor
        }
        set {
            badgeView.backgroundColor = newValue
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(badgeView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            badgeView.topAnchor.constraint(equalTo: topAnchor, constant: 0.0),
            badgeView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0.0),
            badgeView.widthAnchor.constraint(greaterThanOrEqualTo: badgeView.heightAnchor, multiplier: 1.0, constant: 0.0)
            ])
    }
}
