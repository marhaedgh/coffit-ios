//
//  RegisterViewController.swift
//  Coffit
//
//  Created by danna.x-PC on 10/17/24.
//

import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: - Properties
    private let businessTypeSegmentedControl = UISegmentedControl(items: ["개인사업자", "법인사업자"])
    private let businessStatusSegmentedControl = UISegmentedControl(items: ["창업", "재창업", "기존 사업자"])
    private let industryPicker = UIPickerView()
    
    private let regionStackView = UIStackView()
    private let cityPicker = UIPickerView()
    private let districtPicker = UIPickerView()
    
    private let birthDatePicker = UIDatePicker()
    private let genderSegmentedControl = UISegmentedControl(items: ["남성", "여성"])
    
    private let salesTextField = UITextField()
    private let employeeCountTextField = UITextField()
    
    private let industryOptions = [
        "자동차 및 부품 판매업", "도매 및 상품 중개업", "소매업(자동차 제외)",
        "숙박업", "음식점업", "제조업", "교육 서비스업",
        "협회 및 단체, 수리 및 기타 개인 서비스업", "부동산업",
        "전문, 과학 및 기술 서비스업", "예술, 스포츠 및 여가 관련 서비스업",
        "정보통신업", "농업, 임업 및 어업", "건설업", "운수 및 창고업",
        "보건업 및 사회복지 서비스업", "사업시설 관리, 사업 지원 및 임대 서비스업",
        "금융 및 보험업", "전기, 가스, 증기 및 공기 조절 공급업", "광업",
        "수도, 하수 및 폐기물 처리, 원료 재생업",
        "가구 내 고용활동 및 달리 분류되지 않은 자가 소비 생산활동",
        "공공 행정, 국방 및 사회보장 행정", "국제 및 외국기관"
    ]
    
    private let regionData: [String: [String]] = [
        "서울특별시": ["강남구", "강동구", "강북구", "강서구", "관악구", "광진구", "구로구", "금천구",
                   "노원구", "도봉구", "동대문구", "동작구", "마포구", "서대문구", "서초구", "성동구",
                   "성북구", "송파구", "양천구", "영등포구", "용산구", "은평구", "종로구", "중구", "중랑구"],
        "부산광역시": ["강서구", "금정구", "남구", "동구", "동래구", "부산진구", "북구", "사상구",
                   "사하구", "서구", "수영구", "연제구", "영도구", "중구", "해운대구", "기장군"],
        "대구광역시": ["남구", "달서구", "동구", "북구", "서구", "수성구", "중구", "달성군"],
        "인천광역시": ["계양구", "남동구", "동구", "미추홀구", "부평구", "서구", "연수구", "중구", "강화군", "옹진군"],
        "광주광역시": ["광산구", "남구", "동구", "북구", "서구"],
        "대전광역시": ["대덕구", "동구", "서구", "유성구", "중구"],
        "울산광역시": ["남구", "동구", "북구", "중구", "울주군"],
        "세종특별자치시": ["세종시"]
        // 나머지 시도 추가 가능
    ]
    
    private var selectedCity: String? {
        didSet {
            districtPicker.reloadAllComponents()
        }
    }
    
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
        
        let cityLabel = UILabel()
        cityLabel.text = "시/도"
        cityLabel.font = .systemFont(ofSize: 14)
        
        let districtLabel = UILabel()
        districtLabel.text = "구/군"
        districtLabel.font = .systemFont(ofSize: 14)
        
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
        
        employeeLabel.snp.makeConstraints { make in
            make.top.equalTo(salesTextField.snp.bottom).offset(20)
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
    
    @objc private func submit() {
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

extension RegisterViewController: UIScrollViewDelegate {
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
}

