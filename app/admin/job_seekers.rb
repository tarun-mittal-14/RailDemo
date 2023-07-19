# frozen_string_literal: true

ActiveAdmin.register JobSeeker do
  permit_params :id, :user, :job

  index do
    selectable_column
    id_column
    column :id
    column :user
    column :job
    # column :sign_in_count
    # column :created_at
    actions
  end

  filter :job
  filter :user
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :user_id, :job_id, :status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_id, :job_id, :status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
