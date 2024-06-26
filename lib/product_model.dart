

class Products {
  String name;
  String pic;
  bool fave;
  double desc;
  int counter;

  Products({
    required this.name,
    required this.pic,
    required this.fave,
    required this.desc,
    required this.counter,
  });
}

List<Products> itemproducts = [
  Products(
      name: '7 stages filter',
      pic: 'assets/image1.jpg',
      fave: false,
      desc: 3500,
      counter: 0),
  Products(
      name: '5 stages filter',
      pic: 'assets/image2.jpg',
      fave: false,
      desc: 1200,
      counter: 0),
  Products(
      name: 'membrain',
      pic: 'assets/image4.jpg',
      fave: false,
      desc: 450,
      counter: 0),
  Products(
      name: '3 Stages',
      pic: 'assets/image6.jpg',
      fave: false,
      desc: 150,
      counter: 0),
  Products(
      name: 'Flusk',
      pic: 'assets/image3.jpg',
      fave: false,
      desc: 400,
      counter: 0),
  Products(
      name: 'Membrain',
      pic: 'assets/image5.jpg',
      fave: false,
      desc: 450,
      counter: 0)
];
