//
//  RegisterViewController.swift
//  Coffit
//
//  Created by danna.x-PC on 10/17/24.
//

import UIKit
import SnapKit
import Moya

class RegisterViewController: UIViewController {
    
    private let industryOptions = Industry.sector
    private let regionData = Region.data
    
    private var selectedCity: String? {
        didSet {
            districtPicker.reloadAllComponents()
        }
    }
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let businessTypeSegmentedControl = UISegmentedControl(items: ["개인사업자", "법인사업자"])
    private let businessStatusSegmentedControl = UISegmentedControl(items: ["창업", "재창업", "기존 사업자"])
    private let industryPicker = UIPickerView()
    
    private let regionStackView = UIStackView()
    private let cityPicker = UIPickerView()
    private let districtPicker = UIPickerView()
    
    private let birthDatePicker = UIDatePicker()
    private let genderSegmentedControl = UISegmentedControl(items: ["남성", "여성"])
    
    private let salesTextField = UITextField()
    private let salesDescriptionLabel = UILabel()
    private let employeeCountTextField = UITextField()
    
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
    // MARK: - UI
    private func setupUI() {
        view.backgroundColor = .secondarySystemBackground
        
        navigationItem.title = "사업자 정보 입력"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        scrollView.delegate = self
        
        industryPicker.delegate = self
        industryPicker.dataSource = self
        
        cityPicker.delegate = self
        cityPicker.dataSource = self
        districtPicker.delegate = self
        districtPicker.dataSource = self
        
        birthDatePicker.datePickerMode = .date
        birthDatePicker.preferredDatePickerStyle = .wheels
        
        setupTextFields()
    }
    
    private func setupTextFields() {
        salesTextField.placeholder = "연간 매출액 (단위: 원)"
        salesTextField.borderStyle = .roundedRect
        salesTextField.keyboardType = .numberPad
        salesTextField.addTarget(self, action: #selector(salesTextFieldDidChange), for: .editingChanged)
        
        salesDescriptionLabel.font = .systemFont(ofSize: 12)
        salesDescriptionLabel.textColor = .gray
        
        employeeCountTextField.placeholder = "종업원 수"
        employeeCountTextField.borderStyle = .roundedRect
        employeeCountTextField.keyboardType = .numberPad
    }
    
    private func setLayout() {
        setScrollView()
        setBusinessTypeSegmentedControl()
        setBusinessStatusSegmentedControl()
        setIndustryPicker()
        setRegionPicker()
        setSalesAndEmployeeInfo()
        setRepresentativeInfo()
        setSubmitButton()
        
        // 최종 컨텐츠 크기 설정
        contentView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.subviews.last!).offset(30)
        }
    }
    
    private func setScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        scrollView.delegate = self
        scrollView.keyboardDismissMode = .onDrag
        
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
    
    private func setBusinessStatusSegmentedControl() {
        contentView.addSubview(businessStatusSegmentedControl)
        
        businessStatusSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(businessTypeSegmentedControl.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
    }
    
    private func setIndustryPicker() {
        let label = UILabel()
        label.text = "업종:"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        
        contentView.addSubview(label)
        contentView.addSubview(industryPicker)
        
        label.snp.makeConstraints { make in
            make.top.equalTo(businessStatusSegmentedControl.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        industryPicker.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(150)
        }
    }
    
    private func setRegionPicker() {
        let titleLabel = UILabel()
        titleLabel.text = "지역:"
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        selectedCity = "광주광역시"
        
        regionStackView.axis = .horizontal
        regionStackView.distribution = .fillEqually
        regionStackView.spacing = 10
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(regionStackView)
        regionStackView.addArrangedSubview(cityPicker)
        regionStackView.addArrangedSubview(districtPicker)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(industryPicker.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        regionStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(150)
        }
    }
    
    private func setSalesAndEmployeeInfo() {
        let salesLabel = UILabel()
        salesLabel.text = "매출액"
        salesLabel.font = .systemFont(ofSize: 14)
        salesLabel.textColor = .darkGray
        
        let employeeLabel = UILabel()
        employeeLabel.text = "직원 수"
        employeeLabel.font = .systemFont(ofSize: 14)
        employeeLabel.textColor = .darkGray
        
        contentView.addSubview(salesLabel)
        contentView.addSubview(salesTextField)
        contentView.addSubview(salesDescriptionLabel)
        contentView.addSubview(employeeLabel)
        contentView.addSubview(employeeCountTextField)
        
        salesLabel.snp.makeConstraints { make in
            make.top.equalTo(regionStackView.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        salesTextField.snp.makeConstraints { make in
            make.top.equalTo(salesLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(44)
        }
        
        salesDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(salesTextField.snp.bottom).offset(4)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        employeeLabel.snp.makeConstraints { make in
            make.top.equalTo(salesDescriptionLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        employeeCountTextField.snp.makeConstraints { make in
            make.top.equalTo(employeeLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(20)
            make.height.equalTo(44)
        }
    }
    
    private func setRepresentativeInfo() {
        let titleLabel = UILabel()
        titleLabel.text = "대표자 정보"
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        
        let birthLabel = UILabel()
        birthLabel.text = "생년월일"
        birthLabel.font = .systemFont(ofSize: 14)
        birthLabel.textColor = .darkGray
        
        let genderLabel = UILabel()
        genderLabel.text = "성별"
        genderLabel.font = .systemFont(ofSize: 14)
        genderLabel.textColor = .darkGray
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(birthLabel)
        contentView.addSubview(birthDatePicker)
        contentView.addSubview(genderLabel)
        contentView.addSubview(genderSegmentedControl)
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(employeeCountTextField.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        birthLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        birthDatePicker.snp.makeConstraints { make in
            make.top.equalTo(birthLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(birthDatePicker.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
        
        genderSegmentedControl.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
    }

    private func setSubmitButton() {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .medium
        config.buttonSize = .large
        config.title = "등록하기"
        
        let button = UIButton(configuration: config, primaryAction: UIAction(handler: { [weak self] _ in
            self?.submit()
        }))
        
        contentView.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedControl.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(contentView).inset(20)
        }
    }
    
    // MARK: - Business Logic
    @objc private func salesTextFieldDidChange() {
        guard let text = salesTextField.text?.replacingOccurrences(of: ",", with: ""),
              let number = Int(text) else {
            salesDescriptionLabel.text = ""
            return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        salesTextField.text = numberFormatter.string(from: NSNumber(value: number))
        
        salesDescriptionLabel.text = convertNumberToKorean(number)
    }
    
    private func convertNumberToKorean(_ number: Int) -> String {
        let units = ["", "만", "억"]
        var result = ""
        var num = number
        var unitIndex = 0
        
        while num > 0 && unitIndex < units.count {
            let part = num % 10000
            if part > 0 {
                let partString = part == 1 && unitIndex > 0 ? "" : "\(part)"
                result = "\(partString)\(units[unitIndex])" + (result.isEmpty ? "" : " ") + result
            }
            num /= 10000
            unitIndex += 1
        }

        return "\(result)원"
    }
    
    @objc private func submit() {
        let provider = MoyaProvider<UserAPI>()
        
        let businessType = businessTypeSegmentedControl.selectedSegmentIndex == 0 ? "개인사업자" : "법인사업자"
        
        let corporationType: String
        switch businessStatusSegmentedControl.selectedSegmentIndex {
        case 0:
            corporationType = "창업"
        case 1:
            corporationType = "재창업"
        default:
            corporationType = "기존 사업자"
        }
        
        let selectedIndustry = industryOptions[industryPicker.selectedRow(inComponent: 0)]
        
        let city = Array(regionData.keys).sorted()[cityPicker.selectedRow(inComponent: 0)]
        let district = regionData[city]?[districtPicker.selectedRow(inComponent: 0)] ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let birthday = dateFormatter.string(from: birthDatePicker.date)
        
        let gender = genderSegmentedControl.selectedSegmentIndex == 0 ? "남" : "여"
        
        let revenue = Float(salesTextField.text?.replacingOccurrences(of: ",", with: "") ?? "0") ?? 0
        let employees = Int(employeeCountTextField.text ?? "0") ?? 0
        
        provider.request(.register(request: RegisterUserRequest(
            businessType: businessType,
            corporationType: corporationType,
            industry: selectedIndustry,
            regionCity: city,
            regionDistrict: district,
            representativeBirthday: birthday,
            representativeGender: gender,
            revenue: revenue,
            employees: employees
        ))) { (result) in
            switch result {
            case .success(let response):
                do {
                    let baseResponse = try response.map(BaseResponse<RegisterUserResponse>.self)
                    
                    if let data = baseResponse.data {
                        UserDefaults.setUserId(data.userId)
                        UserDefaults.setBusinessId(data.businessDataId)
                        self.moveToHomeView()
                    }
                    
                    print("Parsing error: \(baseResponse)")
                } catch {
                    print("Decoding error: \(error)")
                }
            case .failure(let error):
                print("Network error: \(error)")
            }
        }
    }
    
    private func moveToHomeView() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let sceneDelegate = windowScene.delegate as? SceneDelegate,
           let window = sceneDelegate.window {
            window.rootViewController = UINavigationController(rootViewController: HomeViewController())
            window.makeKeyAndVisible()
        }
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == cityPicker {
            return Array(regionData.keys).count
        } else if pickerView == districtPicker {
            guard let selectedCity = selectedCity,
                  let districts = regionData[selectedCity] else { return 0 }
            return districts.count
        } else {
            return industryOptions.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == cityPicker {
            return Array(regionData.keys).sorted()[row]
        } else if pickerView == districtPicker {
            guard let selectedCity = selectedCity,
                  let districts = regionData[selectedCity] else { return nil }
            return districts[row]
        } else {
            return industryOptions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == cityPicker {
            selectedCity = Array(regionData.keys).sorted()[row]
        }
    }
}

// MARK: - UIScrollViewDelegate
extension RegisterViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}
