module Tinybucket
  module Api
    class BranchesTagsApi < BaseApi
      include Tinybucket::Api::Helper::BranchesTagsHelper

      attr_accessor :repo_owner, :repo_slug

      def list(options = {})
        list = get_path(path_to_list,
                        options,
                        Tinybucket::Parser::BranchesTagsParser)

        list.next_proc = next_proc(:list, options)
        inject_api_config(list)
      end

    end
  end
end
