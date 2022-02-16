//
//  ScheduleView.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/16.
//

import UIKit

class ScheduleView: UIView {
    
    lazy var scheduleLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .randomColor
        label.font = .systemFont(ofSize: 12)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
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
        addSubview(scheduleLabel)
    }
    
    private func addConstraintsOnViews() {
        scheduleLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduleLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scheduleLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        scheduleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    }
}
