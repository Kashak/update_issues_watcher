module UpdateIssuesWatcher
  module Patches
    module AttachmentsControllerPatch

      def self.included(base)

        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)

        base.class_eval do
          unloadable
          alias_method_chain :destroy, :ext
        end

      end

      module ClassMethods
      end

      module InstanceMethods

        include RequestSender

        def destroy_with_ext

          if @attachment.container.is_a?(Issue)
            send_data(@attachment.container.id)
          end

          destroy_without_ext
        end

      end

    end
  end
end