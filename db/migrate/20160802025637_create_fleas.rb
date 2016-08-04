class CreateFleas < ActiveRecord::Migration
  def change
    create_table :fleas do |t|
      
      t.string :kind #short/long
      t.string :title #제목
      t.datetime :term_start  # 마켓개최시간
      t.datetime :term_end  # 마켓마감시간
      t.datetime :sel_term_start # 셀러 모집시간
      t.datetime :sel_term_end # 셀러모집 마감시간
      t.string :address #주소
      t.string :post #주제
      t.string :supervision #주체, 주관
      t.string :condition #참가비& 환불& 지원항목
      t.string :enter_link #신청방법
      t.string :sel_item #품목
      t.string :image_url,    default: ""  #포스터(default는 이미지를 저장할 수도 안할수도 있으니 저장안했을 때는 기본값 넣겠다는 뜻)

      t.timestamps null: false
    end
  end
end
