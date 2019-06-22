Company.create!(
  name: "ディップ株式会社",
  domain: "https://www.dip-net.co.jp/",
  img_site: open("#{Rails.root}/app/assets/images/companies/dip.jpg")
)
Company.create!(
  name: "パーソルキャリア株式会社",
  domain: "https://www.persol-career.co.jp/",
  img_site: open("#{Rails.root}/app/assets/images/companies/persol.jpg")
)
Company.create!(
  name: "マイナビ株式会社",
  domain: "https://job.mynavi.jp/",
  img_site: open("#{Rails.root}/app/assets/images/companies/mynavi.jpg")
)
Company.create!(
  name: "リクルート株式会社",
  domain: "https://www.recruit.co.jp/",
  img_site: open("#{Rails.root}/app/assets/images/companies/recruit.jpg")
)

User.create!(
  name: "Bob",
  email: "user1@example.com",
  password: "hogehoge"
)
