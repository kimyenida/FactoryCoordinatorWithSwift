//
//  OnBoardingViewController.swift
//  FactoryCoordinator
//
//  Created by Admin iMBC on 10/4/24.
//

import UIKit

class OnBoardingViewController: UIViewController {
    var viewModel: OnBoardingViewModel?
    
    var passbtn: UIButton = {
        var btn = UIButton()
        btn.setTitle("온보딩 확인버튼", for: .normal)
        btn.backgroundColor = .lightGray
        return btn
    }()
    
    init(viewModel: OnBoardingViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        viewModel?.start()
        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(passbtn)
        passbtn.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passbtn.widthAnchor.constraint(equalToConstant: 50),
            passbtn.heightAnchor.constraint(equalToConstant: 30),
            passbtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            passbtn.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        passbtn.addTarget(self, action: #selector(tapStartBtn), for: .touchUpInside)
    }
    
    @objc
    private func tapStartBtn(_ sender: UIButton) {
        print("button clickED")
        viewModel?.triggerPublisher.send(.main)
    }
}
