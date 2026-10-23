import 'package:flutter/material.dart';

import '../main.dart';
import '../models/product.dart';
import 'protein_page.dart';

class StoreHomePage extends StatefulWidget {
  final String storeName;
  final String ownerName;
  final String contact;

  const StoreHomePage({
    super.key,
    required this.storeName,
    required this.ownerName,
    required this.contact,
  });

  @override
  State<StoreHomePage> createState() => _StoreHomePageState();
}

class _StoreHomePageState extends State<StoreHomePage> {
  int _navIndex = 0;

  String get _displayName =>
      widget.storeName.trim().isEmpty ? 'Toko Tegar' : widget.storeName.trim();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black87),
          onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Menu $_displayName')),
          ),
        ),
        titleSpacing: 0,
        title: const Text(
          'Home',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.black87),
          ),
        ],
      ),
      body: _navIndex == 0
          ? _homeBody()
          : Center(
              child: Text(
                ['', 'Pencarian', 'Keranjang', 'Akun'][_navIndex],
                style: const TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _navIndex,
        onTap: (i) => setState(() => _navIndex = i),
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

  Widget _homeBody() => ListView(
        padding: const EdgeInsets.only(bottom: 24),
        children: [
          // Store name
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
            child: Text(
              _displayName,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),

          // Category icons (Row 1: 5 items, Row 2: Protein on the left)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                // Row 1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryItem(
                      label: 'Produk\nTerbaru',
                      color: const Color(0xFFFFA000),
                      iconWidget: const Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(Icons.star_rounded, color: Colors.white, size: 28),
                          Text(
                            'NEW',
                            style: TextStyle(
                              color: Color(0xFFFFA000),
                              fontWeight: FontWeight.w900,
                              fontSize: 8,
                            ),
                          ),
                        ],
                      ),
                      onTap: () {},
                    ),
                    _categoryItem(
                      label: 'Beli\nLagi',
                      color: const Color(0xFF81C784),
                      iconWidget: const Icon(
                        Icons.history_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      onTap: () {},
                    ),
                    _categoryItem(
                      label: 'Clearance\nSale',
                      color: const Color(0xFF42A5F5),
                      iconWidget: const Icon(
                        Icons.percent_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                      onTap: () {},
                    ),
                    _categoryItem(
                      label: 'Sayur',
                      color: const Color(0xFF4CAF50),
                      iconWidget: const Icon(
                        Icons.eco_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                      onTap: () {},
                    ),
                    _categoryItem(
                      label: 'Buah',
                      color: const Color(0xFFFF5252),
                      iconWidget: const Icon(
                        Icons.apple_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // Row 2: Protein on left
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _categoryItem(
                      label: 'Protein',
                      color: const Color(0xFFFF7043),
                      iconWidget: const Icon(
                        Icons.set_meal_rounded,
                        color: Colors.white,
                        size: 26,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProteinPage(
                              products: proteins,
                              contact: widget.contact,
                              storeName: _displayName,
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 60),
                    const SizedBox(width: 60),
                    const SizedBox(width: 60),
                    const SizedBox(width: 60),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          // Banner "Dikirim Besok"
          Container(
            height: 78,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFFFA000),
              borderRadius: BorderRadius.circular(6),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: const Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dikirim Besok',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Text(
                            'Ke Pilih Lokasi',
                            style: TextStyle(
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(
                            Icons.keyboard_arrow_down,
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.local_shipping_rounded,
                  size: 40,
                  color: Colors.white,
                ),
              ],
            ),
          ),

          // "Lihat Lebih Banyak v"
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Lihat Lebih Banyak',
                  style: TextStyle(
                    color: tokoGreen,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                SizedBox(width: 3),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                  color: tokoGreen,
                ),
              ],
            ),
          ),

          // Promo cards row (Komponen Bonus)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(child: _promoCard()),
                const SizedBox(width: 12),
                Expanded(child: _promoCard()),
              ],
            ),
          ),
        ],
      );

  Widget _categoryItem({
    required String label,
    required Color color,
    required Widget iconWidget,
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(26),
        child: SizedBox(
          width: 60,
          child: Column(
            children: [
              Container(
                width: 48,
                height: 48,
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
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
                  height: 1.1,
                ),
              ),
            ],
          ),
        ),
      );

  Widget _promoCard() => Container(
        height: 155,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            // Product jar and details
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 6),
                  // Jar illustration
                  Center(
                    child: Container(
                      width: 58,
                      height: 58,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF3E0),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: const Color(0xFFFFCC80)),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.kitchen_rounded,
                            size: 28,
                            color: Color(0xFFE65100),
                          ),
                          Text(
                            'Ngiler Jamur',
                            style: TextStyle(
                              fontSize: 7,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFE65100),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  // Strikethrough price
                  const Text(
                    'Rp 32.500',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  const SizedBox(height: 3),
                  // Discount price badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEB3B),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: const Text(
                      'Rp 100',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Red "100%" badge
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  color: Color(0xFFD32F2F),
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '100%',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}

