set :rails_env, 'production'

set :branch, 'master'

# 代码发布服务器
role :app, '42.96.169.241'

# 网站服务器
role :web, '42.96.169.241'

# 使用数据库服务器运行迁移
role :db,  '42.96.169.241', primary: true, no_release: true
