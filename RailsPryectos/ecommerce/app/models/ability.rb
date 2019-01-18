class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    alias_action :read, to: :normal_user
    #raise user.to_yaml
    if user.is_admin?
      can :manage, [Category, Product, Myimage] # CRUD == manage
    elsif user.is_normal_user?
      can :normal_user, [Category, Product]
    end
  end
end