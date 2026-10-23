import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../main.dart';
import '../models/product.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;
  final String contact;
  final String storeName;

  const ProductDetailPage({
    super.key,
    required this.product,
    required this.contact,
    this.storeName = 'Toko Tegar',
  });

  Future<void> _order(BuildContext context) async {
    // Format contact for WhatsApp (international without +)
    String cleanNumber = contact.replaceAll(RegExp(r'[^0-9]'), '');
    if (cleanNumber.startsWith('0')) {
      cleanNumber = '62${cleanNumber.substring(1)}';
    }
    if (cleanNumber.isEmpty) {
      cleanNumber = '6281234567890';
    }

    final store = storeName.isEmpty ? 'Toko Tegar' : storeName;
    final message = Uri.encodeComponent(
      'Halo $store, saya ingin memesan ${product.name} ${product.weight} '
      'seharga Rp${_rupiah(product.price)}.',
    );
    final uri = Uri.parse('https://wa.me/$cleanNumber?text=$message');
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication) &&
        context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'WhatsApp tidak dapat dibuka. Periksa aplikasi atau nomor tujuan.',
          ),
        ),
      );
    }
  }

  String _rupiah(int value) => rupiah(value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pesan',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black87,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.black87),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SizedBox(height: 12),

          // Product name in RED (2 lines, centered, bold)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              '${product.name}\n${product.weight}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFFD32F2F),
                fontWeight: FontWeight.bold,
                fontSize: 18,
                height: 1.25,
              ),
            ),
          ),

          const SizedBox(height: 14),

          // Product image card (centered, rounded corners)
          Container(
            height: 220,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F3EF),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade300),
            ),
            clipBehavior: Clip.hardEdge,
            child: _detailGraphic(product),
          ),

          const SizedBox(height: 16),

          // Price in RED (bold, large)
          Text(
            'Rp${_rupiah(product.price)}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xFFD32F2F),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 18),

          // Order via WhatsApp button
          Center(
            child: InkWell(
              onTap: () => _order(context),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E824C),
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E824C).withOpacity(0.3),
                      blurRadius: 6,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // WhatsApp icon
                    Container(
                      width: 28,
                      height: 28,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chat_bubble_rounded,
                          color: Color(0xFF1E824C),
                          size: 18,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order via WhatsApp',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          'Klik di Sini',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {
          if (i == 0) {
            Navigator.pop(context);
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

  Widget _detailGraphic(Product p) {
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
            Icon(icon, size: 72, color: iconColor),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: iconColor.withOpacity(0.3)),
              ),
              child: Text(
                p.weight,
                style: TextStyle(
                  fontSize: 12,
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

