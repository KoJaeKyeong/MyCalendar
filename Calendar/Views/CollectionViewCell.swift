//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {
    
    private lazy var dayOfMonth: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addViews()
        addConstraintsOnViews()
    }
    
    private func addViews() {
        addSubview(dayOfMonth)
    }
    
    private func addConstraintsOnViews() {
        dayOfMonth.translatesAutoresizingMaskIntoConstraints = false
        dayOfMonth.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        dayOfMonth.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    func updateLabel(day: String) {
        dayOfMonth.text = day
    }
}
