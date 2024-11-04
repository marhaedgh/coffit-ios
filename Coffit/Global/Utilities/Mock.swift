//
//  Mock.swift
//  Coffit
//
//  Created by danna.x-PC on 10/21/24.
//

import Foundation

class Mock {
    static func homeItem() -> [HomeItem] {
        return [
            HomeItem(
                id: 1,
                title: "숙박업소 위생 등급제 도입",
                summary: "숙박업소의 위생 수준을 평가하여 등급을 부여하는 새로운 제도가 시행돼요 ✏️",
                keywords: ["#숙박업소", "#위생등급", "#제도"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 1))!,
                isRead: false
            ),
            HomeItem(
                id: 2,
                title: "친환경 숙박시설 인증 프로그램 시작",
                summary: "환경을 고려한 숙박시설에 대한 인증 프로그램과 그에 따른 혜택이 출시됩니다 🌿",
                keywords: ["#친환경", "#숙박시설", "#인증"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 20))!,
                isRead: false
            ),
            HomeItem(
                id: 3,
                title: "2024년 2차 통일형 예비사회적기업 지정 공고",
                summary: "북한이탈주민 고용을 고려하는 기업에게 사회적기업으로 지정받을 수 있는 기회가 열렸어요!",
                keywords: ["#통일형사회적기업", "#북한이탈주민", "#사회적목적"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 10, day: 17))!,
                isRead: false
            ),
            HomeItem(
                id: 4,
                title: "외국인 관광객 대상 할인 행사 참여기업 모집",
                summary: "외국인 관광객을 대상으로 다양한 할인 혜택을 제공하는 '코리아그랜드세일'이 열립니다 🎉",
                keywords: ["#관광", "#숙박", "#외국인", "#홍보지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 4))!,
                isRead: false
            ),
            HomeItem(
                id: 5,
                title: "숙박업 종사자 안전 교육 강화",
                summary: "(매우 중요) 숙박업 종사자를 대상으로 한 필수 안전 교육이 강화됩니다‼️",
                keywords: ["#숙박업", "#안전교육", "#종사자"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 9, day: 1))!,
                isRead: false
            ),
            HomeItem(
                id: 6,
                title: "소규모 숙박업체 지원 프로그램 확대",
                summary: "소규모 숙박업체를 위한 정부 지원이 확대돼요!",
                keywords: ["#소규모숙박업체", "#정부지원", "#프로그램"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 8, day: 10))!,
                isRead: false
            ),
            HomeItem(
                id: 7,
                title: "숙박업소 디지털 전환 지원",
                summary: "키오스크 지금이 기회! 숙박업소의 디지털 전환을 돕기 위한 지원이 제공됩니다. 💻",
                keywords: ["#디지털전환", "#숙박업소", "#지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 7, day: 25))!,
                isRead: false
            ),
            HomeItem(
                id: 8,
                title: "숙박업 세제 혜택 확대",
                summary: "숙박업체를 위한 세제 혜택이 확대됩니다‼️ 잊지 말고 받아보세요!",
                keywords: ["#세제혜택", "#숙박업", "#확대"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 30))!,
                isRead: false
            ),
            HomeItem(
                id: 9,
                title: "청년 창업 숙박업체 지원 사업",
                summary: "청년 사장님들! 청년 창업자들을 위한 숙박업체 지원 사업이 시작됩니다. 🚀",
                keywords: ["#청년창업", "#숙박업체", "#지원사업"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 18))!,
                isRead: false
            ),
            HomeItem(
                id: 10,
                title: "스마트 숙박 솔루션 도입 지원",
                summary: "스마트 기술을 활용한 숙박 솔루션 도입을 지원합니다",
                keywords: ["#스마트기술", "#숙박솔루션", "#도입지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 4, day: 12))!,
                isRead: false
            ),
            HomeItem(
                id: 11,
                title: "서울특별시 사회적경제계정 융자 지원",
                summary: "서울시가 중소기업육성기금으로 사회적경제기업을 위한 저금리 3억 융자 지원을 진행해요 💼",
                keywords: ["#서울시", "#사회적경제기업", "#저금리대출", "#최대3억원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 14))!,
                isRead: false
            ),
            HomeItem(
                id: 12,
                title: "숙박업소 안전 점검 강화",
                summary: "숙박업소에 대한 안전 점검이 강화됩니다. 🛠️",
                keywords: ["#안전점검", "#숙박업소", "#강화"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 3, day: 5))!,
                isRead: false
            ),
            HomeItem(
                id: 13,
                title: "관광 숙박업체 홍보 지원",
                summary: "우리 숙소도 이제 글로벌하게! 외국인 관광객을 대상으로 숙박업체의 홍보를 지원합니다. 🇰🇷",
                keywords: ["#관광", "#숙박업체", "#홍보지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 2, day: 28))!,
                isRead: false
            )
        ]
    }
    
    static func markdown(_ id: Int) -> String {
        switch (id) {
        case 3:
            return """
북한이탈주민과 지역사회를 위한 사회적기업 지정 기회가 열렸습니다!
이 공고는 사회적기업으로서 사회적 가치를 창출하고자 하는 기업들에게 지정 요건과 지원을 안내해요. 

지원 자격과 요건을 간단히 정리해드릴게요 📋

### 주요 내용 요약

- **지정 대상 🎯:** 「사회적기업 육성법」에 따른 법인, 조합 등 (예: 민법, 상법, 공익법인 등 다양한 법적 조직 형태 포함)
- **사회적 목적 🧩:** 북한이탈주민 고용, 지역주민 삶의 질 향상 등 사회적 목적을 주된 목표로 할 것 (정관에 명시)
- **고용 요건 🏢:** 유급근로자 고용, 취약계층 30% 이상 고용 필요 (북한이탈주민 포함)
- **영업 활동 💼:** 재화 및 서비스 생산·판매를 통한 사업 운영이 이루어질 것
- **이윤 사용 📈:** 연간 이익의 2/3 이상을 사회적 목적을 위해 사용하고, 잔여재산은 사회적 목적 기금 등으로 기부

### 신청 방법

- **신청**: 사회적기업 포털 내 통합사업관리시스템(www.seis.or.kr)에서 온라인 접수
- **문의처**: 한국사회적기업진흥원 통합센터 (☎️ 1551-2024) 및 북한이탈주민지원재단 일자리지원부 (☎️ 02-3215-5776)

### 혜택 받는 법

사회적기업 포털에서 통합사업관리시스템을 통해 신청하세요!
"""
        case 4:
            return """
(재)한국방문의해위원회가 외국인 관광객을 위해 열리는 '코리아그랜드세일'에 참여할 기업을 모집하고 있어요!
쇼핑, 숙박, 식음료, 엔터테인먼트 등 다양한 분야에서 관광객들에게 특별한 혜택을 제공할 수 있어요 🛍️✨

### **참여 혜택**

- **홍보 마케팅 지원 📢:** 코리아그랜드세일 공식 로고와 행사 키비주얼 활용
- **온라인 홍보 💻:** 통합 온라인 플랫폼 및 공식 SNS에서 혜택 홍보
- **해외 광고 🎯:** 글로벌 포털 사이트와 주요 타깃 국가를 통한 해외 광고 지원
- **웰컴센터 홍보 🏢:** 주요 방문지역에 있는 웰컴센터를 통한 혜택 소개
- **글로벌 마케팅 교육 📈:** 참가 기업을 위한 교육 기회 제공
- **우수 기업 시상 🏆:** 행사 종료 후 심사를 통해 우수 참여기업 선발 및 시상

### 신청 방법

- **신청 사이트:** [recruit.koreagrandsale.co.kr](https://recruit.koreagrandsale.co.kr/)에서 참여 신청
- **문의:** 2025 코리아그랜드세일 운영사무국 (kgs_official@naver.com)

### 혜택 받는 법

참여를 희망하는 기업은 2024년 11월 15일까지 신청하세요!
"""
        case 11:
            return """
서울시에서 사회적경제기업을 위한 저금리 융자 지원 계획을 발표했어요! 
사회적경제기업, 소셜벤처 등이 운영 자금을 저리로 지원받을 수 있는 좋은 기회예요.

### **지원 내용 요약**

- **지원 대상 🎯:** 서울시 소재 중소기업(사회적경제기업, 소셜벤처 등)
- **대출 한도 💰:** 업체당 최대 3억 원
- **대출 금리 📉:** 연 2% (신용보증서 발급 수수료 별도)
- **상환 조건 📆:** 1년 거치 후 4년간 원금균등 분할상환

### 신청 방법

- **모바일 신청:** 서울신용보증재단 모바일앱
- **방문 신청:** 서울신용보증재단 홈페이지에서 지점 방문 예약 후 신청

📞 **문의:** 서울신용보증재단 고객센터(☎️1577-6119), 서울특별시청 공정경제담당관(☎️02-2133-5490)

### 혜택 받는 법

서울신용보증재단 앱이나 홈페이지에서 예약 후 신청하세요!
"""
        default:
            return ""
        }
    }
}
