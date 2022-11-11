class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
# has many through is reliant on the 'has many bookmarks' above it.
# without this it would not be able to go thorugh bookmarks

  validates :name, presence: true
  validates :name, uniqueness: true
end

# resources "lists, only: [:index. :show, :new, :create]"
# LOOK UP the above code for syntax examples if wrong

# def show
#   @list = List.find(params[:id])
# end

# def new
#   @list = List.new
# end

# def create
#   @list = List.new(list_params)
#   if @list.save
#     redirect_to list_path
#   else
#     render :new, status: :unprocessable_entity
# end



# private

# def list_params
#   params.require(:list).permit(:name)
# end

# simple_form_for @list do |f|
#   f.input :name, input_html: { class: "name_of_class"}
#   f.submit "Submit", class: "btn btn_primary"
# end
