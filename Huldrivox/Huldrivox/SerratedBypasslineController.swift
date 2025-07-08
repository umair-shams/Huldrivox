import UIKit

class SerratedBypasslineController: UIViewController {
    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.showsVerticalScrollIndicator = false
        return sv
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Serrated Bypassline Imprint Rephaser Tiltband Calculator"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let inputCard1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputCard2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputCard3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let controlCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let resultCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let graphCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.8)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputField1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Tiltband Frequency"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(
            string: "Enter Tiltband Frequency",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        return tf
    }()
    
    private let inputField2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Bypassline Amplitude"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(
            string: "Enter Bypassline Amplitude",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        return tf
    }()
    
    private let inputField3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Imprint Phase"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(
            string: "Enter Imprint Phase",
            attributes: [.foregroundColor: UIColor.lightGray]
        )
        return tf
    }()
    
    private let modeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1)
        sw.isOn = true
        return sw
    }()
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Advanced Rephaser Mode"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Standard", "Enhanced", "Quantum"])
        sc.selectedSegmentTintColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private var modeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Calculation Mode ▼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.3)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 0.5).cgColor
        return button
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Results will appear here"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("CALCULATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SHARE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RESET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let copyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("COPY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 0.8, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private var graphView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var isCalculated = false
    private var selectedMode = "Linear"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupActions()
        setupKeyboardToolbar()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.1, green: 0.15, blue: 0.2, alpha: 1)
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(inputCard1)
        contentView.addSubview(inputCard2)
        contentView.addSubview(inputCard3)
        contentView.addSubview(controlCard)
        contentView.addSubview(resultCard)
        contentView.addSubview(graphCard)
        contentView.addSubview(calculateButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(resetButton)
        contentView.addSubview(copyButton)
        
        inputCard1.addSubview(inputField1)
        inputCard2.addSubview(inputField2)
        inputCard3.addSubview(inputField3)
        controlCard.addSubview(modeSwitch)
        controlCard.addSubview(switchLabel)
        controlCard.addSubview(segmentControl)
        controlCard.addSubview(modeButton)
        resultCard.addSubview(resultLabel)
        graphCard.addSubview(graphView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        inputCard1.translatesAutoresizingMaskIntoConstraints = false
        inputCard2.translatesAutoresizingMaskIntoConstraints = false
        inputCard3.translatesAutoresizingMaskIntoConstraints = false
        controlCard.translatesAutoresizingMaskIntoConstraints = false
        resultCard.translatesAutoresizingMaskIntoConstraints = false
        graphCard.translatesAutoresizingMaskIntoConstraints = false
        inputField1.translatesAutoresizingMaskIntoConstraints = false
        inputField2.translatesAutoresizingMaskIntoConstraints = false
        inputField3.translatesAutoresizingMaskIntoConstraints = false
        modeSwitch.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        segmentControl.translatesAutoresizingMaskIntoConstraints = false
        modeButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        graphView.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        copyButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            inputCard1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            inputCard1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            inputCard1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            inputCard1.heightAnchor.constraint(equalToConstant: 60),
            
            inputField1.topAnchor.constraint(equalTo: inputCard1.topAnchor, constant: 8),
            inputField1.leadingAnchor.constraint(equalTo: inputCard1.leadingAnchor, constant: 15),
            inputField1.trailingAnchor.constraint(equalTo: inputCard1.trailingAnchor, constant: -15),
            inputField1.bottomAnchor.constraint(equalTo: inputCard1.bottomAnchor, constant: -8),
            
            inputCard2.topAnchor.constraint(equalTo: inputCard1.bottomAnchor, constant: 15),
            inputCard2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            inputCard2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            inputCard2.heightAnchor.constraint(equalToConstant: 60),
            
            inputField2.topAnchor.constraint(equalTo: inputCard2.topAnchor, constant: 8),
            inputField2.leadingAnchor.constraint(equalTo: inputCard2.leadingAnchor, constant: 15),
            inputField2.trailingAnchor.constraint(equalTo: inputCard2.trailingAnchor, constant: -15),
            inputField2.bottomAnchor.constraint(equalTo: inputCard2.bottomAnchor, constant: -8),
            
            inputCard3.topAnchor.constraint(equalTo: inputCard2.bottomAnchor, constant: 15),
            inputCard3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            inputCard3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            inputCard3.heightAnchor.constraint(equalToConstant: 60),
            
            inputField3.topAnchor.constraint(equalTo: inputCard3.topAnchor, constant: 8),
            inputField3.leadingAnchor.constraint(equalTo: inputCard3.leadingAnchor, constant: 15),
            inputField3.trailingAnchor.constraint(equalTo: inputCard3.trailingAnchor, constant: -15),
            inputField3.bottomAnchor.constraint(equalTo: inputCard3.bottomAnchor, constant: -8),
            
            controlCard.topAnchor.constraint(equalTo: inputCard3.bottomAnchor, constant: 15),
            controlCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            controlCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            modeSwitch.topAnchor.constraint(equalTo: controlCard.topAnchor, constant: 15),
            modeSwitch.leadingAnchor.constraint(equalTo: controlCard.leadingAnchor, constant: 15),
            
            switchLabel.centerYAnchor.constraint(equalTo: modeSwitch.centerYAnchor),
            switchLabel.leadingAnchor.constraint(equalTo: modeSwitch.trailingAnchor, constant: 10),
            switchLabel.trailingAnchor.constraint(equalTo: controlCard.trailingAnchor, constant: -15),
            
            segmentControl.topAnchor.constraint(equalTo: modeSwitch.bottomAnchor, constant: 15),
            segmentControl.leadingAnchor.constraint(equalTo: controlCard.leadingAnchor, constant: 15),
            segmentControl.trailingAnchor.constraint(equalTo: controlCard.trailingAnchor, constant: -15),
            segmentControl.heightAnchor.constraint(equalToConstant: 35),
            
            modeButton.topAnchor.constraint(equalTo: segmentControl.bottomAnchor, constant: 15),
            modeButton.leadingAnchor.constraint(equalTo: controlCard.leadingAnchor, constant: 15),
            modeButton.trailingAnchor.constraint(equalTo: controlCard.trailingAnchor, constant: -15),
            modeButton.heightAnchor.constraint(equalToConstant: 45),
            modeButton.bottomAnchor.constraint(equalTo: controlCard.bottomAnchor, constant: -15),
            
            calculateButton.topAnchor.constraint(equalTo: controlCard.bottomAnchor, constant: 20),
            calculateButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            calculateButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            calculateButton.heightAnchor.constraint(equalToConstant: 50),
            
            resultCard.topAnchor.constraint(equalTo: calculateButton.bottomAnchor, constant: 20),
            resultCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            resultCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            resultLabel.topAnchor.constraint(equalTo: resultCard.topAnchor, constant: 15),
            resultLabel.leadingAnchor.constraint(equalTo: resultCard.leadingAnchor, constant: 15),
            resultLabel.trailingAnchor.constraint(equalTo: resultCard.trailingAnchor, constant: -15),
            resultLabel.bottomAnchor.constraint(equalTo: resultCard.bottomAnchor, constant: -15),
            
            graphCard.topAnchor.constraint(equalTo: resultCard.bottomAnchor, constant: 20),
            graphCard.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            graphCard.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            graphCard.heightAnchor.constraint(equalToConstant: 250),
            
            graphView.topAnchor.constraint(equalTo: graphCard.topAnchor, constant: 10),
            graphView.leadingAnchor.constraint(equalTo: graphCard.leadingAnchor, constant: 10),
            graphView.trailingAnchor.constraint(equalTo: graphCard.trailingAnchor, constant: -10),
            graphView.bottomAnchor.constraint(equalTo: graphCard.bottomAnchor, constant: -10),
            
            shareButton.topAnchor.constraint(equalTo: graphCard.bottomAnchor, constant: 20),
            shareButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            shareButton.widthAnchor.constraint(equalTo: resetButton.widthAnchor),
            shareButton.heightAnchor.constraint(equalToConstant: 45),
            
            resetButton.topAnchor.constraint(equalTo: graphCard.bottomAnchor, constant: 20),
            resetButton.leadingAnchor.constraint(equalTo: shareButton.trailingAnchor, constant: 15),
            resetButton.trailingAnchor.constraint(equalTo: copyButton.leadingAnchor, constant: -15),
            resetButton.heightAnchor.constraint(equalToConstant: 45),
            resetButton.widthAnchor.constraint(equalTo: copyButton.widthAnchor),
            
            copyButton.topAnchor.constraint(equalTo: graphCard.bottomAnchor, constant: 20),
            copyButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            copyButton.heightAnchor.constraint(equalToConstant: 45),
            
            contentView.bottomAnchor.constraint(equalTo: shareButton.bottomAnchor, constant: 30)
        ])
        
        setupModeMenu()
    }
    
    private func setupModeMenu() {
        let modes = ["Linear", "Exponential", "Logarithmic", "Quantum"]
        var menuItems: [UIAction] = []
        
        for mode in modes {
            menuItems.append(UIAction(title: mode, handler: { [weak self] _ in
                self?.selectedMode = mode
                self?.modeButton.setTitle("Mode: \(mode) ▼", for: .normal)
                self?.animateButton(self?.modeButton)
            }))
        }
        
        modeButton.menu = UIMenu(title: "Select Calculation Mode", children: menuItems)
        modeButton.showsMenuAsPrimaryAction = true
    }
    
    private func setupActions() {
        calculateButton.addTarget(self, action: #selector(calculateTapped), for: .touchUpInside)
        shareButton.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(resetTapped), for: .touchUpInside)
        copyButton.addTarget(self, action: #selector(copyTapped), for: .touchUpInside)
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
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func calculateTapped() {
        guard let value1 = Double(inputField1.text ?? ""),
              let value2 = Double(inputField2.text ?? ""),
              let value3 = Double(inputField3.text ?? "") else {
            showAlert(title: "Error", message: "Please enter valid numbers in all fields")
            return
        }
        
        let switchValue = modeSwitch.isOn ? 1.2 : 0.8
        let segmentValue = Double(segmentControl.selectedSegmentIndex + 1) * 0.5
        
        var modeMultiplier: Double
        switch selectedMode {
        case "Linear": modeMultiplier = 1.0
        case "Exponential": modeMultiplier = 1.5
        case "Logarithmic": modeMultiplier = 0.7
        case "Quantum": modeMultiplier = 2.0
        default: modeMultiplier = 1.0
        }
        
        let result = (value1 * value2 * value3 * switchValue * segmentValue * modeMultiplier).rounded(toPlaces: 4)
        
        resultLabel.text = """
        Serrated Bypassline Calculation Result:
        
        Frequency: \(value1) Hz
        Amplitude: \(value2) dB
        Phase: \(value3)°
        Mode: \(selectedMode)
        Rephaser: \(modeSwitch.isOn ? "Advanced" : "Basic")
        Algorithm: \(segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? "")
        
        Final Output: \(result) Tiltband Units
        """
        
        isCalculated = true
        animateButton(calculateButton)
        drawDynamicGraph(value1: value1, value2: value2, value3: value3, result: result)
    }
    
    private func drawDynamicGraph(value1: Double, value2: Double, value3: Double, result: Double) {
        graphView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
        let maxValue = max(value1, value2, value3, result)
        let normalizedValue1 = value1 / maxValue
        let normalizedValue2 = value2 / maxValue
        let normalizedValue3 = value3 / maxValue
        let normalizedResult = result / maxValue
        
        let centerY = graphView.bounds.height / 2
        let width = graphView.bounds.width - 40
        let spacing = width / 5
        
        let colors = [
            UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1).cgColor,
            UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1).cgColor,
            UIColor(red: 0.8, green: 0.2, blue: 0.2, alpha: 1).cgColor,
            UIColor(red: 0.3, green: 0.9, blue: 0.3, alpha: 1).cgColor
        ]
        
        let values = [normalizedValue1, normalizedValue2, normalizedValue3, normalizedResult]
        let labels = ["Frequency", "Amplitude", "Phase", "Result"]
        
        for (index, value) in values.enumerated() {
            let barLayer = CAShapeLayer()
            let barPath = UIBezierPath()
            let xPos = Double(20) + spacing * (Double(index) + 0.5)
            let barHeight = CGFloat(value) * (graphView.bounds.height - 40)
            
            barPath.move(to: CGPoint(x: xPos, y: centerY + barHeight/2))
            barPath.addLine(to: CGPoint(x: xPos, y: centerY - barHeight/2))
            
            barLayer.path = barPath.cgPath
            barLayer.strokeColor = colors[index]
            barLayer.lineWidth = 30
            barLayer.lineCap = .round
            graphView.layer.addSublayer(barLayer)
            
            let animation = CABasicAnimation(keyPath: "strokeEnd")
            animation.fromValue = 0
            animation.toValue = 1
            animation.duration = 1.0
            animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
            barLayer.add(animation, forKey: "animateBar")
            
            let label = UILabel()
            label.text = labels[index]
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            label.textAlignment = .center
            label.frame = CGRect(x: xPos - 30, y: centerY + barHeight/2 + 10, width: 60, height: 20)
            graphView.addSubview(label)
            
            let valueLabel = UILabel()
            valueLabel.text = String(format: "%.2f", values[index] * maxValue)
            valueLabel.textColor = UIColor(cgColor: colors[index])
            valueLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            valueLabel.textAlignment = .center
            valueLabel.frame = CGRect(x: xPos - 30, y: centerY - barHeight/2 - 30, width: 60, height: 20)
            graphView.addSubview(valueLabel)
        }
        
        let waveLayer = CAShapeLayer()
        let wavePath = UIBezierPath()
        wavePath.move(to: CGPoint(x: 20, y: centerY))
        
        for i in 0..<Int(width) {
            let x = CGFloat(i) + 20
            let y = centerY - 30 * sin(CGFloat(i) * 0.1 + CGFloat(normalizedResult) * 50 * sin(CGFloat(i) * 0.05))
            wavePath.addLine(to: CGPoint(x: x, y: y))
        }
        
        waveLayer.path = wavePath.cgPath
        waveLayer.strokeColor = UIColor(red: 0.3, green: 0.9, blue: 0.3, alpha: 1).cgColor
        waveLayer.fillColor = UIColor.clear.cgColor
        waveLayer.lineWidth = 3
        waveLayer.lineDashPattern = [5, 3]
        graphView.layer.addSublayer(waveLayer)
        
        let waveAnimation = CABasicAnimation(keyPath: "strokeEnd")
        waveAnimation.fromValue = 0
        waveAnimation.toValue = 1
        waveAnimation.duration = 2.0
        waveLayer.add(waveAnimation, forKey: "animateWave")
    }
    
    @objc private func shareTapped() {
        guard isCalculated else {
            showAlert(title: "Error", message: "Please calculate results first")
            return
        }
        
        let activityVC = UIActivityViewController(activityItems: [resultLabel.text ?? ""], applicationActivities: nil)
        present(activityVC, animated: true)
        animateButton(shareButton)
    }
    
    @objc private func resetTapped() {
        guard isCalculated else {
            showAlert(title: "Error", message: "Nothing to reset")
            return
        }
        
        inputField1.text = ""
        inputField2.text = ""
        inputField3.text = ""
        modeSwitch.isOn = true
        segmentControl.selectedSegmentIndex = 0
        resultLabel.text = "Results will appear here"
        selectedMode = "Linear"
        modeButton.setTitle("Select Calculation Mode ▼", for: .normal)
        graphView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        graphView.subviews.forEach { $0.removeFromSuperview() }
        isCalculated = false
        animateButton(resetButton)
    }
    
    @objc private func copyTapped() {
        guard isCalculated else {
            showAlert(title: "Error", message: "Please calculate results first")
            return
        }
        
        UIPasteboard.general.string = resultLabel.text
        showAlert(title: "Copied", message: "Results copied to clipboard")
        animateButton(copyButton)
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    private func animateButton(_ button: UIButton?) {
        guard let button = button else { return }
        
        UIView.animate(withDuration: 0.1, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }, completion: { _ in
            UIView.animate(withDuration: 0.1) {
                button.transform = .identity
            }
        })
    }
}

extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
