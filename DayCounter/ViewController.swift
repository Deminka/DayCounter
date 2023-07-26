//
//  ViewController.swift
//  DayCounter
//
//  Created by mac on 21.07.2023.
//

import Foundation
import UIKit

var countDay: Int = 0

final class ViewController: UIViewController{
    
    //MARK: titleLabel
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Day Counter"
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont(name: "Avenir Next Bold", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: logoImageView
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "photo")
        imageView.layer.cornerRadius = 20
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: infoLabel
    private  let infoLabel: UILabel = {
        let label = UILabel()
        label.text = "«Период охлаждения» установлен указанием Банка России от 21.08.2017 № 4500-У, 14 дней — это срок, в течение которого страхователь может отказаться от договора и вернуть страховую премию или ее часть."
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Avenir next", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let userInfoView = UserInfoView()
    let resultView = ResultView()
    
    //MARK: starLabel
    private let starLabel: UILabel = {
        let label = UILabel()
        label.text = "*В большинстве случаев она совпадает с датой оформления кредита, но не всегда. Внимательно читайте договор страхования."
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.font = UIFont(name: "Avenir next", size: 14)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: resultButton
    private lazy var resultButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Проверить", for: .normal)
        button.tintColor = . white
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Avenir Next", size: 20)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(resultButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        userInfoView.userTextField.delegate = self

    }
    
    //MARK: func resultButtonTapped
    @objc func resultButtonTapped() {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let userDate = dateFormatter.date(from: userInfoView.userTextField.text!)
        if let userDate = userDate {
            let curDate = currentDate.timeIntervalSince1970
            let usDate = userDate.timeIntervalSince1970
            let result = Int((curDate - usDate) / (24*3600))
            if result < 500 {
                resultView.isHidden = false
                resultView.resultLabel.text = "\(result)"
                if result <= 13 && result >= 0{
                    resultView.resultLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                    resultView.userLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                    resultView.titletLabel.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
                } else if result < 0{
                    alertWindow(message: "Введенная дата не корректная")
                } else {
                    resultView.userLabel.text = "Вы не можете вернуть страховку!"
                    resultView.resultLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    resultView.userLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                    resultView.titletLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
                }
            } else {
                alertWindow(message: "Прошло более 500 дней")
            }
        } else {
            alertWindow(message: "Введите корректную дату")
        }
    }
    
    //MARK: func alertWindow
    fileprivate func alertWindow(message: String) {
        let ac = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        ac.addAction(okAction)
        self.present(ac, animated: true)
        userInfoView.userTextField.text = ""
        resultView.isHidden = true
    }
    
    //MARK: setupViews
    private func setupViews() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        view.addSubview(titleLabel)
        view.addSubview(logoImageView)
        view.addSubview(infoLabel)
        view.addSubview(userInfoView)
        view.addSubview(starLabel)
        view.addSubview(resultButton)
        view.addSubview(resultView)
        resultView.isHidden = true
    }
}

//MARK: setConstraints
extension ViewController {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            logoImageView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.3),
            logoImageView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.3),
            
            infoLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: 5),
            infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        
            userInfoView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 20),
            userInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userInfoView.heightAnchor.constraint(equalToConstant: 220),
            
            starLabel.topAnchor.constraint(equalTo: userInfoView.bottomAnchor, constant: 2),
            starLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            starLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),

            resultButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            resultButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultButton.heightAnchor.constraint(equalToConstant: 60),
            
            resultView.topAnchor.constraint(equalTo: starLabel.bottomAnchor, constant: 5),
            resultView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            resultView.heightAnchor.constraint(equalToConstant: 170)
        
        ])
    }
    
    //MARK: func touchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: delay to load view with infolink
    fileprivate func delay(_ delay: Int, closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay)) {
            closure()
        }
    }
}

//MARK: texfield - checking for the number of characters
extension ViewController: UITextFieldDelegate  {
     func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textField = userInfoView.userTextField
        if textField == textField {
            if (textField.text?.count == 2) || (textField.text?.count == 5) {
                if !(string == "") {
                    textField.text = (textField.text)! + "."
                }
            }
            return !(textField.text!.count > 9 && (string.count ) > range.length)
        }
        else {
            return true
        }
        
    }
}
