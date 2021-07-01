class Post {
  String authorName;
  String authorImageUrl;
  String timeAgo;
  String imageUrl;

  Post({
    required this.authorName,
    required this.authorImageUrl,
    required this.timeAgo,
    required this.imageUrl,
  });
}

final List<Post> posts = [
  Post(
    authorName: 'Sawan Kag',
    authorImageUrl: 'assets/images/sardar.jpg',
    timeAgo: '5 min',
    imageUrl: 'assets/images/p6.jpg',
  ),
  Post(
    authorName: 'Pranav Verma',
    authorImageUrl: 'assets/images/p5.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/p5.jpg',
  ),
  Post(
    authorName: 'Lucky 666',
    authorImageUrl: 'assets/images/mohsina.jpeg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/p6.jpg',
  ),
  Post(
    authorName: 'Sam Martin',
    authorImageUrl: 'assets/images/p3.jpg',
    timeAgo: '10 min',
    imageUrl: 'assets/images/p3.jpg',
  ),
];

final List<String> stories = [
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p2.jpg',
  'assets/images/p3.jpg',
  'assets/images/p5.jpg',
  'assets/images/p1.jpg',
  'assets/images/p1.jpg',
  'assets/images/p1.jpg',
  'assets/images/p1.jpg',
  'assets/images/p1.jpg',
  'assets/images/p3.jpg',
  'assets/images/p5.jpg',
  'assets/images/p1.jpg',
];
