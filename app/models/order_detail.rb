class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item




  #enum making_status: {"着手不可":0,"制作待ち":1,"制作中":2,"制作完了":3}
  enum making_status: {"":0,　"Waiting_for_make":1,  "making":2, "complete",3}
end
