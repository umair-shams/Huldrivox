import UIKit

class ViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "HULDRIVOX"
        label.font = UIFont(name: "Avenir-Black", size: 48) ?? UIFont.systemFont(ofSize: 48, weight: .black)
        label.textAlignment = .center
        label.textColor = .white
        label.layer.shadowColor = UIColor.cyan.cgColor
        label.layer.shadowRadius = 10
        label.layer.shadowOpacity = 0.8
        label.layer.shadowOffset = CGSize(width: 0, height: 0)
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Spined Mist-paths Calculations"
        label.font = UIFont(name: "Avenir-Medium", size: 18) ?? UIFont.systemFont(ofSize: 18, weight: .medium)
        label.textAlignment = .center
        label.textColor = UIColor(white: 0.9, alpha: 1)
        return label
    }()
    
    private let buttonContainer: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor(red: 0.1, green: 0.1, blue: 0.2, alpha: 0.3)
        return view
    }()
    
    private var buttons: [UIButton] = []
    private let featureTitles = [
        "Overmesh Pathward Spiralock Intensity Siphon Calculator",
        "Serrated Bypassline Imprint Rephaser Tiltband Calculator",
        "Wayflow Bendersect Spinemap Crosserupt Pathfield Calculator",
        "Outbend Pathlayer Fragmentmist Containplane Distributor Calculator",
        "Catchpath Redirector Splitbeam Subshift Modulator Calculator",
        "Overcatch Spinespan Reproject Pushlock Switcher Calculator"
    ]
    
    private let featureIcons = [
        "atom", "waveform.path.ecg", "gyroscope", "opticaldisc",
        "point.3.filled.connected.trianglepath.dotted", "cpu"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupAnimations()
        setupParticles()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor(red: 0.05, green: 0.05, blue: 0.15, alpha: 1).cgColor,
            UIColor(red: 0.15, green: 0.05, blue: 0.1, alpha: 1).cgColor,
            UIColor(red: 0.1, green: 0.1, blue: 0.2, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 0.5, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
        
        let titleStack = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        titleStack.axis = .vertical
        titleStack.spacing = 8
        
        view.addSubview(titleStack)
        view.addSubview(buttonContainer)
        
        titleStack.translatesAutoresizingMaskIntoConstraints = false
        buttonContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            buttonContainer.topAnchor.constraint(equalTo: titleStack.bottomAnchor, constant: 25),
            buttonContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            buttonContainer.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.65)
        ])
        
        createButtons()
    }
    
    private func createButtons() {
        let colors: [UIColor] = [
            UIColor(red: 1, green: 0.3, blue: 0.2, alpha: 1),
            UIColor(red: 0.1, green: 0.8, blue: 0.6, alpha: 1),
            UIColor(red: 1, green: 0.7, blue: 0.1, alpha: 1),
            UIColor(red: 0.3, green: 0.5, blue: 1, alpha: 1),
            UIColor(red: 0.8, green: 0.2, blue: 0.8, alpha: 1),
            UIColor(red: 0.3, green: 0.9, blue: 0.3, alpha: 1)
        ]
        
        let buttonStack = UIStackView()
        buttonStack.axis = .vertical
        buttonStack.spacing = 15
        buttonStack.distribution = .fillEqually
        buttonContainer.addSubview(buttonStack)
        buttonStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonStack.topAnchor.constraint(equalTo: buttonContainer.topAnchor, constant: 20),
            buttonStack.bottomAnchor.constraint(equalTo: buttonContainer.bottomAnchor, constant: -20),
            buttonStack.leadingAnchor.constraint(equalTo: buttonContainer.leadingAnchor, constant: 15),
            buttonStack.trailingAnchor.constraint(equalTo: buttonContainer.trailingAnchor, constant: -15)
        ])
        
        for i in 0..<6 {
            let button = createButton(title: featureTitles[i], color: colors[i], icon: featureIcons[i])
            button.tag = i
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            buttons.append(button)
            
            let row = UIView()
            row.addSubview(button)
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: row.topAnchor),
                button.bottomAnchor.constraint(equalTo: row.bottomAnchor),
                button.leadingAnchor.constraint(equalTo: row.leadingAnchor),
                button.trailingAnchor.constraint(equalTo: row.trailingAnchor)
            ])
            
            buttonStack.addArrangedSubview(row)
        }
    }
    
    private func createButton(title: String, color: UIColor, icon: String) -> UIButton {
           let button = UIButton()
           button.backgroundColor = color.withAlphaComponent(0.3)
           button.layer.cornerRadius = 16
           button.layer.borderWidth = 2
           button.layer.borderColor = color.withAlphaComponent(0.8).cgColor
           
           let container = TouchThroughStackView()
           container.axis = .horizontal
           container.spacing = 15
           container.alignment = .center
           container.isUserInteractionEnabled = false
           
           let iconView = UIImageView(image: UIImage(systemName: icon))
           iconView.tintColor = .white
           iconView.contentMode = .scaleAspectFit
           iconView.isUserInteractionEnabled = false
           
           let titleLabel = UILabel()
           titleLabel.text = title
           titleLabel.font = UIFont(name: "Avenir-Heavy", size: 14) ?? UIFont.systemFont(ofSize: 14, weight: .heavy)
           titleLabel.textColor = .white
           titleLabel.numberOfLines = 2
           titleLabel.textAlignment = .left
           titleLabel.isUserInteractionEnabled = false
           
           container.addArrangedSubview(iconView)
           container.addArrangedSubview(titleLabel)
           button.addSubview(container)
           
           container.translatesAutoresizingMaskIntoConstraints = false
           iconView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               iconView.widthAnchor.constraint(equalToConstant: 30),
               iconView.heightAnchor.constraint(equalToConstant: 30),
               
               container.centerYAnchor.constraint(equalTo: button.centerYAnchor),
               container.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 20),
               container.trailingAnchor.constraint(equalTo: button.trailingAnchor, constant: -20)
           ])
           
           return button
       }
       
    
    private func setupAnimations() {
        let titleAnimation = CABasicAnimation(keyPath: "shadowOpacity")
        titleAnimation.fromValue = 0.3
        titleAnimation.toValue = 0.8
        titleAnimation.duration = 2
        titleAnimation.autoreverses = true
        titleAnimation.repeatCount = .infinity
        titleLabel.layer.add(titleAnimation, forKey: "titleGlow")
        
        for button in buttons {
            let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
            pulseAnimation.fromValue = 0.98
            pulseAnimation.toValue = 1.02
            pulseAnimation.duration = 2
            pulseAnimation.autoreverses = true
            pulseAnimation.repeatCount = .infinity
            button.layer.add(pulseAnimation, forKey: "buttonPulse")
            
            let borderAnimation = CABasicAnimation(keyPath: "borderColor")
            borderAnimation.fromValue = button.backgroundColor?.withAlphaComponent(0.5).cgColor
            borderAnimation.toValue = UIColor.white.cgColor
            borderAnimation.duration = 3
            borderAnimation.autoreverses = true
            borderAnimation.repeatCount = .infinity
            button.layer.add(borderAnimation, forKey: "borderGlow")
        }
    }
    
    private func setupParticles() {
        let emitterLayer = CAEmitterLayer()
        emitterLayer.emitterPosition = CGPoint(x: view.bounds.width / 2, y: -50)
        emitterLayer.emitterShape = .line
        emitterLayer.emitterSize = CGSize(width: view.bounds.width, height: 1)
        
        let cell = CAEmitterCell()
        cell.birthRate = 5
        cell.lifetime = 20
        cell.velocity = 50
        cell.velocityRange = 30
        cell.emissionLongitude = .pi
        cell.scale = 0.2
        cell.scaleRange = 0.1
        cell.contents = UIImage(systemName: "circle.fill")?.cgImage
        cell.color = UIColor(white: 1, alpha: 0.3).cgColor
        cell.alphaSpeed = -0.05
        
        emitterLayer.emitterCells = [cell]
        view.layer.addSublayer(emitterLayer)
    }
    
    @objc private func buttonTapped(_ sender: UIButton) {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        UIView.animate(withDuration: 0.1, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
            sender.alpha = 0.8
        }, completion: { _ in
            UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.2, options: [], animations: {
                sender.transform = .identity
                sender.alpha = 1.0
            }, completion: { _ in
                self.navigateToFeature(index: sender.tag)
            })
        })
    }
    
    private func navigateToFeature(index: Int) {
        let controller: UIViewController
        
        switch index {
        case 0:
            controller = OvermeshPathwardController()
        case 1:
            controller = SerratedBypasslineController()
        case 2:
            controller = WayflowBendersectController()
        case 3:
            controller = OutbendPathlayerController()
        case 4:
            controller = CatchpathRedirectorController()
        case 5:
            controller = OvercatchSpinespanController()
        default:
            return
        }
        
        if let navController = self.navigationController {
            navController.pushViewController(controller, animated: true)
        } else {
            let navController = UINavigationController(rootViewController: controller)
            navController.modalPresentationStyle = .fullScreen
            navController.modalTransitionStyle = .flipHorizontal
            self.present(navController, animated: true)
        }
    }
}

class TouchThroughStackView: UIStackView {
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return false
    }
}
