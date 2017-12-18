class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    user ||= User.new
    case controller_namespace
    when Settings.ability.namespace_admin
      can :manage, :all if user.is_admin?
    else
      permission user
    end
  end

  private

  def permission user
    if user.is_admin?
      can :manage, :all
    else
      can %i(index show create), User
      can :update, User, id: user.id
      can :manage, [Friend, Favorite], user_id: user.id
      can %i(create destroy), [Comment, Document], user_id: user.id
      can %i(index show), Document
      can %i(index create), HistoryDownload
      can :create, [Transaction, Category]
    end
  end
end
