class SendDate < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜３日で発送' },
    { id: 3, name: '４〜７日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
end
