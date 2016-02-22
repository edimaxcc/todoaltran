class Ability
  include CanCan::Ability

def initialize(user)
    user ||= User.new # guest user
    if user.role? :admin
     can :manage, :all
    elsif user.role? :todo_admin
     can :manage, [Todo, Asset, Issue]
    elsif user.role? :todo_team
     can :read, [Todo, Asset]
     # manage products, assets he owns
     can :manage, Todo do |todo|
        todo.try(:owner) == user
      end
      can :manage, Asset do |asset|
        asset.assetable.try(:owner) == user
      end
    end
  end
end
