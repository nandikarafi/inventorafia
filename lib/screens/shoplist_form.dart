import 'package:flutter/material.dart';
class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Selamat berbelanja Murah',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
          child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Nama Item",
              labelText: "Nama Item",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
            onChanged: (String? value) {
              setState(() {
                _name = value!;
              });
            },
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return "Item tidak boleh kosong!";
              }
              return null;
            },
          ),
        ),
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Harga",
            labelText: "Harga",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (String? value) {
            setState(() {
              _price = int.parse(value!);
            });
          },
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return "Harga tidak boleh kosong!";
            }
            if (int.tryParse(value) == null) {
              return "Harga harus berupa angka!";
            }
            return null;
          },
        ),
      ),
      Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: "Deskripsi",
          labelText: "Deskripsi",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (String? value) {
          setState(() {
            _description = value!;
          });
        },
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return "Deskripsi wajib diisi !";
          }
          return null;
        },
      ),
    ),
      Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.indigo),
          ),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
               showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Item berhasil tersimpan'),
                    content: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text('Nama: $_name'),
                          Text('Harga: $_price'),
                          Text('Desikripsi: $_description')
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            "Save",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ),
          ]),
        ),
      ));
    }
}