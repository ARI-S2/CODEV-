<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채용 공고 상세</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/template.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="https://unpkg.com/vue@3"></script>
<!-- axios : JavaScript에서 사용되는 HTTP 클라이언트 라이브러리로, 비동기적으로 서버와 통신하며 데이터 입·출력 시 사용 -->
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../js/setting.js"></script>
<script src="../js/common.js"></script>
<script src="../js/template.js"></script>
<script src="../js/script.js"></script>
<script src="../recruitment/js/template.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<body>
  <section id="recruitmentDetail" class="sub">
    <div class="content-container" id="recruitmentDetailApp">
      <div class="container-md">
        <div class="content-desc">
          <div class="recruit-top">
            <div class="recruit-info">
              <a :href="'company_detail.do?rno='+ rno+'&cno='+ cno" class="company-info">
                <figure class="company-logo">
                  <img class="width-100" :src="company_detail.logo" :title="company_detail.name">
                </figure>
                <h3 class="company-name">{{company_detail.name}}</h3>
              </a>
              <h2 class="recruit-tit">{{recruit_detail.title}}</h2>
            </div>
            <!-- <button type="button" id="recruitApplyBtnTop" class="recruit-btn recruit-apply-btn" @click="apply(rno)">지원하기</button> -->
            <div class="recruit-btn-wrapper">
	            <button type="button" id="recruitUpdateBtn" class="recruit-btn" value="수정" @click="update(rno)">수정</button>
	            <button type="button" id="recruitDeleteBtn" class="recruit-btn" value="삭제" @click="delete(rno)">삭제</button>
            </div>
          </div>
        </div>

        <div class="recruit-detail">
          <div class="recruit-btn-wrapper">
            <button type="button" id="recruitLikeBtn" class="recruit-btn">
              <span class="recruit-like-count">{{recruit_detail.like_count}}</span>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4847/4847183.png" alt="관심 공고 추가">
              </figure>
            </button>
            <button type="button" id="recruitShareBtn" class="recruit-btn" @click="share()">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54628.png" alt="채용 공고 공유">
              </figure>
            </button>
          </div>
          <ul class="recruit-detail-card">
            <li>
              <h4>근무 지역</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5355/5355077.png" alt="근무 지역">
              </figure>
              <span class="emph">{{company_detail?.address&&getAddressPart(company_detail.address)}}</span>
            </li>
            <li>
            <h4>경력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력 조건">
              </figure>
              <span class="emph">{{recruit_detail.career}}</span>
            </li>
            <li>
              <h4>학력 조건</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/763/763279.png" alt="학력 조건">
              </figure>
              <span class="emph">{{recruit_detail.education}}</span>
            </li>
          </ul>
          <div class="recruit-stack">
            <h4>기술 스택</h4>
            <ul class="recruit-stack-list" v-if="recruit_detail.stack_img && recruit_detail.stack_txt">
              <li v-for="(stackImage, index) in recruit_detail.stack_img.split('|')" :key="index">
                <figure class="recruit-stack-icon">
                  <img class="width-100" :src="stackImage" alt="기술스택">
                </figure>
                <span class="emph">{{recruit_detail.stack_txt.split('|')[index]}}</span>
              </li>
            </ul>
          </div>
          <div class="recruit-detail-info">
          	<ul>
          		<li class="recruit_content_j">
          			<h5>주요 업무</h5>
          			<pre>{{recruit_detail.content_j}}</pre>
          		</li>
          		<li class="recruit_content_q">
          			<h5>자격 요건</h5>
          			<pre>{{recruit_detail.content_q}}</pre>
          		</li>
          		<li class="recruit_content_p">
          			<h5>우대 사항</h5>
          			<pre>{{recruit_detail.content_p}}</pre>
          		</li>
          		<li class="recruit_content_b">
          			<h5>복지 및 혜택</h5>
          			<pre>{{recruit_detail.content_b}}</pre>
          		</li>
          	</ul>
            
            <div class="recruit-date">
              <h4>마감일</h4>
              <div>
                <span class="recruit-icon">
                  <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/8895/8895471.png" alt="마감일">
                </span>
                {{recruit_detail.end_date}}
              </div>
            </div>
          </div>
        </div>
        <div class="company-detail">
          <div class="company-detail-info">
            <a :href="'company_detail.do?rno='+ rno+'&cno='+ cno" class="company-info">
              <figure class="company-logo">
                <img class="width-100" :src="company_detail.logo" alt="기업 로고">
              </figure>
              <h4 class="company-name">{{company_detail.name}}</h4>
            </a>
            <button type="button" id="companyLikeBtn" class="recruit-btn">
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/7794/7794674.png" alt="관심 기업 추가">
              </figure>
            </button>
          </div>
          <ul class="company-contact">
          	<li>
          	<h4>채용 담당자</h4>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/107/107778.png" alt="전화번호">
              </figure>
              <span class="company-phone">{{company_detail.phone}}</span>
            </li>
            <!-- <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5410/5410449.png" alt="홈페이지">
              </figure>
              <span class="company-homepage">http://www.woowahan.com</span>
            </li>
            <li>
              <figure class="recruit-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54290.png" alt="이메일">
              </figure>
              <span class="company-email">woowahan.com</span>
            </li> -->
          </ul>
        </div>
        <div class="company-map">
          <div id="map" style="width:100%; height:480px;"></div>
          <p class="company-address">
            <span class="recruit-icon">
              <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/2948/2948111.png" alt="기업 주소">
            </span>
            {{company_detail.address}}
          </p>
        </div>
        <button type="button" id="recruitApplyBtnBottom" class="recruit-btn recruit-apply-btn">지원하기</button>
      </div>
      <!-- <div id="dialog" title="지원하기 창">
	      <apply-data v-bind:apply="apply">
	      </apply-data>
	    </div> -->
	    <section id="applyForm" class="th-layout-sub">
	      <div class="content-container">
	        <h2>지원하기</h2>
	        <form method="post" action="../recruitment">
	          <!-- <h3>지원 정보</h3> -->
	          <ul class="apply-info">
	            <li class="company-info">
	              <figure class="company-logo">
	                <img class="width-100" :src="company_detail.logo" :title="company_detail.name">
	              </figure>
	              <span class="company-name">{{company_detail.name}}</span>
	            </li>
	            <li class="recruit-info">
	              <span class="recruit-tit">{{recruit_detail.title}}</span>
	            </li>
	            <li class="user-info">
                <h4>이름</h4>
                <span class="userName">심청이</span>     
	            </li>
	            <li class="user-info">
                <h4>성별</h4>
                <span class="gender">여성</span>             
              </li>
              <li class="user-info">
                <h4>나이</h4>
                <span class="age">27세</span>         
              </li>
	            
	            <!-- <li>
	              <input type="text" name="age" id="age" class="apply-input" readonly>
	              <input type="text" name="userName" id="userName" v-model="userName" class="apply-input" readonly>
	              <input type="text" name="gender" id="gender" v-model="gender" class="apply-input" readonly>
	            </li> -->
	            
	            <li class="user-info">
	              <h4>연락처</h4>
	              <span class="phone">010-1234-5678</span>
	              <!-- <input type="text" name="phone" id="phone" v-model="phone" class="apply-input" readonly> -->
	            </li>
	            <li class="user-info">
	              <h4>이메일</h4>
	              <span class="email">shim02@codev.com</span>
	              <!-- <input type="text" name="email" id="email" v-model="email" class="apply-input" readonly> -->
	            </li>
	          </ul>
	          <div class="apply-file">
	            <h3>지원서 첨부</h3>
	            <input type="file" name="file" id="file" class="apply-input">
	            <span class="apply-alert">제출할 지원서 파일을 업로드 해 주세요.</span>
	          </div>
	          <div class="apply-btn-wrapper">
	            <button type="submit" id="applySubmitBtn" class="apply-btn" value="지원하기">지원하기</button>
	            <button type="button" id="applyCancelBtn" class="apply-btn" value="취소">취소</button>
	          </div>
	        </form>
	      </div>
	    </section>
    </div>
  </section>
<script>
$(function(){
    $(".recruit-apply-btn").click(function() {
      $("#applyForm").show();
    });
    
    $("#applyCancelBtn").click(function() {
      $("#applyForm").hide();
    });
})

const apply={
	props:['apply'],
  template:``
}

let recruitmentDetailApp=Vue.createApp({
	data(){
		return{
			//  Vue 인스턴스의 데이터로 정의
			recruit_detail:{},
			company_detail:{},
			rno:${rno},
			cno:${cno},
			isShow:false,
			userName:'',
			gender:'',
			email:'',
			phone:''
		}
	},
	mounted(){
		// 서버에 GET 요청을 보내고, 서버에서 받은 JSON 데이터를 처리
		axios.get('../recruitment/recruit_detail_vue.do', {
			// recruit_detail_vue 엔드포인트에 rno과 cno를 파라미터로 넘김
			params:{
				rno:this.rno,
				cno:this.cno
			}
		}).then(response=>{
			// 받아온 데이터는 response.data에 담겨 있음
			console.log(response.data)
			// Vue 인스턴스의 데이터(recruit_detail과 company_detail)를 업데이트
			this.recruit_detail=response.data.rvo
			this.company_detail=response.data.cvo
			// recruit_detail과 company_detail은 Vue.js의 data 속성에 정의된 객체입니다. 서버에서 받은 JSON 데이터를 이 객체에 할당함으로써 동적인 UI를 구현
			this.addScript();
		})
	},
	methods:{
		addScript(){
			const script=document.createElement("script")
			  
			/*global kakao*/
			script.onload=()=>kakao.maps.load(this.initMap)
			script.src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=74c8ca8100e4e559f7de6e3bf17641b2&libraries=services"
			document.head.appendChild(script)
		},
		initMap(){
			var _this = this;
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  		    mapOption = {
  		    	center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
  		       	level: 3 // 지도의 확대 레벨
  		    };  

  			// 지도를 생성합니다    
  			var map = new kakao.maps.Map(mapContainer, mapOption); 

  			// 주소-좌표 변환 객체를 생성합니다
  			var geocoder = new kakao.maps.services.Geocoder();

  			// 주소로 좌표를 검색합니다
  			geocoder.addressSearch(_this.company_detail.address, function(result, status) {
  		    // 정상적으로 검색이 완료됐으면 
  		    if (status === kakao.maps.services.Status.OK) {
  		    	var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		        	map: map,
		            position: coords
		        });

		        // 인포윈도우로 장소에 대한 설명을 표시합니다
		        var infowindow = new kakao.maps.InfoWindow({
		            content: '<div style="width:150px; text-align:center; padding:6px 0;">'+_this.company_detail.name+'</div>'
		        });
		        infowindow.open(map, marker);

		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
  		    } 
			});    
		},
		getAddressPart(address) {
	    // 주소를 두 번째 공백을 기준으로 분할
	    const addressParts=address.split(' ')
	    // 두 번째 공백 이후의 부분을 지우고 첫 번째 부분만 반환
	    const area=addressParts.slice(0, 2).join(' ');
	    return area
		},	
		share(){
			const shareLink=window.location.href;
	      // 클립보드에 복사
	      const textarea=document.createElement('textarea');
	      textarea.value=shareLink;
	      document.body.appendChild(textarea);
	      textarea.select();
	      document.execCommand('copy');
	      document.body.removeChild(textarea);
	      alert('링크가 복사되었습니다!');
			},
			update(){
		    location.href="../recruitment/recruit_update.do?rno="+this.rno;
		  },
			goback(){
	    	location.href="../recruitment/reruit_list_vue.do"
	    }
	 },
	 /*apply() {
		 $('#applyForm').onClick().show()
      this.isShow=true
     let _this=this
     axios.get('../recruitment/recruit_detail_vue.do', {
       params:{
         rno:this.rno,
         cno:this.cno
       }
     }).then(function(response){
       console.log(response.data)
       _this.apply=response.data
       _this.isShow=true
       $('#dialog').dialog({
         autoOpen:false,
         modal:true
       }).dialog('open')
     }) 
   },*/
   submit(){
  	 axios.post('../recruitment/apply_insert_vue.do', null, {
  		 params:{
  			 userName:this.userName,
  			 gender:this.gender,
  			 phone:this.phone,
  			 email:this.email
  		 }
  	 }).then(response=>{
  		 if(response.data==='yes') {
  			 location.href="../recruitment/recruit.detail.do";
  		 } else {
  			 alert("response.data")
  		 }
  	 })
   }
	/* components:{
    'apply-data':apply
  	} */
}).mount('#recruitmentDetailApp');
</script>
</body>
</html>