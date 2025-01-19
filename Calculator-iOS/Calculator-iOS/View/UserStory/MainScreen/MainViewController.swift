//
//  MainViewController.swift
//  Calculator-iOS
//
//  Created by Serhii Liamtsev on 4/9/22.
//

import UIKit

final class MainViewController: UIViewController {

    private var presenter = MainViewPresenter(algorithmExecutor: PolishNotationAlgorithm())
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [leftStackView, rightStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .fill
        return stackView
    }()
    
    private lazy var leftStackView: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [leftEmbeddedStackView1, leftEmbeddedStackView2, leftEmbeddedStackView3,
                                                            leftEmbeddedStackView4, leftEmbeddedStackView5])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .vertical
        localStackView.distribution = .fillEqually
        localStackView.alignment = .fill
        return localStackView
    }()
    
    private lazy var rightStackView: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btnMultiply, btnMinus, btnPlus, btnEquals])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .vertical
        localStackView.distribution = .fill
        localStackView.alignment = .fill
        localStackView.spacing = 20
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 13, bottom: 10, right: 13)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    private lazy var leftEmbeddedStackView1: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btnAc, btnErase, btnDelete])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .horizontal
        localStackView.distribution = .fillEqually
        localStackView.alignment = .fill
        localStackView.spacing = 20
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    private lazy var leftEmbeddedStackView2: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btn7, btn8, btn9])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .horizontal
        localStackView.distribution = .fillEqually
        localStackView.alignment = .fill
        localStackView.spacing = 20
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    private lazy var leftEmbeddedStackView3: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btn4, btn5, btn6])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .horizontal
        localStackView.distribution = .fillEqually
        localStackView.alignment = .fill
        localStackView.spacing = 20
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    private lazy var leftEmbeddedStackView4: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btn1, btn2, btn3])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .horizontal
        localStackView.distribution = .fillEqually
        localStackView.alignment = .fill
        localStackView.spacing = 20
        
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    private lazy var leftEmbeddedStackView5: UIStackView = {
        let localStackView = UIStackView(arrangedSubviews: [btn0, btnDot])
        localStackView.translatesAutoresizingMaskIntoConstraints = false
        localStackView.axis = .horizontal
        localStackView.distribution = .fill
        localStackView.alignment = .fill
        localStackView.spacing = 20
        
        localStackView.layoutMargins = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        localStackView.isLayoutMarginsRelativeArrangement = true
        return localStackView
    }()
    
    lazy var outputLabel: UILabel = {
        let localInputLabel = UILabel()
        localInputLabel.translatesAutoresizingMaskIntoConstraints = false
        localInputLabel.textAlignment = .right
        localInputLabel.font = .systemFont(ofSize: 50, weight: .semibold)
        localInputLabel.textColor = .black
        localInputLabel.accessibilityIdentifier = AccessibilityIdentifiers.mainScreen(.outputLabel).value
        return localInputLabel
    }()
    
    lazy var inputLabel: UILabel = {
        let localInputLabel = UILabel()
        localInputLabel.translatesAutoresizingMaskIntoConstraints = false
        localInputLabel.textAlignment = .right
        localInputLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        localInputLabel.textColor = .gray
        localInputLabel.accessibilityIdentifier = AccessibilityIdentifiers.mainScreen(.inputLabel).value
        return localInputLabel
    }()
    
    private lazy var btn0 = BasicButton(titleTxt: "0", titleColor: .link, bgColor: .white, type: .zero,
                                        id: .mainScreen(.zeroButton))
    private lazy var btnDot = BasicButton(titleTxt: ".", titleColor: .link, bgColor: .white, type: .dot,
                                        id: .mainScreen(.dotButton))
    private lazy var btn1 = BasicButton(titleTxt: "1", titleColor: .link, bgColor: .white, type: .one,
                                        id: .mainScreen(.oneButton))
    private lazy var btn2 = BasicButton(titleTxt: "2", titleColor: .link, bgColor: .white, type: .two,
                                        id: .mainScreen(.twoButton))
    private lazy var btn3 = BasicButton(titleTxt: "3", titleColor: .link, bgColor: .white, type: .three,
                                        id: .mainScreen(.threeButton))
    private lazy var btn4 = BasicButton(titleTxt: "4", titleColor: .link, bgColor: .white, type: .four,
                                        id: .mainScreen(.fourButton))
    private lazy var btn5 = BasicButton(titleTxt: "5", titleColor: .link, bgColor: .white, type: .five,
                                        id: .mainScreen(.fiveButton))
    private lazy var btn6 = BasicButton(titleTxt: "6", titleColor: .link, bgColor: .white, type: .six,
                                        id: .mainScreen(.sixButton))
    private lazy var btn7 = BasicButton(titleTxt: "7", titleColor: .link, bgColor: .white, type: .seven,
                                        id: .mainScreen(.sevenButton))
    private lazy var btn8 = BasicButton(titleTxt: "8", titleColor: .link, bgColor: .white, type: .eight,
                                        id: .mainScreen(.eightButton))
    private lazy var btn9 = BasicButton(titleTxt: "9", titleColor: .link, bgColor: .white, type: .nine,
                                        id: .mainScreen(.nineButton))
    private lazy var btnAc = BasicButton(titleTxt: "Ac", titleColor: .gray, bgColor: .white, type: .allClear,
                                        id: .mainScreen(.allClearButton))
    private lazy var btnErase = BasicButton(imageButtonName: "erase-image", titleColor: .gray, bgColor: .white, type: .erase,
                                            id: .mainScreen(.eraseButton))
    private lazy var btnDelete = BasicButton(titleTxt: "/", titleColor: .link, bgColor: .systemCyan, type: .delete,
                                             id: .mainScreen(.divisionButton))
    private lazy var btnMultiply = BasicButton(titleTxt: "*", titleColor: .link, bgColor: .systemCyan, type: .multiply,
                                               id: .mainScreen(.multiplyButton))
    private lazy var btnMinus = BasicButton(titleTxt: "-", titleColor: .link, bgColor: .systemCyan, type: .minus,
                                            id: .mainScreen(.minusButton))
    private lazy var btnPlus = BasicButton(titleTxt: "+", titleColor: .link, bgColor: .systemCyan, type: .plus,
                                           id: .mainScreen(.plusButton))
    private lazy var btnEquals = BasicButton(titleTxt: "=", titleColor: .cyan, bgColor: .link, type: .equals,
                                             id: .mainScreen(.equalsButton))
    
    private lazy var buttonList: [BasicButton] = [
        btn0,
        btn1,
        btn2,
        btn3,
        btn4,
        btn5,
        btn6,
        btn7,
        btn8,
        btn9,
        btnDot,
        btnAc,
        btnErase,
        btnDelete,
        btnMultiply,
        btnPlus,
        btnMinus,
        btnEquals
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.setMainViewPresenterDelegate(mainViewPresenterDelegate: self)
        view.backgroundColor = .systemGray6
        addButtonDidTapActionForAllButtons()
        setUpUI()
        configureConstraints()
    }
    
    private func setUpUI() {
        view.addSubview(stackView)
        view.addSubview(outputLabel)
        view.addSubview(inputLabel)
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 34),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -34),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            stackView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5),
            
            leftStackView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.6),
            leftStackView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.5),
            
            btnDot.widthAnchor.constraint(equalTo: btn3.widthAnchor),
            btnMultiply.heightAnchor.constraint(equalTo: btnDelete.heightAnchor),
            btnMinus.heightAnchor.constraint(equalTo: btnDelete.heightAnchor),
            btnEquals.heightAnchor.constraint(equalTo: btnDot.heightAnchor, multiplier: 1.7),
            
            inputLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.2),
            inputLabel.widthAnchor.constraint(equalToConstant: view.frame.width * 0.9),
            
            outputLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
            outputLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height * 0.25)
        ])
    }
        
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        presenter.themeDidChanged(isDark: previousTraitCollection?.userInterfaceStyle == .dark)
    }
    
    private func addButtonDidTapActionForAllButtons() {
        buttonList.forEach {
            $0.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
        }
    }
    
    @objc
    private func buttonDidTap(sender: BasicButton) {
        presenter.buttonDidTap(with: sender.type)
    }
    
}

extension MainViewController: MainViewPresenterDelegate {
    
    func showInvalidInputAlert(withTitle title: String, withMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: { return })
    }
    
    func updateLabels(withInputText inputLabelText: String, withOutputText outputLabelText: String) {
        setInputLabelText(text: inputLabelText)
        outputLabel.text = outputLabelText
    }
    
    func getInputLabelText() -> String {
        guard let inputLabelText = inputLabel.text else { return "" }
        return inputLabelText
    }
    
    func getOutputLabelText() -> String {
        guard let outputLabelText = outputLabel.text else { return "" }
        return outputLabelText
    }
    
    func setInputLabelText(text: String) {
        inputLabel.text = text
        inputLabel.textColorChange(fullText: text, charArrayToChange: ["+", "-", "*", "/"])
    }
    
    func updateViewAccordingToTheme(isDark: Bool) {
        view.backgroundColor = isDark ? .systemGray6 : .black
        outputLabel.textColor = isDark ? .black : .white

        buttonList.forEach { btn in
            switch btn.type {
            case .allClear, .erase:
                btn.backgroundColor = isDark ? .white : .systemGray2
                btn.titleLabel?.font = isDark ? .systemFont(ofSize: 40, weight: .semibold) : .systemFont(ofSize: 30, weight: .light)
            case .delete, .multiply, .minus, .plus:
                btn.backgroundColor = isDark ? .link : .systemCyan
                btn.setTitleColor(isDark ? .cyan : .link, for: .normal)
            case .equals:
                btn.backgroundColor = isDark ? .link : .cyan
                btn.setTitleColor(isDark ? .cyan : .link, for: .normal)
            default:
                btn.backgroundColor = isDark ? .white : .darkGray
            }
        }
    }
}
