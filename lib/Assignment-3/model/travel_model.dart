abstract class TravelParentData {}

class QuickLink extends TravelParentData {
  final List<QuickLinkSubItem> quickLinkSubItem;

  QuickLink(this.quickLinkSubItem);
}

class QuickLinkSubItem {
  final String title;
  final String imageUrl;

  QuickLinkSubItem(this.title, this.imageUrl);
}

class SearchComponent extends TravelParentData {
  final bool isActive;

  SearchComponent(this.isActive);
}

class Stories extends TravelParentData {
  final List<String> storiesImageUrlList;

  Stories(this.storiesImageUrlList);
}

class Popular extends TravelParentData {
  final String title;
  final List<PopularSubItem> poupularSubItem;

  Popular(this.poupularSubItem, this.title);
}

class PopularSubItem {
  final String title;
  final String subTitle;
  final String imageUrl;

  PopularSubItem(this.title, this.subTitle, this.imageUrl);
}

class MainComponent extends TravelParentData {
  final String title;
  final String subTitle;
  final String imageUrl;
  final List<MainComponentSubItem> mainComponentSubItem;

  MainComponent(
      this.mainComponentSubItem, this.title, this.subTitle, this.imageUrl);
}

class MainComponentSubItem {
  final String title;
  final String subTitle;
  final String imageUrl;

  MainComponentSubItem(this.title, this.subTitle, this.imageUrl);
}

class Hotels extends TravelParentData {
  final String title;
  final List<HotelsSubItem> hotelsSubItem;

  Hotels(this.hotelsSubItem, this.title);
}

class HotelsSubItem {
  final String name;
  final String location;
  final String ratingStar;
  final String rating;
  final String distance;
  final String rate;
  final String imageUrl;

  HotelsSubItem(this.name, this.location, this.ratingStar, this.rating,
      this.distance, this.rate, this.imageUrl);
}

final List<TravelParentData> dummyHotelData = [
  QuickLink([
    QuickLinkSubItem('Hotels',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    QuickLinkSubItem('Flights',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    QuickLinkSubItem('Activities',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    QuickLinkSubItem('Restaurant',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    QuickLinkSubItem('Hotels',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    QuickLinkSubItem('Hotels',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
  ]),
  SearchComponent(true),
  Stories([
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
    'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg',
  ]),
  Popular([
    PopularSubItem('Palace of Culture and Science', 'Warsaw',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    PopularSubItem('Second World War Museum', 'Gadsk',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    PopularSubItem('Royal Castle', 'Warswa',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    PopularSubItem('Palace of Culture and Science', 'Warsaw',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    PopularSubItem('Second World War Museum', 'Gadsk',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    PopularSubItem('Royal Castle', 'Warswa',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
  ], 'Most Popular Now'),
  MainComponent([
    MainComponentSubItem('Warsaw', 'subTitle',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    MainComponentSubItem('Karsaw', 'subTitle',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    MainComponentSubItem('Garsaw', 'subTitle',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    MainComponentSubItem('Sipatti', 'subTitle',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    MainComponentSubItem('Belarus', 'subTitle',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
  ], 'Poland', 'A special city where culture collide',
      'https://picsum.photos/seed/picsum/500/500'),
  Hotels([
    HotelsSubItem(
        'Hotel ABC',
        'London',
        '5',
        '4.2(188)',
        '1.5 KM Away',
        '25\$ Night',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    HotelsSubItem(
        'Hotel ABC',
        'London',
        '5',
        '4.2(188)',
        '1.5 KM Away',
        '25\$ Night',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    HotelsSubItem(
        'Hotel ABC',
        'London',
        '5',
        '4.2(188)',
        '1.5 KM Away',
        '25\$ Night',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
    HotelsSubItem(
        'Hotel ABC',
        'London',
        '5',
        '4.2(188)',
        '1.5 KM Away',
        '25\$ Night',
        'https://cdn.pixabay.com/photo/2018/07/11/21/51/toast-3532016_1280.jpg'),
  ], 'Hotels')
];
