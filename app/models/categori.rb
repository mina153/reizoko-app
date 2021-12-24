class Categori < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '野菜' },
    { id: 3, name: '果物' },
    { id: 4, name: '魚' },
    { id: 5, name: '肉' },
    { id: 6, name: '惣菜' },
    { id: 7, name: '乳製品' },
    { id: 8, name: '調味料' },
    { id: 9, name: 'アイス' },
    { id: 10, name: '冷凍食品' },
    { id: 11, name: 'お菓子' },
    { id: 12, name: '加工食品' },
    { id: 13, name: 'パン類' },
    { id: 14, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :wants
  
end