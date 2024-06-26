class NewProduct {
  String image;
  String title;
  String price;
  bool like;

  NewProduct(
      {required this.image,
      required this.like,
      required this.title,
      required this.price});
}

List<NewProduct> newProductList = [
  NewProduct(
      image: 'assets/image3.jpg', like: false, title: 'Flask', price: '400 LE'),
  NewProduct(
      image: 'assets/image5.jpg',
      like: false,
      title: 'Membrain',
      price: '450 LE')
];
