# 多环境发布
require 'capistrano/ext/multistage'
set :stages, %w(master production)
set :default_stage, 'master'
# 扩展bundle管理
require 'bundler/capistrano'
set :bundle_flags, '--no-deployment --quiet'

# 重置/etc/environment中的gemfile变量
set :rake, "bundle exec rake"

# patch for "deploy:migrate is only run..." in versions > 2.5.20
set(:releases) { capture("ls -x #{releases_path}").split.sort }

# 创建tmp下子目录的符号链接
set :shared_children, %w(public/system log tmp/pids tmp/sockets)

# 系统参数
set :application, 'itbackup'
set :root_path, '/itbackup'
set :deploy_to, "#{root_path}/web"
set :config, "#{deploy_to}/config"
set :assets_path, "#{shared_path}/public"
# ruby application shared file path
#set :file_shared_path, "#{root_path}/web/file/shared"
set :deploy_via, :remote_cache
set :group_writable, false
set :normalize_asset_timestamps, false

# 执行用户
set :user, 'www'
set :use_sudo, false

# 代码库
set :scm, :git
set :repository, 'https://github.com/shiguodong/ngobackup.git'
# bundle管理
namespace :bundle do
  # 建立bundle连接
  task :prepare, :roles => :app do
    run "ln -sfT #{shared_path}/.bundle #{latest_release}/.bundle"
    run "cp -f #{shared_path}/Gemfile.lock #{latest_release}/"
    run "cp -f #{shared_path}/database.yml #{latest_release}/config/database.yml"
    
    # 如果Gemfile中rails版本更改，自动bundle:install会依赖失败
    # 此时则需要传入-s update=*参数，触发bundle update语句
    run "cd #{latest_release} && bundle update" if exists?(:update)
  end
  
  task :gemfilelock, :roles => :app do
    run "cp -f #{latest_release}/Gemfile.lock #{shared_path}/"
  end
  
  # 手动更新所有gem
  task :update, :roles => :app do
    run "cd #{current_path} && bundle update && cp -f Gemfile.lock #{shared_path}/"
    deploy.restart
  end
end

namespace :bluepill do
  task :start do
    run "cd #{current_path} && RAILS_ENV=#{rails_env} bundle exec bluepill --no-privileged load #{current_path}/config/bluepill.rb"
  end
  
  task :stop do
    run "cd #{current_path} && bundle exec bluepill --no-privileged quit"
  end
end

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
        from = source.next_revision(current_revision)
        if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
          run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
        else
          logger.info "Skipping asset pre-compilation because there were no asset changes"
        end
    end
  end

  task :compile_assets, :roles => :app do
    run "cd #{latest_release} && RAILS_ENV=#{rails_env}  #{rake}  assets:precompile"
  end

  task :clean_git_cache, :roles => :app do
    run "rm -rf /itbackup/web/shared/cached-copy/ "
  end
  
  # 临时运行的一些shell
  task :tmp_shell, :roles => :app do
    run "mkdir -p #{current_path}/log/regist"
  end
  
  # 重启服务
  task :start do
    run "cd #{current_path} && bundle exec bluepill  itbackup --no-privileged start unicorn RAILS_ENV=#{rails_env}"
  end
  task :stop do
    run "cd #{current_path} && bundle exec bluepill itbackup --no-privileged stop unicorn RAILS_ENV=#{rails_env}"
  end
  task :restart, :roles => :web do
    if rails_env == "production"
      run "cd #{current_path} && bundle exec bluepill itbackup --no-privileged restart unicorn RAILS_ENV=#{rails_env}"
    else
      deploy.restart_unicorn
    end
  end
  
  # 仅限qa下使用，生产环境无用
  task :restart_unicorn, :roles => :web do
    run "cat #{shared_path}/pids/unicorn.pid | xargs kill -USR2"
  end

  
  task :links, :roles => :app do
    # 建立配置文件链接
     run "ln -sf #{shared_path}/database.yml #{latest_release}/config/database.yml"
    # run "ln -sf #{config}/mongoid.yml #{latest_release}/config/mongoid.yml"
    # run "ln -sf #{root_path}/web/file/bdsitemap.txt #{latest_release}/public/bdsitemap.txt"

    # 建立文件目录链接
    #run "ln -sfT #{root_path}/web/file/upload #{latest_release}/public/upload"
    # run "ln -sfT #{root_path}/web/file/log/quiz #{latest_release}/log/quiz"
    
    # assets folder
    # run "ln -sfT #{assets_path}/javascripts #{latest_release}/public/javascripts"
    # run "ln -sfT #{assets_path}/stylesheets #{latest_release}/public/stylesheets"
    # run "ln -sfT #{assets_path}/images #{latest_release}/public/images"
  end
  
   # 初始化 assets
  task :clean_assets, :roles => :web do
    run "rm -rf #{assets_path}"
  end

  task :bg, :roles => :bg do
    # 杀掉resque相关的进程（再由monitor自动重启）
    run "ruby #{current_path}/server/scripts/resque.rb kill"
  end
end

#before('bundle:install', 'bundle:prepare')
after('bundle:install', 'bundle:gemfilelock')

before('deploy:finalize_update', 'deploy:links')
after("deploy:finalize_update","deploy:compile_assets")
after('deploy:update', 'deploy:migrate')
#after('deploy:update', 'deploy:bg')
