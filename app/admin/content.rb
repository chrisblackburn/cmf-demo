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
