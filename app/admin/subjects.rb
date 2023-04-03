ActiveAdmin.register Subject do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params
  #
  # or
  #
  # permit_params do
  #   permitted = []
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # customizing the page view

  permit_params :intro, :name, note_ids: []

  show title: :name do |subject|
    h2 'These are the current available notes'

    div do
      subject.notes.each do |note|
        h4 "Subject name: #{subject.name}"
        h4 "Note topic: #{note.title}"
        h4 "Note: #{note.body}"
      end
    end
  end
end
