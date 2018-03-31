RailsAdmin.config do |config|
  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :admin
  end
  config.current_user_method(&:current_admin)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  config.navigation_static_links = {
    'Get new and update data' => '/admin/datas/new'
  }

  # VSBG
  config.model Vsbg do
    list do
      sort_by :created_at
      field :id
      field :name
      field :photo
      field :fb_id
      field :created_at do
        sort_reverse true
      end
      field :updated_at
    end
  end

  # BAG
  config.model Bag do
    list do
      sort_by :created_at
      field :id
      field :name
      field :photo
      field :fb_id
      field :created_at do
        sort_reverse true
      end
      field :updated_at
    end
  end

  # VBBA
  config.model Vbba do
    list do
      sort_by :created_at
      field :id
      field :name
      field :photo
      field :fb_id
      field :created_at do
        sort_reverse true
      end
      field :updated_at
    end
  end
end
