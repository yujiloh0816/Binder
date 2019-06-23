# cronにデータを反映
# bundle exec whenever --update-crontab

every 1.days do
  command "curl -L http://localhost:3000/api/v1/companies"
end

# 確認用
# every 1.minutes do
#   command "curl -L http://localhost:3000/api/v1/companies"
# end
