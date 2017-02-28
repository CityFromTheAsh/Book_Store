a = User.new()
a.login = 'Weed15'
a.email = 'AdminCityFromTheAsh@gmail.com'
a.password = '48744874'
a.admin = true
a.ban = false
b = Option.new()
b.book_per_page = 10
b.language = :ru
a.option = b
a.save
b.save