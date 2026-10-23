import 'package:flutter/material.dart';

import '../main.dart';
import '../models/product.dart';
import 'product_detail_page.dart';

class ProteinPage extends StatefulWidget {
  final List<Product> products;
  final String contact;
  final String storeName;

  const ProteinPage({
    super.key,
    required this.products,
    required this.contact,
    this.storeName = 'Toko Tegar',
  });

  @override
  State<ProteinPage> createState() => _ProteinPageState();
}

class _ProteinPageState extends State<ProteinPage> {
  String _filter = 'Semua';
  int _navIndex = 0;

  String _rupiah(int value) => rupiah(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        titleSpacing: 0,
        title: Container(
          height: 38,
          margin: const EdgeInsets.only(right: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFF2F2F2),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, size: 18, color: Colors.grey),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Cari lebih banyak di ${widget.storeName.isEmpty ? 'Toko Tegar' : widget.storeName}',
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Horizontal category list with underline on active item
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              children: [
                _sliderCategoryItem(
                  label: 'Produk\nTerbaru',
                  color: const Color(0xFFFFA000),
                  iconWidget: const Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(Icons.star_rounded, color: Colors.white, size: 24),
                      Text(
                        'NEW',
                        style: TextStyle(
                          color: Color(0xFFFFA000),
                          fontWeight: FontWeight.w900,
                          fontSize: 7,
                        ),
                      ),
                    ],
                  ),
                  isActive: false,
                ),
                _sliderCategoryItem(
                  label: 'Beli\nLagi',
                  color: const Color(0xFF81C784),
                  iconWidget: const Icon(
                    Icons.history_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  isActive: false,
                ),
                _sliderCategoryItem(
                  label: 'Protein',
                  color: const Color(0xFFFF7043),
                  iconWidget: const Icon(
                    Icons.set_meal_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  isActive: true,
                ),
                _sliderCategoryItem(
                  label: 'Sayur',
                  color: const Color(0xFF4CAF50),
                  iconWidget: const Icon(
                    Icons.eco_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  isActive: false,
                ),
                _sliderCategoryItem(
                  label: 'Buah',
                  color: const Color(0xFFFF5252),
                  iconWidget: const Icon(
                    Icons.apple_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  isActive: false,
                ),
              ],
            ),
          ),

          // Filter chips
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                // Filter icon button chip
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.tune_rounded, size: 14, color: Colors.black87),
                      SizedBox(width: 4),
                      Text(
                        'Filter',
                        style: TextStyle(fontSize: 11, color: Colors.black87),
                      ),
                    ],
                  ),
                ),
                _filterChip('Semua'),
                _filterChip('Aneka Protein Segar'),
                _filterChip('Beku'),
              ],
            ),
          ),

          // Section title
          const Padding(
            padding: EdgeInsets.fromLTRB(14, 12, 14, 6),
            child: Text(
              'Aneka Protein Segar',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
          ),

          // Product grid (3 columns)
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.58,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
              ),
              itemCount: widget.products.length,
              itemBuilder: (context, i) {
                final p = widget.products[i];
                return InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ProductDetailPage(
                        product: p,
                        contact: widget.contact,
                        storeName: widget.storeName,
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product visual container
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Container(
                          height: 98,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F3EE),
                            border: Border.all(color: Colors.grey.shade200),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              _productGraphic(p),
                              Positioned(
                                right: 4,
                                top: 4,
                                child: Container(
                                  width: 22,
                                  height: 22,
                                  decoration: const BoxDecoration(
                                    color: tokoGreen,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      // Price
                      Text(
                        'Rp${_rupiah(p.price)}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 11,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      // Name & Weight
                      Text(
                        '${p.name} ${p.weight}',
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black87,
                          height: 1.15,
                        ),
                      ),
                      const Spacer(),
                      // Stock status
                      Text(
                        p.stock ?? 'Stok tersedia',
                        style: TextStyle(
                          color: p.stock != null
                              ? Colors.grey.shade600
                              : tokoGreen,
                          fontSize: 9,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Floating Cart Bar (Komponen Bonus)
          Container(
            height: 44,
            margin: const EdgeInsets.fromLTRB(12, 4, 12, 6),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: tokoGreen,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Lihat Keranjang',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      '0 Barang',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Rp0',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (i) {
          if (i == 0) {
            Navigator.pop(context);
          } else {
            setState(() => _navIndex = i);
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: tokoGreen,
        unselectedItemColor: Colors.grey.shade500,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Cari',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket_outlined),
            label: 'Keranjang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Akun',
          ),
        ],
      ),
    );
  }

  Widget _sliderCategoryItem({
    required String label,
    required Color color,
    required Widget iconWidget,
    required bool isActive,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SizedBox(
          width: 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(child: iconWidget),
              ),
              const SizedBox(height: 4),
              Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  color: isActive ? tokoGreen : Colors.black87,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 3),
              if (isActive)
                Container(
                  height: 3,
                  width: 34,
                  decoration: BoxDecoration(
                    color: tokoGreen,
                    borderRadius: BorderRadius.circular(2),
                  ),
                )
              else
                const SizedBox(height: 3),
            ],
          ),
        ),
      );

  Widget _filterChip(String title) {
    final bool isSelected = _filter == title;
    return GestureDetector(
      onTap: () => setState(() => _filter = title),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? tokoGreen : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? tokoGreen : Colors.grey.shade300,
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 11,
            color: isSelected ? Colors.white : Colors.black87,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget _productGraphic(Product p) {
    // Generate an illustrative food visual representing the protein item
    IconData icon;
    Color iconColor;
    Color bgTint;
    if (p.name.contains('Teri') || p.name.contains('Ikan')) {
      icon = Icons.set_meal_rounded;
      iconColor = const Color(0xFF0288D1);
      bgTint = const Color(0xFFE1F5FE);
    } else if (p.name.contains('Iga')) {
      icon = Icons.dinner_dining_rounded;
      iconColor = const Color(0xFFC2185B);
      bgTint = const Color(0xFFFCE4EC);
    } else {
      icon = Icons.kebab_dining_rounded;
      iconColor = const Color(0xFFD32F2F);
      bgTint = const Color(0xFFFFEBEE);
    }

    return Container(
      color: bgTint,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: iconColor),
            const SizedBox(height: 4),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.85),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Text(
                p.weight,
                style: TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

