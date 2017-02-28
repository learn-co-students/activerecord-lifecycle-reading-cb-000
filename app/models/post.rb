class Post < ActiveRecord::Base

  validate :is_title_case 
  before_validation :make_title_case 
  before_save :send_email_to_author
  belongs_to :author

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def send_email_to_author
    
  end

end
