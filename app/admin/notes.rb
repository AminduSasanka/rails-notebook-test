ActiveAdmin.register Note do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :body, :subject_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :body, :subject_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :subject_id, :title, :body

  show title: :title do |note|
    h1 "Subject: #{note.subject.name}"
    h4 note.body
  end

  form title: 'Make a new note' do |f|
    f.inputs 'Add a note' do
      f.input :title
      f.input :body
      f.input :subject
    end
    f.actions
  end

  index do
    selectable_column
    column :subject
    column 'Title' do |note|
      link_to note.title, admin_note_path(note)
    end
    column 'Body' do |note|
      raw note.body.truncate_words(25)
    end
    column :created_at
    column :updated_at
  end
end
