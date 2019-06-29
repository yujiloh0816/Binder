ActiveRecord::Base.transaction do

  test_user = User.create!(
    name: "taro",
    email: "taro@example.com",
    password: "hogehoge"
  )

  company1 = Company.create!(
    name: "ディップ株式会社",
    domain: "https://www.dip-net.co.jp/",
    img_name: open("#{Rails.root}/db/dummy_img/dip.jpg")
  )

  user1 = company1.users.create!(
    name: "Bob",
    email: "bob@example.com",
    password: "hogehoge"
  )

  Reaction.create!(
    to_user_id: test_user.id,
    from_user_id: user1.id,
    status: "good"
  )

  company2 = Company.create!(
    name: "パーソルキャリア株式会社",
    domain: "https://www.persol-career.co.jp/",
    img_name: open("#{Rails.root}/db/dummy_img/persol.jpg")
  )

  user2 = company2.users.create!(
    name: "Tom",
    email: "tom@example.com",
    password: "hogehoge"
  )

  Reaction.create!(
    to_user_id: test_user.id,
    from_user_id: user2.id,
    status: "good"
  )

  company3 = Company.create!(
    name: "マイナビ株式会社",
    domain: "https://job.mynavi.jp/",
    img_name: open("#{Rails.root}/db/dummy_img/mynavi.jpg")
  )

  company3.users.create!(
    name: "Alex",
    email: "alex@example.com",
    password: "hogehoge"
  )

  company4 = Company.create!(
    name: "リクルート株式会社",
    domain: "https://www.recruit.co.jp/",
    img_name: open("#{Rails.root}/db/dummy_img/recruit.jpg")
  )

  company4.users.create!(
    name: "Jane",
    email: "jane@example.com",
    password: "hogehoge"
  )
  
end
