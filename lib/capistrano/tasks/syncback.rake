namespace :syncback do
  desc 'Check files and download'
  task :check_and_download do
    invoke 'syncback:files'
    #invoke 'syncback:dirs'
    invoke 'syncback:download'
  end

  desc 'Check sync_files for changes'
  task :files do
    next unless any? :sync_files
    on release_roles :app do
      set(:sync_counter, 0) unless any?(:sync_counter)
      set(:sync_files_found, []) unless any?(:sync_files_found)
      fetch(:sync_files).each do |file|
        target = release_path.join(file)
        if test "[ -f #{target} ]"
          unless test "diff <(cat #{target}) <(cd #{repo_path}; git show #{fetch(:branch)}:#{file})"
            set :sync_files_found, fetch(:sync_files_found).push(file)
            set :sync_counter, fetch(:sync_counter) + 1
          end
        else
          fail "File #{file} not found"
        end
      end
    end
  end

  desc 'Download the files'
  task :download do
    on release_roles :app do
      if fetch(:sync_counter) != 0
        info 'Changes were found in the following files:'
        fetch(:sync_files_found).each do |file|
          info file
        end

        ask(:sync_changes, "Do you want to abort the deployment and download the changes? (y/n)")
        if fetch(:sync_changes) == 'y'
          fetch(:sync_files_found).each do |file|
            server_file = release_path.join(file)
            local_file = File.join(Dir.pwd, file)
            download! server_file, local_file
          end
          fail "Abort for sync"
        end
      end
    end
  end
end
