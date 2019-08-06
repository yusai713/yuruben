ActiveAdmin.register User do
  permit_params :email, :password, :admin

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'ユーザー追加' do
      f.input :email
      f.input :password
      f.input :admin
    end
    f.actions
  end
end
