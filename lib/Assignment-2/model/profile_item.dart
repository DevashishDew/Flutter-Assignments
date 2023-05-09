class FavouritePeople {
  FavouritePeople(
      {required this.userName,
      required this.profileUrl,
      required this.countryIconUrl});

  final String userName;
  final String? profileUrl;
  final String countryIconUrl;
}

final dummyPeopleData = [
  FavouritePeople(
      userName: 'Alex Dime',
      profileUrl: 'assets/images/dummy_profile.png',
      countryIconUrl: 'assets/images/icon_india.png'),
  FavouritePeople(
      userName: 'Rubina Ulla',
      profileUrl: null,
      countryIconUrl: 'assets/images/icon_india.png'),
];
