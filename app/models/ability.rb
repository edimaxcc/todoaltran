class Ability
  include CanCan::Ability

def initialize(user)
  if user.admin?
    can :manage, :all  
    
    else
      can :update, Todo do |todo|
          todo.user == user
      end  
      can :destroy, Todo do |todo|
           todo.user == user
      end
      can  :create, Todo
    end
  end
end
