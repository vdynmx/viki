class AddUserToWiki
  include Mongoid::Document
  field :wikis, :user_id, type: Integer

end
