module Tinybucket
  module Parser
    class BranchesTagsParser < BaseParser
      def convert(json)
        Tinybucket::Model::Page.new(
          json, Tinybucket::Model::BranchTag)
      end
    end
  end
end
