class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps

  #has_and_belongs_to_many :user
  belongs_to :user

  field :title, type: String
  field :body, type: String
  field :private, type: Boolean, default: false

  scope :visible_to, -> (user) { user ? all : where(private: false) }
  
  def public?
    !self.private?
  end
end
