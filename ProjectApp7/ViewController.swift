//
//  ViewController.swift
//  ProjectApp7
//
//  Created by Shailesh Srigiri on 11/13/24.
//

import UIKit

class ViewController: UIViewController {
    
    let lifecycleIndicatorLabel = UILabel()
    let simpleButton = UIButton(type: .system)
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: delayedViewDidLoadActions)
        
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 7, execute: delayedViewWillAppearActions)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 9, execute: delayedViewDidAppearActions)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: delayedViewWillDisappearActions)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 4, execute: delayedViewDidDisappearActions)
    }
    
    func delayedViewDidLoadActions() {
        print("LifecycleViewController - viewDidLoad")
        updateLifecycleIndicatorLabel(withText: "viewDidLoad")
        changeBackgroundColor(for: "viewDidLoad")
    }
    
    func delayedViewWillAppearActions() {
        print("LifecycleViewController - viewWillAppear")
        updateLifecycleIndicatorLabel(withText: "viewWillAppear")
        changeBackgroundColor(for: "viewWillAppear")
    }

    func delayedViewDidAppearActions() {
        print("LifecycleViewController - viewDidAppear")
        updateLifecycleIndicatorLabel(withText: "viewDidAppear")
        changeBackgroundColor(for: "viewDidAppear")
    }

    func delayedViewWillDisappearActions() {
        print("LifecycleViewController - viewWillDisappear")
        updateLifecycleIndicatorLabel(withText: "viewWillDisappear")
        changeBackgroundColor(for: "viewWillDisappear")
    }

    func delayedViewDidDisappearActions() {
        print("LifecycleViewController - viewDidDisappear")
        updateLifecycleIndicatorLabel(withText: "viewDidDisappear")
        changeBackgroundColor(for: "viewDidDisappear")
    }

    func setupUI() {
        gradientLayer.colors = [UIColor.systemOrange.cgColor, UIColor.systemYellow.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)

        lifecycleIndicatorLabel.textAlignment = .center
        lifecycleIndicatorLabel.font = UIFont.boldSystemFont(ofSize: 32)
        lifecycleIndicatorLabel.layer.cornerRadius = 10
        lifecycleIndicatorLabel.layer.masksToBounds = true
        lifecycleIndicatorLabel.textColor = .darkGray
        lifecycleIndicatorLabel.translatesAutoresizingMaskIntoConstraints = true

        simpleButton.setTitle("Tap Me", for: .normal)
        simpleButton.backgroundColor = .systemBlue
        simpleButton.setTitleColor(.white, for: .normal)
        simpleButton.layer.cornerRadius = 10
        simpleButton.layer.shadowColor = UIColor.black.cgColor
        simpleButton.layer.shadowOpacity = 0.2
        simpleButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        simpleButton.layer.shadowRadius = 5
        simpleButton.translatesAutoresizingMaskIntoConstraints = true

        view.addSubview(lifecycleIndicatorLabel)
        view.addSubview(simpleButton)

        lifecycleIndicatorLabel.frame = CGRect(x: 20, y: 100, width: view.bounds.width - 40, height: 100)
        simpleButton.frame = CGRect(x: 20, y: 220, width: view.bounds.width - 40, height: 50)

        simpleButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    func updateLifecycleIndicatorLabel(withText text: String) {
        lifecycleIndicatorLabel.text = text
    }

    func changeBackgroundColor(for lifecycleEvent: String) {
        var gradientColors: [CGColor]
        switch lifecycleEvent {
        case "viewDidLoad":
            gradientColors = [UIColor.systemBlue.cgColor, UIColor.systemCyan.cgColor]
        case "viewWillAppear":
            gradientColors = [UIColor.systemGreen.cgColor, UIColor.systemMint.cgColor]
        case "viewDidAppear":
            gradientColors = [UIColor.systemYellow.cgColor, UIColor.systemOrange.cgColor]
        case "viewWillDisappear":
            gradientColors = [UIColor.systemRed.cgColor, UIColor.systemPink.cgColor]
        case "viewDidDisappear":
            gradientColors = [UIColor.systemPurple.cgColor, UIColor.systemIndigo.cgColor]
        default:
            gradientColors = [UIColor.systemBackground.cgColor, UIColor.systemGray.cgColor]
        }
        gradientLayer.colors = gradientColors
    }

    @objc func buttonTapped() {
        print("Button was tapped!")
        updateLifecycleIndicatorLabel(withText: "Button Tapped!")
        changeBackgroundColor(for: "Button Tapped!")
        navigateToNextViewController()
    }

    func navigateToNextViewController() {
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = .white
        nextViewController.title = "Next View"
        navigationController?.pushViewController(nextViewController, animated: true)
    }

}
