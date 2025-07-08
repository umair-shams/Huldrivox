import UIKit

class OutbendPathlayerController: UIViewController {
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
        label.text = "Outbend Pathlayer Fragmentmist Containplane Distributor Calculator"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let inputCard1: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputCard2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputCard3: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let controlCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let resultCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let graphCard: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        view.layer.cornerRadius = 12
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
        return view
    }()
    
    private let inputField1: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Fragmentmist Value"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(string: "Enter Fragmentmist Value", attributes: [.foregroundColor: UIColor.lightGray])
        return tf
    }()
    
    private let inputField2: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Containplane Factor"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(string: "Enter Containplane Factor", attributes: [.foregroundColor: UIColor.lightGray])
        return tf
    }()
    
    private let inputField3: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter Distributor Index"
        tf.textColor = .white
        tf.keyboardType = .decimalPad
        tf.attributedPlaceholder = NSAttributedString(string: "Enter Distributor Index", attributes: [.foregroundColor: UIColor.lightGray])
        return tf
    }()
    
    private let modeSwitch: UISwitch = {
        let sw = UISwitch()
        sw.onTintColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1)
        sw.isOn = true
        return sw
    }()
    
    private let switchLabel: UILabel = {
        let label = UILabel()
        label.text = "Enable Pathlayer Mode"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    private let segmentControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Standard", "Enhanced", "Quantum"])
        sc.selectedSegmentTintColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        sc.setTitleTextAttributes([.foregroundColor: UIColor.lightGray], for: .normal)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private var modeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Select Calculation Mode ▼", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.3)
        button.layer.cornerRadius = 8
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.5).cgColor
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
        button.backgroundColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1)
        button.layer.cornerRadius = 12
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return button
    }()
    
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("SHARE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RESET", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 1, green: 0.3, blue: 0.2, alpha: 1)
        button.layer.cornerRadius = 12
        return button
    }()
    
    private let copyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("COPY", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1)
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
    private var gradientLayer: CAGradientLayer!
    private var particleEmitter: CAEmitterLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackground()
        setupUI()
        setupActions()
        setupKeyboardToolbar()
        setupModeMenu()
    }
    
    private func setupBackground() {
        gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.1, green: 0.1, blue: 0.3, alpha: 1).cgColor,
            UIColor(red: 0.2, green: 0.1, blue: 0.4, alpha: 1).cgColor,
            UIColor(red: 0.1, green: 0.2, blue: 0.3, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        setupParticles()
        animateBackground()
    }
    
    private func setupParticles() {
        particleEmitter = CAEmitterLayer()
        particleEmitter.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        particleEmitter.emitterShape = .line
        particleEmitter.emitterSize = CGSize(width: view.bounds.width, height: 1)
        
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 15
        cell.velocity = 50
        cell.velocityRange = 30
        cell.emissionLongitude = .pi
        cell.scale = 0.1
        cell.scaleRange = 0.05
        cell.contents = UIImage(systemName: "circle.fill")?.cgImage
        cell.color = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.3).cgColor
        cell.alphaSpeed = -0.05
        
        particleEmitter.emitterCells = [cell]
        view.layer.insertSublayer(particleEmitter, above: gradientLayer)
    }
    
    private func animateBackground() {
        let animation = CABasicAnimation(keyPath: "colors")
        animation.fromValue = gradientLayer.colors
        animation.toValue = [
            UIColor(red: 0.15, green: 0.15, blue: 0.4, alpha: 1).cgColor,
            UIColor(red: 0.25, green: 0.15, blue: 0.5, alpha: 1).cgColor,
            UIColor(red: 0.15, green: 0.25, blue: 0.4, alpha: 1).cgColor
        ]
        animation.duration = 8.0
        animation.autoreverses = true
        animation.repeatCount = .infinity
        gradientLayer.add(animation, forKey: "gradientChange")
    }
    
    private func setupUI() {
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
        Outbend Pathlayer Calculation Result:
        
        Fragmentmist: \(value1) Hz
        Containplane: \(value2) dB
        Distributor: \(value3)°
        Mode: \(selectedMode)
        Pathlayer: \(modeSwitch.isOn ? "Active" : "Inactive")
        Algorithm: \(segmentControl.titleForSegment(at: segmentControl.selectedSegmentIndex) ?? "")
        
        Final Output: \(result) Bend Units
        """
        
        isCalculated = true
        animateButton(calculateButton)
        drawRadarGraph(value1: value1, value2: value2, value3: value3, result: result)
    }
    
    private func drawRadarGraph(value1: Double, value2: Double, value3: Double, result: Double) {
        graphView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        graphView.subviews.forEach { $0.removeFromSuperview() }
        
        let maxValue = max(value1, value2, value3, result)
        let normalizedValue1 = value1 / maxValue
        let normalizedValue2 = value2 / maxValue
        let normalizedValue3 = value3 / maxValue
        let normalizedResult = result / maxValue
        
        let center = CGPoint(x: graphView.bounds.width / 2, y: graphView.bounds.height / 2)
        let radius = min(graphView.bounds.width, graphView.bounds.height) * 0.4
        let angleIncrement = CGFloat.pi * 2 / 4
        
        let colors = [
            UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1).cgColor,
            UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1).cgColor,
            UIColor(red: 1, green: 0.3, blue: 0.2, alpha: 1).cgColor,
            UIColor(red: 0.9, green: 0.5, blue: 0.1, alpha: 1).cgColor
        ]
        
        let values = [normalizedValue1, normalizedValue2, normalizedValue3, normalizedResult]
        let labels = ["Fragmentmist", "Containplane", "Distributor", "Result"]
        
        let radarLayer = CAShapeLayer()
        let radarPath = UIBezierPath()
        
        for i in 0..<4 {
            let angle = angleIncrement * CGFloat(i) - CGFloat.pi / 2
            let value = values[i]
            let x = center.x + cos(angle) * radius * CGFloat(value)
            let y = center.y + sin(angle) * radius * CGFloat(value)
            
            if i == 0 {
                radarPath.move(to: CGPoint(x: x, y: y))
            } else {
                radarPath.addLine(to: CGPoint(x: x, y: y))
            }
            
            let dotLayer = CAShapeLayer()
            let dotPath = UIBezierPath(ovalIn: CGRect(x: x - 8, y: y - 8, width: 16, height: 16))
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = colors[i]
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineWidth = 2
            graphView.layer.addSublayer(dotLayer)
            
            let label = UILabel()
            label.text = "\(labels[i]): \(String(format: "%.2f", values[i] * maxValue))"
            label.textColor = UIColor(cgColor: colors[i])
            label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
            label.textAlignment = .center
            
            let labelX = center.x + cos(angle) * (radius + 20)
            let labelY = center.y + sin(angle) * (radius + 20)
            label.frame = CGRect(x: labelX - 50, y: labelY - 10, width: 100, height: 20)
            graphView.addSubview(label)
        }
        
        radarPath.close()
        radarLayer.path = radarPath.cgPath
        radarLayer.fillColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.2).cgColor
        radarLayer.strokeColor = UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 0.8).cgColor
        radarLayer.lineWidth = 2
        graphView.layer.insertSublayer(radarLayer, at: 0)
        
        let gridLayer = CAShapeLayer()
        let gridPath = UIBezierPath()
        
        for i in 0..<3 {
            let gridRadius = radius * CGFloat(i + 1) / 3
            gridPath.move(to: CGPoint(x: center.x + cos(-CGFloat.pi/2) * gridRadius,
                         y: center.y + sin(-CGFloat.pi/2) * gridRadius))
            
            for j in 1...4 {
                let angle = angleIncrement * CGFloat(j) - CGFloat.pi / 2
                gridPath.addLine(to: CGPoint(x: center.x + cos(angle) * gridRadius,
                                y: center.y + sin(angle) * gridRadius))
            }
            
            gridPath.close()
        }
        
        gridLayer.path = gridPath.cgPath
        gridLayer.strokeColor = UIColor(white: 1, alpha: 0.2).cgColor
        gridLayer.fillColor = UIColor.clear.cgColor
        gridLayer.lineWidth = 1
        graphView.layer.insertSublayer(gridLayer, at: 0)
        
        let animation = CABasicAnimation(keyPath: "path")
        animation.fromValue = UIBezierPath(rect: CGRect(x: center.x, y: center.y, width: 0, height: 0)).cgPath
        animation.toValue = radarPath.cgPath
        animation.duration = 1.0
        radarLayer.add(animation, forKey: "drawRadar")
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
