class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :users
  #belongs_to :user

  field :title, type: String
  field :body, type: String
  field :private, type: Boolean, default: false

  scope :visible_to, -> (user) { user ? all : where(:private => false).or(:id => user.wiki_ids) }
  

  def public?
    !self.private?
  end
end
