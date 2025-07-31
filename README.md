☕ JavaPresso 2차 파일럿 프로젝트
웹 기반 카페 통합 관리 시스템
📚 목차
📌 프로젝트 소개

👨‍👩‍👧‍👦 팀원

⚙️ 기술 스택

🧱 시스템 아키텍처

💡 주요 기능

🎨 UI 설계 및 개선

🐳 배포 및 실행 환경

🔐 실행 계정 정보

📸 스크린샷

📌 프로젝트 소개
JavaPresso는 카페 운영을 위한 직원, 메뉴, 주문 관리 기능을 통합한 웹 기반 관리 시스템입니다.
1차 CLI 프로젝트 구조를 유지하면서도 웹 환경에 최적화된 UI/UX와 기능 확장성을 더했습니다.

👨‍👩‍👧‍👦 팀원
최윤성
고경준	
김이슬	

⚙️ 기술 스택
Frontend
JSP · HTML · CSS · JavaScript

Backend
Servlet · JDBC · DAO 패턴

Database
Oracle DB

서버 환경
Tomcat 9 · Docker

기타 기술
JSTL · DBCP(Connection Pool) · i18n 국제화 · MVC 구조

🧱 시스템 아키텍처
text
복사
편집
Client
  ↓
DispatcherServlet (Controller)
  ↓
Handler → DAO → Oracle DB
  ↓
        JSP (View)
MVC 패턴 기반 웹 애플리케이션

DispatcherServlet을 통한 요청 분기 및 권한 제어

DAO-DTO 구조 유지 + 웹 기능 확장

💡 주요 기능

🔐 로그인 및 권한 분기
사장 계정: 전체 시스템 접근 가능

직원 계정: 제한된 기능만 접근

URL 필터 및 메뉴 권한 검사로 제어

👥 직원 관리
등록 / 수정 / 삭제 / 조회

사장만 접근 가능

JSTL + JavaScript 활용한 동적 폼 처리

📋 메뉴 관리
카테고리별 메뉴 등록/수정/삭제

재고 및 가격 관리

모든 계정 접근 가능

🛒 주문 관리
메뉴 → 옵션 선택 → 주문 등록

주문 내역 조회 / 1시간 내 주문 취소

포인트 적립 및 쿠폰 시스템

모달창 및 이미지 기반 사용자 안내

🎨 UI 설계 및 개선
Figma 기반 디자인 설계
공통 레이아웃 분리 (Header, Sidebar 등)
다국어 지원 (한국어/영어)
반응형을 고려한 크로스브라우징 호환성 개선

🐳 배포 및 실행 환경
✅ Docker 기반 Tomcat 9 서버 환경
✅ VirtualBox + Linux 개발 환경
✅ WAR 파일 배포 방식
✅ Connection Pool로 DB 연결 최적화


🔐 실행 계정 정보
권한	ID	PW
사장	owner001	admin1234
직원	emp001	1234

