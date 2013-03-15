class Question < ActiveRecord::Base
  belongs_to :user
  attr_accessible :body, :solved

  validates :body, presence: true, length: { in: 10..255 }
  validates :solved, inclusion: { in: [true, false] } # solved field must contain a value of either true or false

  def self.unsolved(params)
  	where(solved: false).paginate(page: params[:page], order: 'created_at DESC', per_page: 3)
  end
end
