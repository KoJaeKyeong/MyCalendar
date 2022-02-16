//
//  CollectionView.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

final class CollectionView: UIView {
    
    var daysOfMonth = [String]()
    
    lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        return collectionView
    }()
    
    var delegate: UICollectionViewDelegate? {
        didSet {
            collectionView.delegate = delegate
        }
    }

    var dataSource: UICollectionViewDataSource? {
        didSet {
            collectionView.dataSource = dataSource
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        configureViews()
        updateDaysOfMonth()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureViews() {
        addViews()
        addConstraintsOnViews()
    }
    
    private func addViews() {
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "calendarCell")
        addSubview(collectionView)
    }
    
    private func addConstraintsOnViews() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    private func updateDaysOfMonth() {
        daysOfMonth.removeAll()
        
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.year, .month], from: Date())
        let calendarDate = calendar.date(from: dateComponents) ?? Date()
        let startDayOfMonth = calendar.component(.weekday, from: calendarDate) - 1
        let endDateOfMonth = calendar.range(of: .day, in: .month, for: Date())?.count ?? 0
        let totalDaysOfMonth = startDayOfMonth + endDateOfMonth
        
        for dayOfMonth in 0..<totalDaysOfMonth {
            if dayOfMonth < startDayOfMonth {
                daysOfMonth.append("")
            } else {
                daysOfMonth.append("\(dayOfMonth - startDayOfMonth + 1)")
            }
        }
        
        reloadData()
    }
    
    private func reloadData() {
        collectionView.reloadData()
    }
}
