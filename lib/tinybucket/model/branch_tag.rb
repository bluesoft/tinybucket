module Tinybucket
  module Model
    class BranchTag < Base
      include Tinybucket::Model::Concerns::RepositoryKeys

      acceptable_attributes :branches, :tags
      
    end
  end
end
