ActiveAdmin.register Product do
scope :all, :default => true
  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description, :as => :text
      f.input :price
    end

    f.inputs 'Images' do
      f.input :image, as: :file, :label => 'Product Image'
    end

    f.actions
  end
  permit_params do
    [:name, :description, :price, :image]
  end

  show do |product|
    attributes_table do
      row :name
      row :description
      row :price
      row :thumbnail do
        image_tag(product.image.url(:thumb))
      end
    end
  end
end
