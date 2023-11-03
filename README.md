# 멋쟁이 사자처럼 앱스쿨 3기 수업 프로젝트
**< 과제 내용 >**<br/>
List 뷰와 NavigationStack을 이용

- 각 행은 ***의 이미지와 텍스트 정보를 표시
- 리스트의 행을 선택하면 선택한 항목에 대한 상세 내용이 있는 상세화면으로 이동
- 리스트 항목을 추가/삭제/순서변경 옵션을 제공
- 사용자 인터페이스와 데이터 모델이 동기화되도록 상태 프로퍼티와 Observable 객체를 사용

## 12조 주제: 커피 메뉴 리스트와 커피 설명을 보여주는 앱

### Content View
|디자인|기능|
|:-|:-|
|리스트 이미지(원형으로)|메뉴 추가|
|메뉴 이름|메뉴 삭제|
|페이지 제목|메뉴 순서 편집|

### Detail View
|디자인|기능|
|:-|:-|
|상단: 메뉴 이미지||
|메뉴 제목과 설명||
|알레르기 유발 성분 정보||
|비슷한 다른 메뉴||

### Add View
|디자인|기능|
|:-|:-|
|상단: 메뉴 이미지(default 이미지)|Add 버튼 클릭시 Home 뷰로 이동|
|메뉴 이름(TextField)||
|메뉴 설명(TextField)||
|알레르기 유발요인(Toggle)||
