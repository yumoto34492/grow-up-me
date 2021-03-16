FactoryBot.define do
  factory :target do
    title             { '毎日朝6時に起きる' }
    genre_id          { 4 }
    deadline          { '2021-03-31' }
    plan              { '23時までに寝る。' }
    great_man         { 'まこなり社長' }
    future            { '早起きの習慣が身に付き夜ふかしをしなくなる。' }
    user
    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
