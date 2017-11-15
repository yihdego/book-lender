yihdego = User.create(username: 'yihdego', email: 'amanuel@email.com', password:'password')

op = Book.create(title: 'One Piece: Romance Dawn', author: 'Eichiro Oda')

Shelf.create(user: yihdego, book: op)
