class Post < ActiveRecord::Base

  validate :is_title_case
  before_validation :make_title_case
  belongs_to :author
  before_create :puts_before_create
  before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end

  def puts_before_create
    puts "This code is getting run before creation."
  end

  def email_author_about_post
    puts "Our app just emailed the author his/her successful Post confirmation."
  end
end
