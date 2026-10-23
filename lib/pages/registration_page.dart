import 'package:flutter/material.dart';

import '../main.dart';
import 'store_home_page.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _namaToko = TextEditingController();
  final _namaPemilik = TextEditingController();
  final _alamat = TextEditingController();
  final _kontak = TextEditingController();
  String _jenisUsaha = 'Makanan & Minuman';
  bool _setuju = false;

  @override
  void dispose() {
    _namaToko.dispose();
    _namaPemilik.dispose();
    _alamat.dispose();
    _kontak.dispose();
    super.dispose();
  }

  InputDecoration _decoration(String label) => InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey.shade600, fontSize: 13),
        filled: true,
        fillColor: const Color(0xFFFFF5FB),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: tokoGreen, width: 1.5),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrasi Pemilik Toko',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            children: [
              _field(_namaToko, 'Nama Toko'),
              const SizedBox(height: 14),
              _field(_namaPemilik, 'Nama Pemilik'),
              const SizedBox(height: 14),
              DropdownButtonFormField<String>(
                value: _jenisUsaha,
                decoration: _decoration('Jenis Usaha'),
                icon: const Icon(Icons.arrow_drop_down, color: Colors.black54),
                items: const [
                  'Makanan & Minuman',
                  'Sembako',
                  'Sayur Mayur',
                  'Lainnya',
                ]
                    .map((v) =>
                        DropdownMenuItem(value: v, child: Text(v, style: const TextStyle(fontSize: 14))))
                    .toList(),
                onChanged: (v) =>
                    setState(() => _jenisUsaha = v ?? 'Makanan & Minuman'),
              ),
              const SizedBox(height: 14),
              _field(_alamat, 'Alamat Toko'),
              const SizedBox(height: 14),
              _field(_kontak, 'Kontak', keyboard: TextInputType.phone),
              const SizedBox(height: 12),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _setuju,
                    activeColor: tokoGreen,
                    onChanged: (v) => setState(() => _setuju = v ?? false),
                  ),
                  const Expanded(
                    child: Text(
                      'Saya menyetujui syarat dan ketentuan',
                      style: TextStyle(fontSize: 13, color: Colors.black87),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: SizedBox(
                  width: 140,
                  height: 38,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF7F2F6),
                      foregroundColor: Colors.black87,
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                        side: const BorderSide(color: Color(0xFFDDD4DD)),
                      ),
                    ),
                    onPressed: () {
                      if (!_formKey.currentState!.validate()) return;
                      if (!_setuju) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Centang persetujuan syarat dan ketentuan terlebih dahulu.',
                            ),
                          ),
                        );
                        return;
                      }
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => StoreHomePage(
                            storeName: _namaToko.text.trim().isEmpty
                                ? 'Toko Tegar'
                                : _namaToko.text.trim(),
                            ownerName: _namaPemilik.text.trim(),
                            contact: _kontak.text.trim().isEmpty
                                ? '08123456789'
                                : _kontak.text.trim(),
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Submit',
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _field(
    TextEditingController controller,
    String label, {
    TextInputType keyboard = TextInputType.text,
  }) =>
      TextFormField(
        controller: controller,
        keyboardType: keyboard,
        style: const TextStyle(fontSize: 14),
        decoration: _decoration(label),
        validator: (v) =>
            (v == null || v.trim().isEmpty) ? '$label wajib diisi' : null,
      );
}
