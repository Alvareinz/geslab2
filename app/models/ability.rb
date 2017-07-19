class Ability
  include CanCan::Ability

  def initialize(user)

   if user.present?
        if user.role? :manage
            can :manage, :all
            can :create, Type
        else
           can :read,:all

        end
    end
  end
end
