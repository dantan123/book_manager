class Author < ApplicationRecord
  has_many :books, dependent: :destroy    
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_length_of :first_name, maximum: 35
  validates_length_of :last_name, maximum: 35
    
  def num_books
     books.length     
  end
  
  def book_titles
      titles = books.pluck(:title)
      return titles
  end

  # Creates and array of arrays to use in dropdown selects for author. For more info:  
  # https://guides.rubyonrails.org/form_helpers.html#select-boxes-for-dealing-with-model-objects
  def self.to_nested_array_for_select
     nested = []  
     Author.order(:last_name).each do |author|
         nested.push [author.first_name << ' ' << author.last_name, author.id]
     end
     return nested
  end 
end
