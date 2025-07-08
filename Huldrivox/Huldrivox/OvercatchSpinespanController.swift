import UIKit
import QuartzCore
import AudioToolbox

class OvercatchSpinespanController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Overcatch Spinespan Reproject Pushlock Switcher Calculator"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let inputCard1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputField1: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Spinespan Length"
        field.textColor = .white
        field.font = UIFont.systemFont(ofSize: 16)
        field.attributedPlaceholder = NSAttributedString(
            string: "Enter Spinespan Length",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let inputCard2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputField2: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Reproject Angle"
        field.textColor = .white
        field.font = UIFont.systemFont(ofSize: 16)
        field.attributedPlaceholder = NSAttributedString(
            string: "Enter Reproject Angle",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let inputCard3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputField3: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Pushlock Force"
        field.textColor = .white
        field.font = UIFont.systemFont(ofSize: 16)
        field.attributedPlaceholder = NSAttributedString(
            string: "Enter Pushlock Force",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        field.keyboardType = .decimalPad
        return field
    }()
    
    private let segmentCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let segmentControl: UISegmentedControl = {
        let segment = UISegmentedControl(items: ["Normal", "Enhanced", "Turbo"])
        segment.selectedSegmentTintColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        segment.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        segment.selectedSegmentIndex = 0
        return segment
    }()
    
    private let switchCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Enable Overcatch Mode"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private let boostSwitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1)
        return sw
    }()
    
    private let menuCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private let menuButton: UIButton = {
        let button = UIButton()
        button.setTitle("Select Switcher Mode ▼", for: .normal)
        button.setTitleColor(UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    private var menuSelection = "Standard"
    
    private let resultCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.25, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        view.alpha = 0
        return view
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Result will appear here"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.numberOfLines = 0
        return label
    }()
    
    private let chartView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.15, green: 0.2, blue: 0.15, alpha: 1)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        view.alpha = 0
        return view
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.layer.cornerRadius = 25
        button.layer.shadowColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.5).cgColor
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 0.5
        return button
    }()
    
    private let buttonStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 10
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton()
        button.setTitle("Share", for: .normal)
        button.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 0.2, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton()
        button.setTitle("Reset", for: .normal)
        button.backgroundColor = UIColor(red: 0.5, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private let copyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Copy", for: .normal)
        button.backgroundColor = UIColor(red: 0.2, green: 0.3, blue: 0.5, alpha: 1)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.layer.cornerRadius = 8
        return button
    }()
    
    private var rippleLayer: CAShapeLayer?
    private var chartLayers: [CAShapeLayer] = []
    private var resultValue: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupKeyboardToolbar()
        setupMenu()
        setupRippleAnimation()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.contentSize = contentView.frame.size
        rippleLayer?.frame = view.bounds
    }
    
    private func setupUI() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [
            UIColor(red: 0.1, green: 0.15, blue: 0.1, alpha: 1).cgColor,
            UIColor(red: 0.15, green: 0.2, blue: 0.15, alpha: 1).cgColor,
            UIColor(red: 0.05, green: 0.1, blue: 0.05, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        let padding: CGFloat = 20
        let cardHeight: CGFloat = 50
        let spacing: CGFloat = 15
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
        
        contentView.addSubview(inputCard1)
        inputCard1.translatesAutoresizingMaskIntoConstraints = false
        inputCard1.addSubview(inputField1)
        inputField1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputCard1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            inputCard1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            inputCard1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            inputCard1.heightAnchor.constraint(equalToConstant: cardHeight),
            
            inputField1.centerYAnchor.constraint(equalTo: inputCard1.centerYAnchor),
            inputField1.leadingAnchor.constraint(equalTo: inputCard1.leadingAnchor, constant: 15),
            inputField1.trailingAnchor.constraint(equalTo: inputCard1.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(inputCard2)
        inputCard2.translatesAutoresizingMaskIntoConstraints = false
        inputCard2.addSubview(inputField2)
        inputField2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputCard2.topAnchor.constraint(equalTo: inputCard1.bottomAnchor, constant: spacing),
            inputCard2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            inputCard2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            inputCard2.heightAnchor.constraint(equalToConstant: cardHeight),
            
            inputField2.centerYAnchor.constraint(equalTo: inputCard2.centerYAnchor),
            inputField2.leadingAnchor.constraint(equalTo: inputCard2.leadingAnchor, constant: 15),
            inputField2.trailingAnchor.constraint(equalTo: inputCard2.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(inputCard3)
        inputCard3.translatesAutoresizingMaskIntoConstraints = false
        inputCard3.addSubview(inputField3)
        inputField3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            inputCard3.topAnchor.constraint(equalTo: inputCard2.bottomAnchor, constant: spacing),
            inputCard3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            inputCard3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            inputCard3.heightAnchor.constraint(equalToConstant: cardHeight),
            
            inputField3.centerYAnchor.constraint(equalTo: inputCard3.centerYAnchor),
            inputField3.leadingAnchor.constraint(equalTo: inputCard3.leadingAnchor, constant: 15),
            inputField3.trailingAnchor.constraint(equalTo: inputCard3.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(segmentCard)
        segmentCard.translatesAutoresizingMaskIntoConstraints = false
        segmentCard.addSubview(segmentControl)
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentCard.topAnchor.constraint(equalTo: inputCard3.bottomAnchor, constant: spacing),
            segmentCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            segmentCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            segmentCard.heightAnchor.constraint(equalToConstant: cardHeight),
            
            segmentControl.centerYAnchor.constraint(equalTo: segmentCard.centerYAnchor),
            segmentControl.leadingAnchor.constraint(equalTo: segmentCard.leadingAnchor, constant: 15),
            segmentControl.trailingAnchor.constraint(equalTo: segmentCard.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(switchCard)
        switchCard.translatesAutoresizingMaskIntoConstraints = false
        switchCard.addSubview(switchLabel)
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchCard.addSubview(boostSwitch)
        boostSwitch.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            switchCard.topAnchor.constraint(equalTo: segmentCard.bottomAnchor, constant: spacing),
            switchCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            switchCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            switchCard.heightAnchor.constraint(equalToConstant: cardHeight),
            
            switchLabel.centerYAnchor.constraint(equalTo: switchCard.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: switchCard.leadingAnchor, constant: 15),
            
            boostSwitch.centerYAnchor.constraint(equalTo: switchCard.centerYAnchor),
            boostSwitch.trailingAnchor.constraint(equalTo: switchCard.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(menuCard)
        menuCard.translatesAutoresizingMaskIntoConstraints = false
        menuCard.addSubview(menuButton)
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            menuCard.topAnchor.constraint(equalTo: switchCard.bottomAnchor, constant: spacing),
            menuCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            menuCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            menuCard.heightAnchor.constraint(equalToConstant: cardHeight),
            
            menuButton.centerYAnchor.constraint(equalTo: menuCard.centerYAnchor),
            menuButton.leadingAnchor.constraint(equalTo: menuCard.leadingAnchor, constant: 15),
            menuButton.trailingAnchor.constraint(equalTo: menuCard.trailingAnchor, constant: -15)
        ])
        
        contentView.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            calculateButton.topAnchor.constraint(equalTo: menuCard.bottomAnchor, constant: 30),
            calculateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            calculateButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            calculateButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        contentView.addSubview(resultCard)
        resultCard.translatesAutoresizingMaskIntoConstraints = false
        resultCard.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            resultCard.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 30),
            resultCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            resultCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            
            resultLabel.topAnchor.constraint(equalTo: resultCard.topAnchor, constant: 15),
            resultLabel.leadingAnchor.constraint(equalTo: resultCard.leadingAnchor, constant: 15),
            resultLabel.trailingAnchor.constraint(equalTo: resultCard.trailingAnchor, constant: -15),
            resultLabel.bottomAnchor.constraint(equalTo: resultCard.bottomAnchor, constant: -15)
        ])
        
        contentView.addSubview(chartView)
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: resultCard.bottomAnchor, constant: 20),
            chartView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            chartView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            chartView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        contentView.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        buttonStack.addArrangedSubview(shareButton)
        buttonStack.addArrangedSubview(resetButton)
        buttonStack.addArrangedSubview(copyButton)
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: chartView.bottomAnchor, constant: 20),
            buttonStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            buttonStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            buttonStack.heightAnchor.constraint(equalToConstant: 40),
            buttonStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    private func setupActions() {
        calculateButton.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        copyButton.addTarget(self, action: #selector(copyTapped), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setupKeyboardToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        toolbar.items = [flexSpace, doneButton]
        
        inputField1.inputAccessoryView = toolbar
        inputField2.inputAccessoryView = toolbar
        inputField3.inputAccessoryView = toolbar
    }
    
    private func setupMenu() {
        let standard = UIAction(title: "Standard Mode", image: UIImage(systemName: "square.grid.2x2")) { _ in
            self.menuSelection = "Standard"
            self.menuButton.setTitle("Standard Mode ▼", for: .normal)
        }
        
        let advanced = UIAction(title: "Advanced Mode", image: UIImage(systemName: "square.grid.2x2.fill")) { _ in
            self.menuSelection = "Advanced"
            self.menuButton.setTitle("Advanced Mode ▼", for: .normal)
        }
        
        let expert = UIAction(title: "Expert Mode", image: UIImage(systemName: "square.grid.3x2.fill")) { _ in
            self.menuSelection = "Expert"
            self.menuButton.setTitle("Expert Mode ▼", for: .normal)
        }
        
        let menu = UIMenu(title: "Select Switcher Mode", children: [standard, advanced, expert])
        menuButton.menu = menu
        menuButton.showsMenuAsPrimaryAction = true
    }
    
    private func setupRippleAnimation() {
        rippleLayer = CAShapeLayer()
        guard let rippleLayer = rippleLayer else { return }
        rippleLayer.frame = view.bounds
        rippleLayer.fillColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.1).cgColor
        view.layer.insertSublayer(rippleLayer, at: 0)
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 4
        animationGroup.repeatCount = .infinity
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = UIBezierPath(ovalIn: CGRect(x: view.bounds.width/2 - 10, y: view.bounds.height/2 - 10, width: 20, height: 20)).cgPath
        pathAnimation.toValue = UIBezierPath(ovalIn: CGRect(x: -view.bounds.width, y: -view.bounds.height, width: view.bounds.width * 3, height: view.bounds.height * 3)).cgPath
        
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 0.8
        opacityAnimation.toValue = 0
        
        animationGroup.animations = [pathAnimation, opacityAnimation]
        rippleLayer.add(animationGroup, forKey: "rippleAnimation")
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func calculateTapped() {
        guard let text1 = inputField1.text, !text1.isEmpty,
              let text2 = inputField2.text, !text2.isEmpty,
              let text3 = inputField3.text, !text3.isEmpty,
              let value1 = Double(text1),
              let value2 = Double(text2),
              let value3 = Double(text3) else {
            showAlert(title: "Error", message: "Please fill all fields with valid numbers")
            return
        }
        
        var result = 0.0
        let boostFactor = boostSwitch.isOn ? 1.5 : 1.0
        
        switch segmentControl.selectedSegmentIndex {
        case 0:
            result = (value1 * value2) / value3 * boostFactor
        case 1:
            result = (value1 + value2) * value3 * boostFactor
        case 2:
            result = pow(value1, value2) + value3 * boostFactor
        default:
            break
        }
        
        if menuSelection == "Advanced" {
            result *= 1.3
        } else if menuSelection == "Expert" {
            result *= 1.7
        }
        
        resultValue = result
        let formattedResult = String(format: "%.4f", result)
        
        resultLabel.text = """
        Overcatch Spinespan Reproject Pushlock Switcher Result:
        
        Length: \(value1)
        Angle: \(value2)
        Force: \(value3)
        Mode: \(menuSelection)
        Power: \(segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? "")
        Overcatch: \(boostSwitch.isOn ? "Enabled" : "Disabled")
        
        Final Switcher Value: \(formattedResult)
        """
        
        UIView.animate(withDuration: 0.5) {
            self.resultCard.alpha = 1
            self.chartView.alpha = 1
        }
        
        drawBubbleChart(result: result)
        playSound()
    }
    
    private func drawBubbleChart(result: Double) {
        chartLayers.forEach { $0.removeFromSuperlayer() }
        chartLayers.removeAll()
        
        let center = CGPoint(x: chartView.bounds.width / 2, y: chartView.bounds.height / 2)
        let maxSize = min(chartView.bounds.width, chartView.bounds.height) * 0.8
        let normalizedResult = min(result / 100, 1.0)
        let bubbleSize = maxSize * CGFloat(normalizedResult)
        
        let mainBubble = CAShapeLayer()
        mainBubble.path = UIBezierPath(ovalIn: CGRect(
            x: center.x - bubbleSize/2,
            y: center.y - bubbleSize/2,
            width: bubbleSize,
            height: bubbleSize
        )).cgPath
        mainBubble.fillColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.4).cgColor
        mainBubble.strokeColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 1).cgColor
        mainBubble.lineWidth = 2
        
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1.5
        pulseAnimation.fromValue = 0.95
        pulseAnimation.toValue = 1.05
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        mainBubble.add(pulseAnimation, forKey: "pulse")
        
        let appearAnimation = CABasicAnimation(keyPath: "path")
        appearAnimation.fromValue = UIBezierPath(ovalIn: CGRect(x: center.x, y: center.y, width: 0, height: 0)).cgPath
        appearAnimation.toValue = mainBubble.path
        appearAnimation.duration = 0.8
        appearAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        mainBubble.add(appearAnimation, forKey: "appear")
        
        chartView.layer.addSublayer(mainBubble)
        chartLayers.append(mainBubble)
        
        let smallBubbleCount = 8
        let smallBubbleSize = bubbleSize * 0.3
        
        for i in 0..<smallBubbleCount {
            let angle = CGFloat.pi * 2 / CGFloat(smallBubbleCount) * CGFloat(i)
            let distance = bubbleSize * 0.6
            let x = center.x + cos(angle) * distance - smallBubbleSize/2
            let y = center.y + sin(angle) * distance - smallBubbleSize/2
            
            let smallBubble = CAShapeLayer()
            smallBubble.path = UIBezierPath(ovalIn: CGRect(
                x: x,
                y: y,
                width: smallBubbleSize,
                height: smallBubbleSize
            )).cgPath
            smallBubble.fillColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.3).cgColor
            smallBubble.strokeColor = UIColor(red: 0.2, green: 0.8, blue: 0.4, alpha: 0.7).cgColor
            smallBubble.lineWidth = 1
            
            let orbitAnimation = CAKeyframeAnimation(keyPath: "position")
            orbitAnimation.path = UIBezierPath(ovalIn: CGRect(
                x: center.x - distance,
                y: center.y - distance,
                width: distance * 2,
                height: distance * 2
            )).cgPath
            orbitAnimation.duration = Double.random(in: 8...12)
            orbitAnimation.repeatCount = .infinity
            orbitAnimation.calculationMode = .paced
            
            let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.fromValue = 0.8
            scaleAnimation.toValue = 1.2
            scaleAnimation.duration = Double.random(in: 1.5...3)
            scaleAnimation.autoreverses = true
            scaleAnimation.repeatCount = .infinity
            
            smallBubble.add(orbitAnimation, forKey: "orbit")
            smallBubble.add(scaleAnimation, forKey: "scale")
            
            chartView.layer.addSublayer(smallBubble)
            chartLayers.append(smallBubble)
        }
    }
    
    private func playSound() {
        let systemSoundID: SystemSoundID = 1105
        AudioServicesPlaySystemSound(systemSoundID)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    @objc private func shareTapped() {
        guard resultCard.alpha == 1 else {
            showAlert(title: "Error", message: "Please calculate a result first")
            return
        }
        
        let activityVC = UIActivityViewController(activityItems: [resultLabel.text ?? ""], applicationActivities: nil)
        present(activityVC, animated: true)
    }
    
    @objc private func resetTapped() {
        inputField1.text = ""
        inputField2.text = ""
        inputField3.text = ""
        segmentControl.selectedSegmentIndex = 0
        boostSwitch.isOn = false
        menuSelection = "Standard"
        menuButton.setTitle("Select Switcher Mode ▼", for: .normal)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.resultCard.alpha = 0
            self.chartView.alpha = 0
        }) { _ in
            self.resultLabel.text = "Result will appear here"
            self.chartLayers.forEach { $0.removeFromSuperlayer() }
            self.chartLayers.removeAll()
        }
    }
    
    @objc private func copyTapped() {
        guard resultCard.alpha == 1 else {
            showAlert(title: "Error", message: "Please calculate a result first")
            return
        }
        
        UIPasteboard.general.string = resultLabel.text
        showAlert(title: "Copied", message: "Result copied to clipboard")
    }
}
