set :rails_env, 'production'

set :branch, 'master'

# 代码发布服务器
role :app, '110.76.44.69'

# 网站服务器
role :web, '110.76.44.69'

# 使用数据库服务器运行迁移
role :db,  '110.76.44.69', primary: true, no_release: true
