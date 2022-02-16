//
//  CollectionViewCell.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

final class CalendarViewCell: UICollectionViewCell {
    
    private lazy var scheduleView = ScheduleView()
    
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
        if day == "" {
            isUserInteractionEnabled = false
        }
        dayOfMonth.text = day
    }
    
    func configureScheduleView(data: String) {
        scheduleView.scheduleLabel.text = data
        addSubview(scheduleView)
        scheduleView.translatesAutoresizingMaskIntoConstraints = false
        scheduleView.topAnchor.constraint(equalTo: dayOfMonth.bottomAnchor).isActive = true
        scheduleView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        scheduleView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
