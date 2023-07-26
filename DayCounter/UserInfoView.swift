//
//  UserInfoView.swift
//  DayCounter
//
//  Created by mac on 21.07.2023.
//

import UIKit

final class UserInfoView: UIView {
    
    //MARK: userLabel
    private let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Узнай, не прошел ли срок для возврата страховки. Введи дату заключения договора страхования/подписания заявления о присоединении к программе страхования*"
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont(name: "Avenir Next", size: 17)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: userTextField
     let userTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        textField.layer.cornerRadius = 10
        textField.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textField.font = UIFont(name: "Avenir Next", size: 48)
        textField.textAlignment = .center
        textField.attributedPlaceholder = NSAttributedString(string: "ДД.ММ.ГГ", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
        textField.keyboardType = .numberPad
        textField.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(userLabel)
        addSubview(userTextField)
    }
    
    //MARK: setupConstraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            userLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            
            userTextField.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 2),
            userTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            userTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            userTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

