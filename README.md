# inventorafia
Nandika Rafi Atallah
2206082745
PBP C

# Tugas 7 

## Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
Perbedaan utama antara Stateless Widget dan Stateful Widget dalam konteks pengembangan aplikasi Flutter adalah bagaimana cara mengelola dan merespons perubahan data serta tampilan aplikasi:

Stateless Widget:
- Tidak memiliki keadaan internal yang berubah.
- Widget ini bersifat statis yang berarti tampilan dan data yang ditampilkan pada widget ini tidak akan berubah selama widget ini ada dalam pohon widget.
- Biasanya digunakan untuk tampilan yang tidak memerlukan perubahan dinamis, seperti teks statis atau ikon yang tidak berubah.
- Stateless widget lebih efisien dalam hal kinerja karena tidak perlu mengelola keadaan atau merender ulang ketika data atau keadaan berubah.

Stateful Widget:
- Memiliki keadaan internal yang bisa berubah.
- Widget ini memungkinkan Anda untuk merespons perubahan data atau peristiwa yang mempengaruhi tampilan aplikasi.
- Digunakan ketika memperbarui tampilan berdasarkan perubahan keadaan atau data, seperti mengubah teks, gambar, atau mengganti halaman.
- Mempunyai objek State terkait yang mengelola keadaan dan perubahan dalam widget. Ini berarti, saat keadaan berubah, hanya State yang diubah dan bukan seluruh widget, sehingga lebih efisien.

Contohnya :  jika ingin membuat tombol yang dapat mengubah teks ketika ditekan, kita dapat menggunakan Stateful Widget. Sedangkan jika hanya ingin menampilkan teks statis yang tidak berubah, kita dapat menggunakan Stateless Widget.

## Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Widget yang saya gunakan untuk menyelesaikan tugas ini terdiri atas beberapa widget yang akan dijelaskan sebagai berikut.

- MyHomePage (StatelessWidget):
    - Ini adalah kelas utama yang mewakili halaman utama aplikasi. 
    - Menerima daftar ShopItem sebagai properti yang akan ditampilkan dalam card.
    - Menggunakan Scaffold sebagai kerangka dasar halaman dengan AppBar dan body.

- ShopItem:
Ini adalah kelas untuk merepresentasikan item toko, yang memiliki tiga properti: name, icon, dan backgroundColor.
    - name: Nama item.
    - icon: Ikon yang akan ditampilkan di card.
    - backgroundColor: Warna latar belakang card.

- ShopCard (StatelessWidget):
    - Ini adalah kelas yang digunakan untuk membuat card untuk setiap item toko.
    - Menerima ShopItem sebagai properti.
    - Menggunakan Material sebagai latar belakang card dengan warna yang sesuai.
    - Menggunakan InkWell agar card responsif terhadap sentuhan.
    - Ketika card ditekan, ia menampilkan SnackBar yang memberi tahu pengguna bahwa item telah ditekan.
    - Memuat ikon dan teks untuk item tersebut.

- Scaffold:
    - Ini adalah kerangka dasar yang digunakan untuk membuat tampilan halaman dengan AppBar di bagian atas dan body di bawahnya.

- AppBar:
    - Ini adalah bilah aplikasi di bagian atas halaman yang menampilkan judul aplikasi.

- SingleChildScrollView:
    - Ini adalah widget yang memungkinkan kontennya dapat discroll jika melebihi ukuran layar.

- Padding:
    - Digunakan untuk menambahkan jarak (padding) ke konten yang dibungkusnya.

- Column:
    - Digunakan untuk menampilkan widget-children secara vertikal.

- GridView.count:
    - Digunakan untuk membuat grid layout dengan jumlah kolom yang tetap.
    - Setiap item dalam daftar items diambil dan diubah menjadi ShopCard yang ditampilkan dalam grid.

- Icon:
    - Menampilkan ikon yang sesuai untuk setiap item toko.

- Text:
    - Menampilkan teks dengan nama item toko.

- SnackBar:
    - Muncul ketika card ditekan dan memberi tahu pengguna tindakan yang dilakukan.

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)

Setelah melakukan instalasi pada flutter, saya membuka direktori dimana saya akan membuat proyek flutter. Saya pun membuka terminal dan menjalankan perintah

```
flutter create inventorafia
cd inventorafia
```

Setelah itu, saya merapihkan struktur proyek. Saya membuat file baru bernama menu.dart pada direktori inventorafia/lib. Pada baris pertama file tersebut, saya menambahkan kode berikut.

```
import 'package:flutter/material.dart';
```

Kemudian saya memindahkan isi main.dart yaitu untuk kelas MyHomePage dan kelas _MyHomePageState ke menu.dart

```
class MyHomePage ... {
    ...
}

class _MyHomePageState ... {
    ...
}
```

Setelah itu, pada main.dart saya menambahkan

```
import 'package:inventorafia/menu.dart';
```

Hal itu saya lakukan agar tidak terjadi error pada bagian

```
home: const MyHomePage(title: 'Flutter Demo Home Page'),
```

Kemudian, saya mengubah MyHomePage(title: 'Flutter Demo Home Page') menjadi MyHomePage().

Setelah itu, saya melakukan perubahan sifat widget dari stateful menjadi stateless seperti berikut.

```
class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            ...
        );
    }
}
```

Saya juga tak lupa untuk hapus fungsi State yang ada dibawah bagian stateless widget tersebut.

Setelah itu pada menu.dart, saya mendefine tipe pada list saya dengan menambahkan sebagai berikut.

```
class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}
```

Setelah itu, saya menambahkan kode ini dibawah MyHomePage({Key? key}) : super(key: key)

```
final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
];
```

Lalu saya menambahkan kode di Widget build

```
return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
        ),
      ),
      body: SingleChildScrollView(
        // Widget wrapper yang dapat discroll
        child: Padding(
          padding: const EdgeInsets.all(10.0), // Set padding dari halaman
          child: Column(
            // Widget untuk menampilkan children secara vertikal
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                child: Text(
                  'Inventorafia de Winkel', // Text yang menandakan toko
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Grid layout
              GridView.count(
                // Container pada card kita.
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.map((ShopItem item) {
                  // Iterasi untuk setiap item
                  return ShopCard(item);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
```

Untuk mengatasi error, saya membuat widget stateless baru untuk menampilkan card pada menu.bart

```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.indigo,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
        child: Container(
          // Container untuk menyimpan Icon dan Text
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```
Pada bagian ini,

```
 // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
```

Disitu saya membuat bagaimana caranya jika saya menekan salah satu tombol akan memunculkan Snackbar sesuai tombol yang saya tekan

Dalam mengatasi agar warna setiap button berbeda, saya menambahkan properti warna ke dalam kelas ShopItem

```
class ShopItem {
  final String name;
  final IconData icon;
  final Color backgroundColor; // Tambahkan properti warna

  ShopItem(this.name, this.icon, this.backgroundColor);
}
```

Kemudian, saya mengubah inisialisasi daftar items dengan memberikan warna latar belakang yang berbeda

```
final List<ShopItem> items = [
  ShopItem("Lihat Produk", Icons.checklist, Colors.blue), // Warna biru
  ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.red), // Warna hijau
  ShopItem("Logout", Icons.logout, Colors.green), // Warna merah
];
```

Setelah itu pada kelas ShopCard, saya menggunakan warna latar belakang yang telah dilakukan dengan mengubah kode berikut.

```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.backgroundColor, // Gunakan warna latar belakang dari item
      child: InkWell(
        // ... kode lainnya ...
      ),
    );
  }
}
```

Jadi itu yang saya lakukan dalam membuat program saya. Sekian terima kasih.

