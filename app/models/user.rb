class User < ApplicationRecord
  has_many :shelves
  has_many :books, through: :shelves

  has_many :friendships
  has_many :friends, :through => :friendships
  include BCrypt
  has_secure_password

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.login(email, password)
    user = User.find_by_email(email)
    if user.password == password
      user
    end
  end

  def friendsbooks
    books = []
    self.friends.each do |friend|
      friend.books.each do |book|
        books << book
      end
    end
    books.uniq
  end

  def booksearch(title)
    friendsandbooks = []
    books = Book.where("title LIKE ?", "%#{title}%")
    books.each do |book|
      listoffriends = exactbooksearch(book)
      listoffriends.map do |friend|
        friendsandbooks << { friend => book }
      end
    end
    friendsandbooks
  end

  def exactbooksearch(book)
    friendswhohaveit = []
    self.friends.each do |friend|
      if friend.books.find_by(id: book.id)
        friendswhohaveit << friend
      end
    end
    friendswhohaveit
  end

end
