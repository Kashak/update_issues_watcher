module UpdateIssuesWatcher
  module Hooks
    class ControllerIssuesEditAfterSaveHook < Redmine::Hook::ViewListener

      include RequestSender

      def controller_issues_edit_after_save(context = {})
        if context[:issue]
          send_data(context[:issue].id)
        end
      end

    end
  end
end