module UpdateIssuesWatcher
  module Hooks
    class ControllerJournalsEditPostHook < Redmine::Hook::ViewListener

      include RequestSender

      def controller_journals_edit_post(context = {})
        if context[:journal] && context[:journal].journalized_id
          send_data(context[:journal].journalized_id)
        end
      end

    end
  end
end