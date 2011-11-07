ActiveAdmin.register Page do
  index do
    column :name
    column :content, sort: :content do |page|
      shortened = page.body[0..15]
      if shortened == page.body
        page.body
      else
        "#{shortened}&hellip;".html_safe
      end
    end
    column "Last Updated", :updated_at
    default_actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name, input_html: { :readonly => true }
    end
    f.inputs "Content" do
      f.input :body
    end
    f.buttons
  end

  show do
    h3 "Page: #{page.name}"
    div do
      page.rendered
    end
  end
end
