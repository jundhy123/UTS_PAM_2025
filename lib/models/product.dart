class Product {
  final String name;
  final String weight;
  final int price;
  final String imagePath;
  final String? stock;

  const Product(
    this.name,
    this.weight,
    this.price,
    this.imagePath, {
    this.stock,
  });
}

const List<Product> proteins = [
  Product(
    'Sayurbox Daging Giling Segar',
    '250g',
    51900,
    'assets/images/daging_giling.jpg',
    stock: 'Sisa 3',
  ),
  Product(
    'Daging Has Luar Segar',
    '250g',
    49900,
    'assets/images/daging_sapi_giling.jpg',
    stock: 'Sisa 1',
  ),
  Product(
    'Sayurbox Daging Sengkel Segar',
    '250g',
    49900,
    'assets/images/daging_sapi.jpg',
    stock: 'Sisa 3',
  ),
  Product(
    'Daging Has Dalam Segar',
    '250g',
    62900,
    'assets/images/hati_sapi.jpg',
  ),
  Product(
    'Sayurbox Iga Sapi Segar',
    '500g',
    64900,
    'assets/images/iga_sapi.jpg',
  ),
  Product(
    'Teri Nasi Basah Tidak Beku',
    '100g',
    26100,
    'assets/images/teri_medan.jpg',
  ),
];

String rupiah(int value) => value
    .toString()
    .replaceAllMapped(RegExp(r'\B(?=(\d{3})+(?!\d))'), (_) => '.');

