//
//  ResultView.swift
//  DayCounter
//
//  Created by mac on 22.07.2023.
//

import UIKit

final class ResultView: UIView {
    
    //MARK: userLabel
    let userLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы можете вернуть страховку!"
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: resultLabel
     let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 60)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: titleLabel
     let titletLabel: UILabel = {
        let label = UILabel()
        label.text = "дней прошло с момента оформления страховки"
        label.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 17)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        layer.cornerRadius = 10
        
        setView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setView() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(userLabel)
        addSubview(resultLabel)
        addSubview(titletLabel)
    }
    
    //MARK: setupConstraints
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            userLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            userLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            userLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            resultLabel.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 5),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),

            titletLabel.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 0),
            titletLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            titletLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
        ])
    }
}
