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
    var heart = 7{
        didSet{
            heartLabel.text = "❤️ \(heart)"
        }
    }
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
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
        answerTextField.placeholder = "Tap letters"
        answerTextField.font = UIFont.systemFont(ofSize: 21)
        answerTextField.isUserInteractionEnabled = false
        view.addSubview(answerTextField)
        
        
        
        //MARK::anchors
        NSLayoutConstraint.activate([
            heartLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            heartLabel.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            
            questionView.topAnchor.constraint(equalTo: heartLabel.bottomAnchor),
            questionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            questionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            questionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
                   
            questionLabel.centerYAnchor.constraint(equalTo: questionView.centerYAnchor),
            questionLabel.centerXAnchor.constraint(equalTo: questionView.centerXAnchor),
                   
            answerTextField.topAnchor.constraint(equalTo: questionView.bottomAnchor),
            answerTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
       
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // Do any additional setup after loading the view.
    }


}

