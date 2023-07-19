# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params :name, :email, :age, :experience, :qualification

  index do
    selectable_column
    id_column
    column :id
    column :name
    column :email
    column :age
    column :experience
    column :qualification
    actions
  end

  filter :name
  filter :qualification
  filter :experience
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
  # permit_params :name, :email, :password, :age, :experience, :qualification, :type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :email, :password, :age, :experience, :qualification, :type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
