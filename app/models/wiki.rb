class Wiki
  include Mongoid::Document
  include Mongoid::Timestamps
  #include Mongoid::Slug

  #def to_param
  #  slug
  #end

  has_and_belongs_to_many :users
  #belongs_to :user

  field :title, type: String
  field :body, type: String
  field :private, type: Boolean, default: false

  #slug :title

  scope :visible_to, ->(user) { user.present? || user.blank? ? where(:private => false) : where(:private => false).or(:id => user.wiki_ids) }
  def public?
    !self.private?
  end
end
