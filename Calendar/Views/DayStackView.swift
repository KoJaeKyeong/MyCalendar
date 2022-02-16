//
//  CollectionViewHeaderCollectionReusableView.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

final class DayStackView: UIStackView {
    
    let daysOfWeek = ["Sun", "Mon", "Tus", "Wen", "Thu", "Fri", "Sat"]

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        
        for index in 0..<daysOfWeek.count {
            lazy var dayLabel: UILabel = {
                let label = UILabel()
                label.text = "\(daysOfWeek[index])"
                label.textAlignment = .center
                
                if index == 0 {
                    label.textColor = .systemRed
                } else if index == 6 {
                    label.textColor = .systemBlue
                }
                return label
            }()
            
            stackView.addArrangedSubview(dayLabel)
        }
        
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        configureViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addViews()
        addConstraintsOnViews()
    }
    
    private func addViews() {
        addSubview(stackView)
    }
    
    private func addConstraintsOnViews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
