ActiveAdmin.register Content do
  actions :all, except: [:show]

  menu label: 'Content'

  filter :title
  filter :live_from
  filter :live_to

  permit_params [:title,
                 :content,
                 :live_from,
                 :live_to]

  member_action :approve, method: :post do
    content = Content.find(params[:id])

    authorize! :approve, content
    content.approve!

    flash[:notice] = 'Content has been approved!'
    redirect_to [:edit_admin, content]
  end

  action_item only: :edit do
    content = Content.find(params[:id])

    if !content.approved? and authorized?(:approve, content)
      link_to('Approve', approve_admin_content_path(content), method: :post)
    end
  end

  form do |f|
    f.inputs 'Content' do
      f.semantic_errors
      f.input :title
      f.input :content
      f.input :live_from, as: :datepicker
      f.input :live_to, as: :datepicker
    end

    f.actions
  end
end
