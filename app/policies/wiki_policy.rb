class WikiPolicy < ApplicationPolicy

  def new?
    user.present?
  end

  def show?
    record.public? || user.present? && record.users.include?(user)
  end
  
  def update?
    user.present? && (record.public? || record.users.include?(user))
  end

  def destroy?
    user.present? && (user.role == "admin" ||  record.users.include?(user))
  end

  class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       wikis = []
       if @user && user.role == "admin"
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif @user && user.role == "paid"
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.users.include?(user) 
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public? #|| wiki.users.include?(user)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
   end

end