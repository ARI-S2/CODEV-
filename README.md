# CODEV
![KakaoTalk_20241104_170008757](https://github.com/user-attachments/assets/3ac6b807-ec8f-45fd-9f37-c15e2a408069)

>  쌍용교육센터 2차 팀 프로젝트
> 
> 2024.2. – 2024.3. (2개월)

<br>

## 📝 프로젝트 개요
함께 교육받는 학생들의 니즈를 충족하기 위해 개발자를 위한 통합 서비스를 기획했습니다. 관심 있는 직무나 기술을 선택하면 관련된 취업공고, 도서, 교육에 대한 다양한 기능을 제공합니다.

<br>

## 👨‍👨‍👦‍👦 팀원 구성
* 팀장 : 김연수
* 팀원1 : 김하영
* 팀원2 : 윤새영
* 팀원3 : 김선호

<br>

## ⚙️ 사용 기술
- `Maven`, `Java 14`, `Spring-Framework 5`, `Spring Security 5`
- `Oracle 21c`, `MyBatis`
- `Vue.js`, `JavaScript`
- `AWS EC2`

<br>

## 📌 담당 기능

### 1. 회원 관리
- 로그인, 회원가입, 회원정보 수정, 회원 탈퇴 기능
- Spring Security를 활용한 자동 로그인 및 보안 강화
- MailSender를 활용한 아이디/비밀번호 찾기, 인증번호 및 임시 비밀번호 전송

### 2. 멘토링 기능
- Vue.js를 이용한 멘토 CRUD
- Vue.js 기반 캘린더를 통한 멘토링 예약 시스템
- MyBatis 동적 쿼리를 활용한 다중 조건 검색 및 정렬 (검색 기준, 검색어, 직무) 
- 예약 내역 및 상세 예약 내역 확인
- 멘토 팔로우 

### 3. 전체 검색 및 필터링
- 기술 스택에 따른 전체 검색 (멘토링, 채용공고, 도서 통합 검색)

### 4. AWS EC2를 이용한 서버 배포

<br>

## 📌 그 외 팀원 담당 기능

###  5. 실시간 채팅 기능
- WebSocket을 이용한 회원 간의 실시간 채팅 
  
###  6. 스터디룸 기능
- Vue.js를 이용한 스터디룸 CRUD
- Vue.js 기반 캘린더를 통한 스터디룸 예약 시스템
- 다중 파일 업로드가 가능한 1:1 스터디룸 문의 게시판(관리자 답변 시 회원에게 자동 메일 전송)
- 스터디룸 다중 조건 검색 및 정렬
- 스터디룸 찜하기 

###  7. 도서 기능
- Vue.js를 이용한 도서 CRUD
- 도서 다중 조건 검색 및 정렬
- KakaoPay API를 활용한 도서 결제 
- 장바구니, 주문 내역 관리 
- 도서 리뷰 기능
  
###  8. 채용 정보 기능
- Vue.js를 이용한 채용공고 CRUD
- 채용 정보 다중 조건 검색 및 정렬
- KakaoMap API를 활용한 회사 위치 정보 제공
- 지원하기 기능 및 지원서(파일) 첨부 
- 채용공고 찜하기 

###  9. 관리자 기능
- 1:1 문의 답변 관리
- 예약 내역 관리

<br>

## 📊 Flowchart
![image](https://github.com/user-attachments/assets/91dff066-00a3-4de5-b863-6d6beccd53cd)

<br>

## 💾 DB 설계
![image](https://github.com/user-attachments/assets/fc3e5a88-158e-44f5-9009-eaff412edef9)

<br>

## 📋 담당 기능 요구사항 명세
<details>
<summary> 요구사항 명세 </summary>
<div markdown="1">

- 회원 관리

![슬라이드2](https://github.com/user-attachments/assets/dacdde2f-1b2e-48d5-b026-1b281259e540)
![슬라이드3](https://github.com/user-attachments/assets/158368a6-0f7e-4dd0-8c75-60d3b150e697)
![슬라이드3_1](https://github.com/user-attachments/assets/bf670fc2-e4d3-4ddd-b843-3c4f403c94d8)

- 멘토링

![슬라이드4](https://github.com/user-attachments/assets/62ec3035-da72-4d64-863d-840fb42fc632)
![슬라이드5](https://github.com/user-attachments/assets/1fe91ffa-4200-4db4-ac13-d5e8622658ee)
![슬라이드6](https://github.com/user-attachments/assets/cc510b21-991a-4fba-999d-7252a491885d)
![슬라이드7](https://github.com/user-attachments/assets/be3a3ae9-6d8a-42f7-888a-d9dff356c96c)
![슬라이드8](https://github.com/user-attachments/assets/663e9ea5-97e8-4f75-ad97-1fe70a537490)
![슬라이드9](https://github.com/user-attachments/assets/044f90a9-51cb-43ce-a0eb-956d1f50563c)

</div>
</details>

<br>

## 🖥️ 담당 기능 화면 설계
### [메인 페이지]
![슬라이드11](https://github.com/user-attachments/assets/51659c66-97a4-4768-8da3-1f097638c585)

![슬라이드12](https://github.com/user-attachments/assets/7b65843f-a1de-4a5b-9fe4-40657f34612c)

### [회원 관리 페이지]

![슬라이드13](https://github.com/user-attachments/assets/45c62c7e-6a91-4056-b1da-9201792e21e8)

### [멘토링 페이지]

![슬라이드14](https://github.com/user-attachments/assets/68ab0418-2c9d-46ac-8001-08cfef786266)

![슬라이드15](https://github.com/user-attachments/assets/8d9a8000-e955-49c5-b981-caa1ff3cea6d)

![슬라이드16](https://github.com/user-attachments/assets/da513e92-9c01-4e86-b151-d7e7ad969239)

![슬라이드17](https://github.com/user-attachments/assets/cd8c03a2-67aa-446e-97ed-48f8f26e6125)
