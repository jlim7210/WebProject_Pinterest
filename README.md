# WebProject_Pinterest
My first personal web project. Reference to Pinterest

### 임재준 개인 웹 프로젝트

프로젝트명: 핀테레스트 모방 이미지 게시판  
제작기간: 2021년 1월 6일 ~  
수행인원: 1명  
프로젝트 목표: 핀테레스트 사이트를 모방한 게시판을 만들어 이하의 개발 도구/기술에 익숙해지는 것  
개발도구: STS4를 이용하여 Spring Boot 프로젝트 생성. MySQL WorkBench  
사용기술:  
  * 백엔드: Java, MySQL, MyBatis, Tomcat, Websocket  
  * 프론트엔드: BootStrap, Thymeleaf, AJAX, JQuery, JavaScript, CSS, HTML  
  
  
구현된 기능: 회원가입, 로그인, 유저관리, 게시글 조회/등록/수정/삭제 (파일 업로드 포함), 댓글 조회/등록/삭제, 실시간 채팅  
앞으로 구현할 기능: 댓글 수정, 게시물 검색, 암호화(Spring Security 사용), 구글 드라이브 연동을 통한 파일 관리, AWS 사용  



***
느낀점:  
  * DB에 저장된 정보가 모두 지워진 적이 있어 백업의 중요성을 다시 깨닫게 되었다.  
  * 프로젝트 초기에 설계한 내용과 중간 결과물에 많은 차이가 있었다. 초기 설계가 구체적이지 못했기 때문에 개발 도중 사양변경이 잦았다. 주요 변경점은 아래와 같다.  
    1. 유효성 검사가 프론트에서는 기능하지만 백엔드에서는 제한적으로 기능하는 점.  
    1. 게시물과 파일 업로드가 각기 다른 Controller, VO, BL이 적용된 점.  
    1. JSTL/EL로 개발하던 프론트를 갈아엎고 Thymeleaf로 변경한 점.  
  * 문제해결에 많은 시간을 쏟았고 직면했던 문제들이 모두 좋은 공부가 되었다는 것을 느꼈다.  
  * 새로운 기술/접근에 대해 두려움을 줄일 수 있었다. 특히 Thymeleaf 도입 시점에서 기존에 사용하던 기술을 버리고 새 기술에 적응할 때 많이 느꼈다.  
  * 추상화가 미흡해 같거나 비슷한 로직을 찾아해매느라 개발시간을 많이 낭비했다. 위에서 언급한 설계의 미흡함이 크다고 생각한다.  
