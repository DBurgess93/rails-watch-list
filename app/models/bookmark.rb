class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :comment, length: { minimum: 6 }
  validates :movie_id, uniqueness: { scope: :list_id }
  #   validates :movie, uniqueness: { scope: :list }    this works too
end


# test validations using rails console from now on
