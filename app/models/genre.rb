class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '宇宙の豆知識' },
    { id: 3, name: '宇宙開発について' },
    { id: 4, name: '再生エネルギーについて'}
  ]

  include ActiveHash::Associations
  has_many :posts
  
end
