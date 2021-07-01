class User {
  final int id;
  final String name;
  final String imageUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
  });
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Sardar Kahan',
  imageUrl: 'assets/images/sardar.jpg',
  isOnline: true,
);

// USERS
final User ironMan = User(
  id: 1,
  name: 'Faizal Khan',
  imageUrl: 'assets/images/faizal.jpeg',
  isOnline: true,
);
final User captainAmerica = User(
  id: 2,
  name: 'Mohsina Khan',
  imageUrl: 'assets/images/mohsina.jpeg',
  isOnline: true,
);
final User hulk = User(
  id: 3,
  name: 'Sultan ',
  imageUrl: 'assets/images/sultan.jpeg',
  isOnline: false,
);
final User scarletWitch = User(
  id: 4,
  name: 'Ramadhir',
  imageUrl: 'assets/images/ramadhir.jpeg',
  isOnline: false,
);
