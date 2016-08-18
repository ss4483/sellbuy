# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(email: "master@naver.com",
            password: "123123",
            password_confirmation: "123123",
            nickname: "운영자",
            name: "운영자",
            phone_num: "010",
            kind: "M")
User.create(email: "test1@naver.com",
            password: "123123",
            password_confirmation: "123123",
            nickname: "jymama",
            name: "셀러",
            phone_num: "010",
            kind: "seller",
            profile: "/seeds/seller/1.jpg")
User.create(email: "test2@naver.com",
            password: "123123",
            password_confirmation: "123123",
            nickname: "가비앤공방",
            name: "셀러",
            phone_num: "010",
            kind: "seller",
            profile: "/seeds/seller/2-1.jpg")
User.create(email: "test3@naver.com",
            password: "123123",
            password_confirmation: "123123",
            nickname: "투엘브리온",
            name: "소비자",
            phone_num: "010",
            kind: "seller")


Flea.create(kind: "short",
              title: "한국암웨이25주년기념 해피플리마켓",
              supervision: "주최: 한국암웨이(주) / 주관: 암웨이미술관",
              term_start: "2016-06-20 10:30",
              term_end: "2016-09-20 16:30",
              sel_term_start: "2016-05-10 00:00",
              sel_term_end: "2016-05-31 23:59",
              address: "대구광역시 북구 산격2동 1579번지",
              post: "핸드메이드 상품",
              sel_item: "핸드메이드 악세서리, 패션아이템, 공예, 도예, 아트상품, 디저트 등",
              condition: "참가비 환불 / 지원항목
                          참가비 무료 / 테이블 (야외장소 천막제공)
                          주차 가능",
              image_url: "/seeds/fleas/happy2.png")
Flea.create(kind: "short",
              title: "한국암웨이25주년기념 해피플리마켓",
              supervision: "주최: 한국암웨이(주) / 주관: 암웨이미술관",
              term_start: "2016-06-23 10:30",
              term_end: "2016-06-23 16:30",
              sel_term_start: "2016-05-10 00:00",
              sel_term_end: "2016-05-31 23:59",
              address: "부산광역시 동구 초량동 1188-1번지",
              post: "핸드메이드 상품",
              sel_item: "핸드메이드 악세서리, 패션아이템, 공예, 도예, 아트상품, 디저트 등",
              condition: "참가비 환불 / 지원항목
                          참가비 무료 / 테이블 (야외장소 천막제공)
                          주차 가능",
              image_url: "/seeds/fleas/happy1.png")
Flea.create(kind: "short",
              title: "CGV 프리마켓",
              supervision: "서면 CGV / 옐로마켓",
              term_start: "2016-06-29 17:00",
              term_end: "2016-06-29 21:00",
              sel_term_start: "2016-06-20 00:00",
              sel_term_end: "2016-06-27 23:59",
              address: "CGV 서면(부산 부산진구 전포1동)",
              post: "문화의 날",
              sel_item: "먹거리, 폰케이스 제외( 기 입점업체 존재)",
              condition: "참가비 환불 / 지원항목
                          참가비 30000원(1팀당 5000원은 소외계층아동 무료영화관람으로 쓰입니다^^)
                          테이블, 의자 지원
                          지하 5층 홈플러스 주차장에 주차가능",
              image_url: "/seeds/fleas/cgv.jpg")
Flea.create(kind: "short",
              title: "수영팔도시장 맥주축제 오늘밤은 비어하게!",
              supervision: "수영팔도시장 문화관광형 육성사업단",
              term_start: "2016-08-01 18:00",
              term_end: "2016-08-03 21:00",
              sel_term_start: "2016-07-15 00:00",
              sel_term_end: "2016-07-25 23:59",
              address: "부산광역시 수영구 수영성로 27, (2층)",
              post: " 오늘밤은 비어하게란? 8월 1일~3일 수영팔도시장에서 열리는 맥주 축제입니다.
시장에서 안주를 (5000원)구매하면 시장에서 맥주 1잔을 증정합니다.  
주민들도 함께 먹거리 셀러로 참여 가능한 프로그램으로 시민이 직접 만들어 판매할 수 있습니다.",
              sel_item: "간단한 먹거리, 간식, 안주 등",
              condition: "참가비 환불 / 지원항목
참가비 없음 / 주차제공 없음(인근 공영주차장 이용)",
              image_url: "/seeds/fleas/beer.jpg")

Flea.create(kind: "long",
              title: "디스퀘어 플리마켓",
              supervision: "SC 플리마켓",
              term_start: "2016-07-01 17:00",
              term_end: "2016-07-31 22:00",
              sel_term_start: "2016-07-01 17:00",
              sel_term_end: "2016-07-31 22:00",
              address: "대구 중구 삼덕동1가 디스퀘어",
              post: " 대구 동성로 한복판에서 이루어지는 플리마켓
디스퀘어 빌딩 1층 광장에서 이루어집니다!
입점된 상가들과의 프로모션 진행으로 셀러분들과 방문객들이
할인혜택을 받을 수 있고, 마켓본부에서는 재미있는 행사들을 진행합니다.
볼거리, 먹거리, 놀거리가 다 있는 디스퀘어 플리마켓으로 참여해주세요!",
              sel_item: "",
              condition: "참가비 2만원
개인사유로 취소시 환불 불가 (우천시에도 진행함)
팀당 의자 2개 지원, 참여셀러 주차지원",
              image_url: "/seeds/fleas/dis.jpg")
Flea.create(kind: "long",
              title: "서가앤쿡 플리마켓",
              supervision: "SC 플리마켓",
              term_start: "2016-07-01 16:00",
              term_end: "2016-07-31 21:00",
              sel_term_start: "2016-07-01 16:00",
              sel_term_end: "2016-07-31 21:00",
              address: "서가앤쿡 대구 동성로본점 앞마당",
              post: " 2016년 7월 매주 금요일에 만나는 서가앤쿡 플리마켓
서가앤쿡 동성로 본점에서 진행되는 마켓은
문화예술을 사랑하는 서가앤쿡이 함께합니다.
매주 금요일 오후 4시-9시에 진행 예정입니다.",
              sel_item: "",
              condition: "참가비 2만원
개인사유로 취소시 환불 불가 (우천시에도 진행함)
의자 지원(테이블 지원X)",
              image_url: "/seeds/fleas/cook.jpg")
