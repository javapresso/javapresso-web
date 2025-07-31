JavaPresso ☕ 2차 파일럿 프로젝트
웹 기반 카페 통합 관리 시스템

📌 프로젝트 소개
JavaPresso는 카페 운영을 위한 직원, 메뉴, 주문 관리 기능을 통합한 관리 시스템입니다.
1차 CLI 프로젝트의 구조를 기반으로, 웹 기반으로 확장하여 사용자 편의성과 시스템 효율성을 높였습니다.

🧑‍💻 팀원 및 역할
이름	역할
최윤성	DAO 설계 및 로그인/직원 관리 구현
고경준	인프라 구축 (Docker, Tomcat), DB 최적화
김이슬	UI/UX 설계 및 JSP 프론트 개발

⚙️ 기술 스택
Frontend: JSP, HTML, CSS, JavaScript

Backend: Servlet, JDBC, DAO 패턴

Database: Oracle

서버환경: Tomcat 9, Docker

기타: JSTL, DBCP(Connection Pool), 국제화(i18n), MVC 구조

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

URL 접근 제한 필터 및 메뉴 권한 검사

👤 직원 관리
등록, 수정, 삭제, 조회

사장만 접근 가능

JSTL + JavaScript 활용한 동적 폼 처리

📋 메뉴 관리
등록, 수정, 삭제, 카테고리별 메뉴 관리

재고/가격 관리

모든 계정 접근 가능

🛒 주문 관리
메뉴 선택 → 옵션 선택 → 주문 등록

주문 내역 조회 / 주문 취소 (1시간 이내)

포인트 적립 및 쿠폰 시스템

사용자 친화적 UI + 이미지 안내 + 모달창

🎨 UI 설계
Figma 기반 디자인

공통 레이아웃 분리(Header, Sidebar)

다국어 지원 (한국어, 영어)

반응형을 고려한 브라우저 호환성 개선

🐳 배포 및 실행 환경
Tomcat 9 + Docker 환경에서 실행

VirtualBox + Linux 환경 구축

WAR 파일 배포 방식

🔍 실행 계정
계정	ID	PW
사장	owner001	admin1234
직원	emp001	1234


