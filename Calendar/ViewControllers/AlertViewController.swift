//
//  AlertViewController.swift
//  Calendar
//
//  Created by Jae Kyeong Ko on 2022/02/16.
//

import UIKit

class AlertViewController: UIViewController {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.alpha = 1
        view.backgroundColor = .white
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        return label
    }()
    
    lazy var confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Confirm", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(didTappedConfirmButton(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var scheduleTextField: UITextField = {
        let textField = UITextField()
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        textField.font = .systemFont(ofSize: 20)
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        view.backgroundColor = UIColor(white: 0.4, alpha: 0.5)
        addViews()
        addConstraintsOnViews()
    }
    
    private func addViews() {
        view.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(confirmButton)
        contentView.addSubview(scheduleTextField)
    }
    
    private func addConstraintsOnViews() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        contentView.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5).isActive = true
        contentView.heightAnchor.constraint(equalToConstant: view.frame.height / 3).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        scheduleTextField.translatesAutoresizingMaskIntoConstraints = false
        scheduleTextField.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        scheduleTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        scheduleTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        scheduleTextField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        confirmButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        confirmButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
    }
    
    @objc func didTappedConfirmButton(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}
