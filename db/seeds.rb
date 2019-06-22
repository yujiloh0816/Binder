Company.create!(
  name: "ディップ株式会社",
  domain: "https://www.dip-net.co.jp/",
  img_name: open("#{Rails.root}/app/assets/images/comapnies/dip.jpg")
)
Company.create!(
  name: "パーソルキャリア株式会社",
  domain: "https://www.persol-career.co.jp/",
  img_name: open("#{Rails.root}/app/assets/images/comapnies/persol.jpg")
)
Company.create!(
  name: "マイナビ株式会社",
  domain: "https://job.mynavi.jp/",
  img_name: open("#{Rails.root}/app/assets/images/comapnies/mynavi.jpg")
)
Company.create!(
  name: "リクルート株式会社",
  domain: "https://www.recruit.co.jp/",
  img_name: open("#{Rails.root}/app/assets/images/comapnies/recruit.jpg")
)

User.create!(
  name: "Bob",
  email: "user1@example.com",
  password: "hogehoge"
)
