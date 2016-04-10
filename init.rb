Redmine::Plugin.register :update_issues_watcher do
  name 'Update Issues Watcher plugin'
  author 'Ilya Belyakov'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/Kashak/update_issues_watcher.git'
  author_url 'https://github.com/Kashak'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'attachments_controller'
  AttachmentsController.send(:include, UpdateIssuesWatcher::Patches::AttachmentsControllerPatch)
end

require 'update_issues_watcher/hooks/controller_issues_edit_after_save_hook'
require 'update_issues_watcher/hooks/controller_journals_edit_post_hook'
