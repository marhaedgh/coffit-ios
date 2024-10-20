//
//  RegisterViewController.swift
//  Shaka
//
//  Created by danna.x-PC on 10/17/24.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let businessTypeSegmentedControl = UISegmentedControl(items: ["개인사업자", "법인사업자"])
    private let taxTypeSegmentedControl = UISegmentedControl(items: ["과세사업자", "면세사업자"])
    private let employeeCountPicker = UIPickerView()
    private let industryPicker = UIPickerView()
    
    private let employeeCountOptions = ["1-4인", "5-20인", "20-50인", "50-100인", "100-500인", "500인 이상"]
    private let industryOptions = ["제조업", "서비스업", "도소매업", "건설업", "IT업"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setLayout()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
}

extension RegisterViewController {
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        
        navigationItem.title = "사업자 정보 입력"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        employeeCountPicker.delegate = self
        employeeCountPicker.dataSource = self
        
        industryPicker.delegate = self
        industryPicker.dataSource = self
    }
    
    private func setLayout() {
        setScrollView()
        setContentView()
        setBusinessTypeSegmentedControl()
        setTaxTypeSegmentedControl()
        setEmployeeCountPicker()
        setIndustryPicker()
        setSubmitButton()
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setContentView() {
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
    }
    
    private func setBusinessTypeSegmentedControl() {
        contentView.addSubview(businessTypeSegmentedControl)
        
        businessTypeSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(30)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
    }
    
    private func setTaxTypeSegmentedControl() {
        contentView.addSubview(taxTypeSegmentedControl)
        
        taxTypeSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(businessTypeSegmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
    }
    
    private func setEmployeeCountPicker() {
        let label = UILabel()
        label.text = "상시근로자 수:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(label)
        contentView.addSubview(employeeCountPicker)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(taxTypeSegmentedControl.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        employeeCountPicker.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(150)
        }
    }
    
    private func setIndustryPicker() {
        let label = UILabel()
        label.text = "업종:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(label)
        contentView.addSubview(industryPicker)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(employeeCountPicker.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        industryPicker.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(150)
        }
    }
    
    private func setSubmitButton() {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.buttonSize = .large
        config.title = "제출"
        
        let button = UIButton(configuration: config, primaryAction: UIAction(handler: { [weak self] _ in
            self?.submit()
        }))
        
        button.isUserInteractionEnabled = true
        
        contentView.addSubview(button)
        button.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.top.equalTo(industryPicker.snp.bottom).offset(40)
            make.bottom.equalTo(contentView).offset(-20)
        }
    }
    
    @objc private func submit() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           
           let window = sceneDelegate.window {
            window.rootViewController = UINavigationController(rootViewController: HomeViewController())
            window.makeKeyAndVisible()
        }
    }
}

extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == employeeCountPicker {
            return employeeCountOptions.count
        } else if pickerView == industryPicker {
            return industryOptions.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == employeeCountPicker {
            return employeeCountOptions[row]
        } else if pickerView == industryPicker {
            return industryOptions[row]
        }
        return nil
    }
}
