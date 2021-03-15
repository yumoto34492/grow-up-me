class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'メンタル' },
    { id: 3, name: 'スポーツ' },
    { id: 4, name: '健康・食事・ダイエット' },
    { id: 5, name: '語学勉強' },
    { id: 6, name: '読書' },
    { id: 7, name: '恋愛' },
    { id: 8, name: '趣味・ゲーム' },
    { id: 9, name: 'お金' },
    { id: 10, name: '仕事' },
    { id: 11, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :targets
end