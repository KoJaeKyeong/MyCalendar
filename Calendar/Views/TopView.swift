//
//  TopView.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

final class TopView: UIView {
    private lazy var previousButton: UIButton = {
        let button = UIButton()
        button.setTitle("<", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(">", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        configureViews()
        updateDateLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addViews()
        addConstraintsOnViews()
    }
    
    private func addViews() {
        addSubview(previousButton)
        addSubview(nextButton)
        addSubview(dateLabel)
    }
    
    private func addConstraintsOnViews() {
        previousButton.translatesAutoresizingMaskIntoConstraints = false
        previousButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        previousButton.trailingAnchor.constraint(equalTo: dateLabel.leadingAnchor).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextButton.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dateLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func updateDateLabel() {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month], from: Date())
        let calendarDate = calendar.date(from: dateComponents) ?? Date()
        let dateFormatter: DateFormatter = {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy.MM"
            dateFormatter.timeZone = TimeZone.current
            dateFormatter.locale = Locale.current
            return dateFormatter
        }()
        
        dateLabel.text = dateFormatter.string(from: calendarDate)
    }
    
    @objc func didTappedPreviousButton(sender: UIButton) {
        // 이전 버튼 터치 이벤트 처리
    }
    
    @objc func didTappedNextButton(sender: UIButton) {
        // 다음 버튼 터치 이벤트 처리
    }
}
