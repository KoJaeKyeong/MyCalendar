//
//  ViewController.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/15.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var contentView = UIView()
    private lazy var topView = TopView()
    private lazy var calendarView = CalendarView()
    private lazy var dayStackView = DayStackView()
    private lazy var alertViewController = AlertViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        addViews()
        addConstraintsOnViews()
        configureDelegates()
    }
    
    private func addViews() {
        view.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(dayStackView)
        contentView.addSubview(calendarView)
    }
    
    private func addConstraintsOnViews() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        dayStackView.translatesAutoresizingMaskIntoConstraints = false
        dayStackView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true
        dayStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        dayStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        dayStackView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.topAnchor.constraint(equalTo: dayStackView.bottomAnchor).isActive = true
        calendarView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        calendarView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        calendarView.heightAnchor.constraint(equalToConstant: view.frame.width * 1.3).isActive = true
    }
    
    private func configureDelegates() {
        calendarView.delegate = self
        calendarView.dataSource = self
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout 구현
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarView.daysOfMonth.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "calendarCell", for: indexPath) as? CalendarViewCell else {
            return UICollectionViewCell()
        }

        cell.updateLabel(day: calendarView.daysOfMonth[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 7
        return CGSize(width: width, height: width * 1.3)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let calendar = Calendar.current
        let dateComponents = calendar.dateComponents([.weekday, .month, .day], from: Date())
        let month = [1: "Jan",2: "Feb", 3: "Mar", 4: "Apr", 5: "May", 6: "Jun", 7: "Jul", 8: "Aug", 9: "Sep", 10: "Oct", 11: "Nov", 12: "Dec"]
        let daysOfWeek = [0: "Sun", 1: "Mon", 2: "Tue", 3: "Wed", 4: "Thu", 5: "Fri", 6: "Sat"]
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.titleLabel.text = "\(daysOfWeek[indexPath.item % 7] ?? "") \(indexPath.item - 1), \(month[dateComponents.month ?? 1] ?? "")"
        alertViewController.indexPath = indexPath
        alertViewController.delegate = self
        self.present(alertViewController, animated: false, completion: nil)
    }
}

// MARK: - EditingDidEndDelegate 구현
extension ViewController: DidTappedConfirmButtonDelegate {
    func didTappedConfirmButtonDelegate(data: String, indexPath: IndexPath) {
        guard let cell = calendarView.calendarView.cellForItem(at: indexPath) as? CalendarViewCell else { return }
        cell.configureScheduleView(data: data)
    }
}
