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
                title: "2024년 하반기 중소기업 대출 지원 소식",
                summary: "💼종로에서 중소기업을 위한 저금리 융자 지원 계획 발표!",
                keywords: ["#종로구", "#중소기업", "#소상공인", "#융자지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15))!,
                isRead: false
            ),
            HomeItem(
                id: 2,
                title: "2024년 하반기 종로구 중소기업 대출 지원 안내",
                summary: "💼종로에서 중소기업을 위한 저금리 융자 지원 계획 발표!",
                keywords: ["#종로구", "#중소기업", "#소상공인", "#융자지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 6, day: 15))!,
                isRead: false
            ),
            HomeItem(
                id: 1,
                title: "2024년 하반기 중소기업 대출 지원 소식",
                summary: "💼종로에서 중소기업을 위한 저금리 융자 지원 계획 발표!",
                keywords: ["#종로구", "#중소기업", "#소상공인", "#융자지원"],
                date: Calendar.current.date(from: DateComponents(year: 2024, month: 11, day: 1))!,
                isRead: false
            )
        ]
    }
    
    static func markdown(_ id: Int) -> String {
        switch (id) {
        case 1:
            return """
**2024년 하반기 중소기업 대출 지원 소식**

서울 종로구에서 중소기업을 위한 저금리 융자 지원 계획을 발표했어요 💼. 종로구에 사업체를 운영 중이라면 이번 기회를 노려볼 만한데요. **지원 대상, 혜택, 신청 방법을 간단히 정리해드릴게요.**

### **지원 내용 한눈에 보기**

- **지원대상 🎯:** 종로구 내 사업체로 매출 증빙이 가능한 중소기업자, 창업보육센터 입주자, 소상공인 등
- **융자규모 💰:** 총 15억 7천 6백만 원, 업체당 최대 6천만 원까지 지원
    - **부동산 담보**: 6천만 원 이내
    - **보증서 담보**: 종로구 거주자 5천만 원 이내, 비거주자 3천만 원 이내
- **자금용도 🛠️:** 시설·운전자금, 기술개발자금 등
- **대출조건 📉:** 고정금리 1.5%, 1년 거치 후 4년 동안 균등분할 상환

**신청방법**

- **부동산 담보**: 우리은행 종로구청지점 방문 접수
- **보증서 담보**: 서울신용보증재단 종로지점 상담 후, 우리은행 종로구청지점 방문 접수

📞 **문의**: 종로구청 지역경제과 소상공인지원팀 (02-2148-2252~3)

### 혜택 받는 법 !

종로구청 지역경제과에 전화로 문의한 후, 우리은행 종로구청지점에서 신청해 보세요!
"""
        case 2:
            return """
**2024년 하반기 중소기업 대출 지원 소식**

서울 종로구에서 중소기업을 위한 저금리 융자 지원 계획을 발표했어요 💼. 종로구에 사업체를 운영 중이라면 이번 기회를 노려볼 만한데요. **지원 대상, 혜택, 신청 방법을 간단히 정리해드릴게요.**

### **지원 내용 한눈에 보기**

- **지원대상 🎯:** 종로구 내 사업체로 매출 증빙이 가능한 중소기업자, 창업보육센터 입주자, 소상공인 등
- **융자규모 💰:** 총 15억 7천 6백만 원, 업체당 최대 6천만 원까지 지원
    - **부동산 담보**: 6천만 원 이내
    - **보증서 담보**: 종로구 거주자 5천만 원 이내, 비거주자 3천만 원 이내
- **자금용도 🛠️:** 시설·운전자금, 기술개발자금 등
- **대출조건 📉:** 고정금리 1.5%, 1년 거치 후 4년 동안 균등분할 상환

**신청방법**

- **부동산 담보**: 우리은행 종로구청지점 방문 접수
- **보증서 담보**: 서울신용보증재단 종로지점 상담 후, 우리은행 종로구청지점 방문 접수

📞 **문의**: 종로구청 지역경제과 소상공인지원팀 (02-2148-2252~3)

### 혜택 받는 법 !

종로구청 지역경제과에 전화로 문의한 후, 우리은행 종로구청지점에서 신청해 보세요!
"""
        case 3:
            return """
**2024년 하반기 중소기업 대출 지원 소식**

서울 종로구에서 중소기업을 위한 저금리 융자 지원 계획을 발표했어요 💼. 종로구에 사업체를 운영 중이라면 이번 기회를 노려볼 만한데요. **지원 대상, 혜택, 신청 방법을 간단히 정리해드릴게요.**

### **지원 내용 한눈에 보기**

- **지원대상 🎯:** 종로구 내 사업체로 매출 증빙이 가능한 중소기업자, 창업보육센터 입주자, 소상공인 등
- **융자규모 💰:** 총 15억 7천 6백만 원, 업체당 최대 6천만 원까지 지원
    - **부동산 담보**: 6천만 원 이내
    - **보증서 담보**: 종로구 거주자 5천만 원 이내, 비거주자 3천만 원 이내
- **자금용도 🛠️:** 시설·운전자금, 기술개발자금 등
- **대출조건 📉:** 고정금리 1.5%, 1년 거치 후 4년 동안 균등분할 상환

**신청방법**

- **부동산 담보**: 우리은행 종로구청지점 방문 접수
- **보증서 담보**: 서울신용보증재단 종로지점 상담 후, 우리은행 종로구청지점 방문 접수

📞 **문의**: 종로구청 지역경제과 소상공인지원팀 (02-2148-2252~3)

### 혜택 받는 법 !

종로구청 지역경제과에 전화로 문의한 후, 우리은행 종로구청지점에서 신청해 보세요!
"""
        default:
            return ""
        }
    }
}
