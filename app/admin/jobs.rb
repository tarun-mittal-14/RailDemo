# frozen_string_literal: true

ActiveAdmin.register Job do
  permit_params :id, :title, :description, :requirement, :location

  index do
    selectable_column
    id_column
    column :id
    column :title
    column :description
    column :requirement
    column :location
    actions
  end

  filter :title
  filter :location
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
  # permit_params :title, :description, :requirement, :location, :user_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :description, :requirement, :location, :user_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
