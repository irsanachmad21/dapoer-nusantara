import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  /// Key untuk form
  final _formKey = GlobalKey<FormState>();

  /// Controller untuk input
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _drinkController = TextEditingController();

  @override
  void dispose() {
    /// Bersihkan controller ketika state sudah tidak digunakan
    _nameController.dispose();
    _foodController.dispose();
    _drinkController.dispose();
    super.dispose();
  }

  /// Fungsi untuk menampilkan dialog
  void _showDialog(String nama, String makanan, String minuman) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Informasi Input"),
          content: Text(
            "Nama: $nama\nMakanan Favorit: $makanan\nMinuman Favorit: $minuman",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Input Nama
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nama',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              /// Input Makanan Favorit
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Makanan Favorit',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _foodController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Makanan favorit tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              /// Input Minuman Favorit
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Minuman Favorit',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: _drinkController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Minuman favorit tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              /// Tombol Submit berada di tengah
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    /// Validasi form
                    if (_formKey.currentState!.validate()) {
                      /// Ambil nilai input
                      String nama = _nameController.text;
                      String makanan = _foodController.text;
                      String minuman = _drinkController.text;

                      /// Tampilkan dialog
                      _showDialog(nama, makanan, minuman);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF00AA13),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
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
}
