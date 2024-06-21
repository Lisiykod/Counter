//
//  ViewController.swift
//  Counter
//
//  Created by Olga Trofimova on 20.06.2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var countLabel: UILabel!
    
    @IBOutlet private weak var incrementButton: UIButton!
    
    @IBOutlet private weak var decrementButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var counterLog: UITextView!
    
    // счетчик, который будем увеличивать
    private var count: Int = 0 {
        didSet {
            updateCountLabel()
        }
    }
    
    // текущая дата и время
    private let dateFormatter = DateFormatter.localizedString(from: .now, dateStyle: .short, timeStyle: .short)
    
    private let cornerRadiusButton: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    @IBAction private func increment(_ sender: Any) {
        count += 1
        counterLog.text.append("\(dateFormatter): значение изменено на +1. \n")
    }
    
    @IBAction private func decrement(_ sender: Any) {
        if count <= 0 {
            count = 0
            counterLog.text.append("\(dateFormatter): попытка уменьшить значение счётчика ниже 0. \n")
        } else {
            count -= 1
            counterLog.text.append("\(dateFormatter): значение изменено на -1. \n")
        }
    }
    
    @IBAction private func reset(_ sender: Any) {
        count = 0
        counterLog.text.append("\(dateFormatter): значение сброшено. \n")
    }
    
    // настраиваем первоначальный вид вью
    private func setupView() {
        countLabel.text = "Значение счетчика: \(count)"
        counterLog.text = "История изменений: \n"
        counterLog.isEditable = false
        counterLog.backgroundColor = .systemGray6
        incrementButton.layer.cornerRadius = cornerRadiusButton
        decrementButton.layer.cornerRadius = cornerRadiusButton
        resetButton.layer.cornerRadius = cornerRadiusButton
    }

    // функция для обновления лейбла счетчика
    private func updateCountLabel() {
        countLabel.text = "Значение счетчика: \(count)"
    }
}

