class Permission < Struct.new(:user)
  def initialize(user)         
    allow :password_resets, [:new, :create, :edit, :update]
    allow :sessions,        [:create, :destroy, :new]
    allow :users,           [:index, :new, :create]
    allow :static_pages,    [:home, :about, :help]
    allow :verifications,   [:show]
    if user
      allow :apps,          [:new, :create, :index] do |a|
        a = user.id
      end
      allow :apps,          [:edit, :show, :update, :destroy] do |a|
        a.user_id == user.id
      end
      allow :users,         [:show]
      allow :users,         [:edit, :update, :destroy] do |u|
        u.id == user.id
      end
      allow_all if user.admin
    end
  end
  
  def allow?(controller, action, resource = nil)
    allowed = @allow_all || @allowed_actions [[controller.to_s, action.to_s]]
    allowed && (allowed == true || resource && allowed.call(resource))
  end
  
  def allow_all
    @allow_all = true
  end
  
  def allow(controllers, actions, &block)
    @allowed_actions ||= {}
    Array(controllers).each do |controller|
      Array(actions).each do |action|
        @allowed_actions[[controller.to_s, action.to_s]] = block || true
      end
    end
  end
end