<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 상세 정보</title>
<link rel="stylesheet" href="../css/setting.css">
<link rel="stylesheet" href="../css/plugin.css">
<link rel="stylesheet" href="../css/common.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../recruitment/css/recruitment.css">
<script src="../js/setting.js"></script>
<script src="../js/plugin.js"></script>
<script src="../js/template.js"></script>
<script src="../js/common.js"></script>
<script src="../recruitment/js/script.js"></script>
<script src="../recruitment/js/template.js"></script>
<script src="https://unpkg.com/vue@3"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script> <!-- axios : 전송 객체 => 데이터 입·출력 시 사용 -->
</head>
<body>
  <section id="recruitmentCompany" class="sub companyDetailApp">
    <div class="content-container" id="">
      <div class="container-md">
        <div class="company-top">
          <div class="company-info">
            <figure class="company-logo">
              <img class="width-100" :src="company_detail.logo" alt="기업 로고">
            </figure>
            <h2 class="company-name">{{company_detail.name}}</h2>
            <p>{{company_detail.type}}</p>
          </div>
          <div class="company-btn-wrapper">
            <button type="button" id="companyLikeBtn" class="company-btn">
              <span class="company-like-count">{{company_detail.like_count}}</span>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/7794/7794674.png" alt="관심 기업 추가">
              </figure>
            </button>
            <button type="button" id="companyShareBtn" class="company-btn">
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/54/54628.png" alt="기업 정보 공유">
              </figure>
            </button>
          </div>  
        </div>
        <div class="company-detail">
          <ul class="company-detail-box">
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/468/468634.png" alt="업력">
              </figure>
              <span>업력 </span><span class="emph">{{company_detail.year}}년차</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5956/5956860.png" alt="기업 형태">
              </figure>
              <span class="emph">{{company_detail.scale}}</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/5957/5957004.png" alt="사원 수">
              </figure>
              <span>사원 </span><span class="emph">{{company_detail.worker}}명</span>
            </li>
            <li>
              <figure class="company-icon">
                <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4549/4549418.png" alt="매출액">
              </figure>
              <span>매출 </span><span class="emph">{{company_detail.sales}}억</span>
            </li>
          </ul>
          <ul class="company-detail-info">
            <li>
              <span>주소</span>
              <span class="emph">{{company_detail.address}}</span>
            </li>
            <!-- <li>
              <span>홈페이지</span>
              <span class="emph">http://www.woowahan.com</span>
            </li> -->
            <li>
              <span>전화번호</span>
              <span class="emph">{{company_detail.phone}}</span>
            </li>
            <!-- <li>
              <span>이메일</span>
              <span class="emph">woowahan.com</span>
            </li> -->
          </ul>
          <div class="company-detail-intro">
            <h3>기업 소개</h3>
            <figure class="company-img">
              <img class="width-100" src="company_detail.img" alt="기업 이미지">
            </figure>
            <p class="company-content">{{company_detail.content}}</p>
          </div>
        </div>
      </div>
      <!-- [S]opilsol-N24 -->
    <div class="opilsol-N24" data-bid="UzLsBKVg3P">
      <div class="content-container">
        <div class="container-md">
          <div class="contents-top">
            <h3 class="contents-tit">채용 공고</h3>
            <!-- <p class="contents-text">총 <span class="emph">11</span>건</p> -->
          </div>
          <div class="tableset">
            <div class="tableset-inner">
              <table class="tableset-table table">
                <!-- <colgroup>
                  <col>
                  <col>
                  <col>
                </colgroup> -->
                <!-- <thead class="thead-border-top">
                  <tr>
                    <th class="number" scope="col">NO</th>
                    <th scope="col">제목</th>
                    <th class="last-child" scope="col">채용 기간</th>
                  </tr>
                </thead> -->
                <tbody>
                  <tr v-for="rvo in recruit_list">
                    <td class="recruit-tit">
                      <a :href="'recruit_detail.do?no='+rvo.no+'&cno='+rvo.cno">{{rvo.title}}</a>
                    </td>
                    <td class="recruit-area">{{rvo.address}}</td>
                    <td class="recruit-career">{{rvo.career}}</td>
                    <td class="recruit-academic">{{rvo.education}}</td>
                    <td class="recruit-date">~ {{rvo.end_date}}</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <!-- <nav class="pagiset pagiset-circ">
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div>
            <div class="pagiset-ctrl" v-if="startPage>1">
              <a class="pagiset-link pagiset-prev" @click="prev()">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list" v-for="i in range(startPage, endPage)">
              <a :class="'pagiset-link ' + (i==curpage?'active-fill':'')" @click="pageChange(i)">{{i}}</a>
            </div>
            <div class="pagiset-ctrl" v-if="endPage<totalpage">
              <a class="pagiset-link pagiset-next" @click="next()">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div>
          </nav> -->
        </div>
      </div>
    </div>
    <!-- [E]opilsol-N24 -->

    <!-- [S]glamping-N40 -->
    <div class="glamping-N40" data-bid="UDlsBl0l6L">
      <div class="contents-inner">
        <div class="contents-container container-md">
          <div class="contents-top">
            <h3 class="contents-tit">면접 후기</h3>
            <button type="button" id="reviewInsertBtn" class="review-btn" value="작성하기">작성하기</button>
            <!-- <p class="contents-text">총 <span class="emph">13</span>건</p> -->
          </div>
          <!-- <div class="contents-top">
            <div class="inputset inputset-border-bottom">
              <button class="inputset-icon icon-right icon-search btn" type="button" aria-label="아이콘"></button>
              <input type="text" class="inputset-input form-control" placeholder="내용을 입력하세요" aria-label="내용">
            </div>
          </div> -->
          <div class="accordset accordset-plus">
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="review-tit">면접 후기 제목1<br>
                    <span class="review-date">2024-02-14</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="review-icon-wrapper">
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">신입</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">긍정적</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">보통</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">합격</span>
                    </li>
                  </ul>
                  <p class="review-content">지원자와 2명과 면접관 2명이 면접을 진행합니다. 각 면접관 님이 간단한 아이스브레이킹을 시작으로 인성과 직무경험을 순서대로 질문하시며, 지원자 역시 각자의 정해진 순서대로 답변을 진행합니다. 편안한 분위기에서 면접자가 자유롭게 본인의 생각을 말할 수 있게 해주십니다. 최대한 긴장하지 않고 질문 의도를 잘 파악하여 답변하시고, 답변에 대한 확실한 근거(본인의 경험, 이론적 지식 등)를 말해주시면 좋을 거 같습니다.</p>
                </div>
              </div>
            </div>
            
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="review-tit">면접 후기 제목1<br>
                    <span class="review-date">2024-02-14</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="review-icon-wrapper">
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">신입</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">긍정적</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">보통</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">합격</span>
                    </li>
                  </ul>
                  <p class="review-content">지원자와 2명과 면접관 2명이 면접을 진행합니다. 각 면접관 님이 간단한 아이스브레이킹을 시작으로 인성과 직무경험을 순서대로 질문하시며, 지원자 역시 각자의 정해진 순서대로 답변을 진행합니다. 편안한 분위기에서 면접자가 자유롭게 본인의 생각을 말할 수 있게 해주십니다. 최대한 긴장하지 않고 질문 의도를 잘 파악하여 답변하시고, 답변에 대한 확실한 근거(본인의 경험, 이론적 지식 등)를 말해주시면 좋을 거 같습니다.</p>
                </div>
              </div>
            </div>
            
            <div class="accordset-item">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="review-tit">면접 후기 제목1<br>
                    <span class="review-date">2024-02-14</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="review-icon-wrapper">
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">신입</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">긍정적</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">보통</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">합격</span>
                    </li>
                  </ul>
                  <p class="review-content">지원자와 2명과 면접관 2명이 면접을 진행합니다. 각 면접관 님이 간단한 아이스브레이킹을 시작으로 인성과 직무경험을 순서대로 질문하시며, 지원자 역시 각자의 정해진 순서대로 답변을 진행합니다. 편안한 분위기에서 면접자가 자유롭게 본인의 생각을 말할 수 있게 해주십니다. 최대한 긴장하지 않고 질문 의도를 잘 파악하여 답변하시고, 답변에 대한 확실한 근거(본인의 경험, 이론적 지식 등)를 말해주시면 좋을 거 같습니다.</p>
                </div>
              </div>
            </div>

            <div class="accordset-item">
              <div class="accordset-header">
                <div class="accordset-button btn">
                  <h4 class="review-tit">면접 후기 제목1<br>
                    <span class="review-date">2024-02-14</span></h4>
                </div>
              </div>
              <div class="accordset-body">
                <div class="accordset-content">
                  <ul class="review-icon-wrapper">
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/11325/11325487.png" alt="경력">
                      </figure>
                      <span>경력 </span><span class="emph">신입</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/4832/4832230.png" alt="만족도">
                      </figure>
                      <span>만족도 </span><span class="emph">긍정적</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/6231/6231766.png" alt="난이도">
                      </figure>
                      <span>난이도 </span><span class="emph">보통</span>
                    </li>
                    <li>
                      <figure class="review-icon">
                        <img class="width-100" src="https://cdn-icons-png.flaticon.com/512/9511/9511711.png" alt="결과">
                      </figure>
                      <span>결과 </span><span class="emph">합격</span>
                    </li>
                  </ul>
                  <p class="review-content">지원자와 2명과 면접관 2명이 면접을 진행합니다. 각 면접관 님이 간단한 아이스브레이킹을 시작으로 인성과 직무경험을 순서대로 질문하시며, 지원자 역시 각자의 정해진 순서대로 답변을 진행합니다. 편안한 분위기에서 면접자가 자유롭게 본인의 생각을 말할 수 있게 해주십니다. 최대한 긴장하지 않고 질문 의도를 잘 파악하여 답변하시고, 답변에 대한 확실한 근거(본인의 경험, 이론적 지식 등)를 말해주시면 좋을 거 같습니다.</p>
                </div>
              </div>
            </div>
          </div>
          <nav class="pagiset pagiset-circ">
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-first" href="javascript:void(0)">
                <span class="visually-hidden">처음</span>
              </a>
            </div> -->
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-prev" href="javascript:void(0)">
                <span class="visually-hidden">이전</span>
              </a>
            </div>
            <div class="pagiset-list">
              <a class="pagiset-link active-fill" href="javascript:void(0)">1</a>
              <a class="pagiset-link" href="javascript:void(0)">2</a>
              <a class="pagiset-link" href="javascript:void(0)">3</a>
            </div>
            <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-next" href="javascript:void(0)">
                <span class="visually-hidden">다음</span>
              </a>
            </div>
            <!-- <div class="pagiset-ctrl">
              <a class="pagiset-link pagiset-last" href="javascript:void(0)">
                <span class="visually-hidden">마지막</span>
              </a>
            </div> -->
          </nav>
        </div>
      </div>
    </div>
    <!-- [E]glamping-N40 -->
    </div>
  </section>
<script>
let companyDetailApp=Vue.createApp({
	data(){
		return{
			recruit_list:[],
			recruit_detail:[],
			company_detail:[],
			no:${no},
			cno:${cno},
			curpage:1,
      totalpage:0,
      startPage:0,
      endPage:0
		}
	},
	mounted(){
		this.dataRecv()
		
		axios.get('../recruitment/company_detail_vue.do', {
			params:{
				no:this.no,
				cno:this.cno
			}
		}).then(response=>{
			console.log(response.data)
			this.recruit_detail=response.data.rvo
			this.company_detail=response.data.cvo
		})
	},
	methods:{
		dataRecv(){
      axios.get('../recruitment/recruit_detail_vue.do', {
        params:{
        	no:this.no,
          cno:this.cno,
          page:this.curpage
        }
      }).then(response=>{
        console.log(response.data)
        this.recruit_list=response.data
      })
      
      // 페이지
      axios.get('../recruitment/recruit_page_vue.do', {
        params:{
          page:this.curpage
        }
      }).then(response=>{
        console.log(response.data)
        this.curpage=response.data.curpage
        this.totalpage=response.data.totalpage
        this.startPage=response.data.startPage
        this.endPage=response.data.endPage
      })
      
      /* axios.get('../recruitment/recruit_cookie_vue.do').then(response=>{
        console.log(response.data)
        this.cookie_list=response.data
      }) */
    },
    
    range(start, end){
      let arr=[]
      let leng=end-start
      for(let i=0; i<=leng; i++){
        arr[i]=start
        start++
      }
      return arr
    },
    prev(){
      this.curpage=this.endPage-1
      this.dataRecv()
    },
    next(){
      this.curpage=this.endPage+1
      this.dataRecv()
    },
    pageChange(page){
      this.curpage=page
      this.dataRecv()
    },		
		
		addScript(){
			const script=document.createElement("script")
			  
			/*global kakao*/
			script.onload=()=>kakao.maps.load(this.initMap)
			script.src="http://dapi.kakao.com/v2/maps/sdk.js?autoload=false&appkey=74c8ca8100e4e559f7de6e3bf17641b2&libraries=services"
			document.head.appendChild(script)
		},
		
		initMap(){
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
  			geocoder.addressSearch(this.company_detail.address, function(result, status) {
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
	  		            content: '<div style="width:150px; text-align:center; padding:6px 0;">'+$("#name").text()+'</div>'
	  		        });
	  		        infowindow.open(map, marker);
	
	  		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	  		        map.setCenter(coords);
				} 
			});    
		}
	}
}).mount('.companyDetailApp')
</script>
</body>
</html>