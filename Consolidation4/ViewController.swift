//
//  ViewController.swift
//  Consolidation4
//
//  Created by Roman on 3/7/20.
//  Copyright © 2020 Roman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var questionLabel:UILabel!
    var answerTextField:UITextField!
    var heartLabel:UILabel!
    var submitButton:UIButton!
    var lettersButtons = [UIButton]()
    
    var heart = 7{
        didSet{
            heartLabel.text = "❤️ \(heart)"
        }
    }
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .systemBackground
        
        //MARK::adding hearLable
        heartLabel = UILabel()
        heartLabel.text = "❤️\(heart)"
        heartLabel.textAlignment = .right
        heartLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(heartLabel)
       
        //MARK::adding quetionView
        let questionView = UIView()
        questionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(questionView)
        
        //MARK::adding questionLabel
        questionLabel = UILabel()
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.text = "What is you name?"
        questionLabel.textAlignment = .center
        questionLabel.font = UIFont.systemFont(ofSize: 21)
        view.addSubview(questionLabel)
        
        //MARK::adding answerTextField
        answerTextField = UITextField()
        answerTextField.translatesAutoresizingMaskIntoConstraints = false
        answerTextField.textAlignment = .center
        answerTextField.placeholder = "?????"
        answerTextField.font = UIFont.systemFont(ofSize: 21)
        answerTextField.isUserInteractionEnabled = false
        view.addSubview(answerTextField)
        
        //MARK::adding submitButton
        submitButton = UIButton(type: .system)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        submitButton.setTitle("ПЕРЕВІРИТИ", for: .normal)
        submitButton.titleLabel?.font = UIFont.systemFont(ofSize: 21)
        
        submitButton.backgroundColor = .systemGray
        submitButton.tintColor = .white
        view.addSubview(submitButton)
        
        //MARK::buutonsView
        let buttonsView = UIView()
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonsView)
        
        //MARK::anchors
        NSLayoutConstraint.activate([
            heartLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor,constant: 8),
            heartLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            questionView.topAnchor.constraint(equalTo: heartLabel.bottomAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            questionView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            questionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                   
            questionLabel.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
                   
            answerTextField.topAnchor.constraint(equalTo: questionView.bottomAnchor),
            answerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            submitButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -16),
            submitButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 44),
            submitButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            submitButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            
            buttonsView.bottomAnchor.constraint(equalTo: submitButton.topAnchor,constant: -16),
            buttonsView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor,constant: 8),
            buttonsView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4)
            
            
        ])
       let widthHeight = 88
        
        for i in 0..<4{
            for j in 0..<4{
                let button = UIButton(type: .system)
                button.setTitle("?", for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 21)
                button.tintColor = .black
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.lightGray.cgColor
                button.frame = CGRect(x: i*widthHeight, y: j*widthHeight, width: widthHeight, height: widthHeight)
                buttonsView.addSubview(button)
                
                lettersButtons.append(button)
            }
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }

    

}

