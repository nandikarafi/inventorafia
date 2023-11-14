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
  ShopItem("Tambah Produk", Icons.add_shopping_cart, Colors.red), // Warna merah
  ShopItem("Logout", Icons.logout, Colors.green), // Warna hijau
];
```

Setelah itu pada kelas ShopCard, saya menggunakan warna latar belakang yang telah dilakukan dengan mengubah kode berikut.

```
class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.backgroundColor, // Menggunakan warna latar belakang dari item
      child: InkWell(
        // ... kode lainnya ...
      ),
    );
  }
}
```

Jadi itu yang saya lakukan dalam membuat program saya. Sekian terima kasih.

# Tugas 8

## Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!

Navigator.push(): 
- berfungsi untuk menambahkan halaman baru ke tumpukan navigasi.
- menambahkan halaman baru ke tumpukan navigasi, yang berarti pengguna dapat kembali ke halaman sebelumnya.

Navigator.pushReplacement(): 
- berfungsi untuk menambahkan halaman baru ke tumpukan navigasi dan menggantikan (replace) halaman sekarang dengan halaman baru tersebut.
- menambahkan halaman baru ke tumpukan navigasi dan menghapus halaman sekarang dari tumpukan, sehingga pengguna tidak dapat kembali ke halaman sebelumnya dengan tombol kembali.

Contoh Penggunaan Navigator.push() :
```
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewPage()),
);
```

Contoh Penggunaan Navigator.pushReplacement():
```
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => SecondPage()),
);
```

## Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!

Berikut adalah beberapa widget layout dan kegunaaanya :

- Scaffold: Struktur dasar dari user interface material di Flutter yang menyediakan kerangka kerja untuk membangun aplikasi yang terdiri dari app bar, body, drawer, dan banyak elemen antarmuka pengguna lainnya.
 
- AppBar: Bagian atas halaman yang dapat berisi judul, ikon, dan berbagai elemen lainnya. Ini adalah tempat umum untuk menempatkan elemen navigasi dan kontrol lainnya. Contoh Penggunaan : Menyediakan app bar dengan judul "Form Tambah Item" dan tata letaknya di bagian atas halaman.

- Form: Widget yang menyimpan satu set kontrol form. Form ini dapat memiliki validasi, dan Anda dapat menangkap data dari form menggunakan kunci global (GlobalKey<FormState>).
  Konteks Penggunaan: Digunakan untuk membungkus elemen-elemen form seperti TextFormField untuk menangani input pengguna dan validasi.

- SingleChildScrollView: Widget yang memberikan konten yang dapat digulirkan yang digunakan untuk mengatasi masalah overflow ketika kontennya melebihi ukuran layar.(membungkus semua elemen).

- Column: Widget yang menyusun anak-anaknya secara vertikal, seperti judul, GridView, dan sebagainya.

- Padding: Widget yang menambahkan ruang kosong di sekitar elemen-elemen dalam Column.

- GridView: Widget yang digunakan untuk menampilkan elemen-elemen dalam grid, seperti ShopCard yang mewakili item-item di halaman utama.

- ShopCard:widget kustom yang mewakili kartu untuk setiap item toko dengan tindakan yang sesuai ketika diklik.

- AlertDialog: widget untuk menampilkan pesan konfirmasi setelah menyimpan item di halaman form.

## Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!

Berikut adalah elemen input yang digunakan dalam ShopFormPage:

TextFormField untuk Nama Item, Hargam dan Deskripsi:

Alasan Penggunaannya adalah :
TextFormField digunakan untuk memungkinkan pengguna memasukkan nama item , harga item, dan deskripsi item.
onChanged digunakan untuk memperbarui variabel _name , _price , dan _description setiap kali pengguna memasukkan teks.
validator digunakan untuk 
- memberikan pesan kesalahan jika pengguna tidak memasukkan nama item.
- memberikan pesan kesalahan jika pengguna tidak memasukkan harga atau jika input tidak valid
- memberikan pesan kesalahan jika pengguna tidak memasukkan deskripsi.

## Bagaimana penerapan clean architecture pada aplikasi Flutter?
Clean Architecture adalah sebuah konsep arsitektur perangkat lunak yang bertujuan untuk memisahkan konsep-konsep bisnis inti dari perincian teknis dan infrastruktur.

- Entities :  bagian dari domain model yang mendefinisikan aturan bisnis dan data inti.
- Use Cases : Mewakili aturan bisnis atau operasi yang spesifik.
- Interfaces : Memisahkan detail teknis dari use cases dan entitas.
- Frameworks dan Drivers : Merupakan lapisan terluar yang berisi detail teknis seperti UI, database, dan perangkat keras.
- Presenters dan View Models : memformat dan menyiapkan data yang diperlukan oleh UI
- Dependency Rule : Arsitektur Clean mengikuti aturan bahwa arah ketergantungan selalu menuju ke arah bisnis inti
- Testing : memudahkan pengujian karena logika bisnis terpisah dari detail implementasi

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)

Sebelum membuat drawer, saya membuat berkas baru pada lib/widgets bernama shop_card.dart. Saya memindahkan isi widget ShopItem pada menu.dart ke file shop_card.dart. Saya juga tak lupa untuk mengimpor halaman shop_card.dart.

Saya juga membuat folder baru bernama screens pada folder lib. Folder screens, berisi menu.dart. Sedangkan folder widgets berisi shop_card.dart. Saya juga tak lupa mengimport apa saja yang diperlukan pada setiap file.

Kemudian, saya membuat drawer menu untuk navigasi.
Saya membuat sebuah file baru bernama left_drawer.dart yang terletak pada folder widgets. Adapun isi kodenya sebagai berikut.

```
import 'package:flutter/material.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            // Bagian drawer header
          ),
          // Bagian routing
        ],
      ),
    );
  }
}
```
Saya juga tak lupa untuk mengimport halaman-halaman yang ingin saya masukkan ke dalam drawer menu.

```
import 'package:flutter/material.dart';
import 'package:inventorafia/menu.dart';
```

Selanjutnya saya mengisi bagian routing dengan kode berikut.

```
...
ListTile(
  leading: const Icon(Icons.home_outlined),
  title: const Text('Halaman Utama'),
  // Bagian redirection ke MyHomePage
  onTap: () {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  },
),
ListTile(
  leading: const Icon(Icons.add_shopping_cart),
  title: const Text('Tambah Item'),
  // Bagian redirection ke ShopFormPage
  onTap: () {
    /*
    routing ke ShopFormPage di sini,
    setelah halaman ShopFormPage sudah dibuat.
    */
  },
),
...
```

Seteleh mengisi bagian routing, saya menambahkan pada bagian drawer header. Adapun kodenya sebagai berikut.

```
...
const DrawerHeader(
  decoration: BoxDecoration(
    color: Colors.indigo,
  ),
  child: Column(
    children: [
      Text(
        'Shopping List',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      Padding(padding: EdgeInsets.all(10)),
      Text(
      "Catat seluruh keperluan belanjamu di sini!",
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.normal,
        ),
      ),
    ],
  ),
),
...
```

Setelah berhasil membuat drawer menu, saya ke menu.dart dan mengimport drawer tersebut dengan cara sebagai berikut.

```
import 'package:inventorafia/widgets/left_drawer.dart';
```

Lalu tambahkan kode sebagai berikut.

```
return Scaffold(
  appBar: AppBar(
    title: const Text(
      'LIST DE RAFIA',
    ),
  ),
  drawer: const LeftDrawer(),
  ....
),
```

Setelah itu, saya menambahkan form dan elemen input. Saya membuat file shoplist_form.dart pada folder screens.

```
import 'package:flutter/material.dart';

class ShopFormPage extends StatefulWidget {
    const ShopFormPage({super.key});

    @override
    State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Form Tambah Item',
            ),
          ),
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
        ),
        // drawer yang sudah dibuat
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(),
        ),
      );
    }
}
```

Pada kode, Widget Form berfungsi sebagai wadah bagi beberapa input field widget yang nanti akan saya buat. Widget SingleChildScrollView berfungsi untuk membuat child widget di dalamnya menjadi scrollable.
Variabel bernama _formKey dalam Atribut key akan berfungsi sebagai handler dari form state, validasi form, dan penyimpanan form.

Setelah itu, saya mulai mengisi widget Form dengan field. Dengan kode berikut.

```
class _ShopFormPageState extends State<ShopFormPage> {
    final _formKey = GlobalKey<FormState>();
    String _name = "";
    int _price = 0;
    String _description = "";
....
....
....
}
```

Lalu saya menambahkan widget Column sebagai child dari SingleChildScrollView.

Setelah itu, saya membuat widget TextFormField yang dibungkus oleh Padding sebagai salah satu children dari widget Column.

Adapun kodenya sebagai berikut.

```
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
                return "Nama tidak boleh kosong!";
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
            return "Deskripsi tidak boleh kosong!";
          }
          return null;
        },
      ),
    ),
...
...
  ],
....
),
```

Selanjutnya, saya membuat tombol child dari Column. Saya akan memunculkannnya pada pop-up yang akan muncul setelah tombol ditekan.

```
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

```

Pada kode tersebut, juga saya menambahkan fungsi showDialog() pada bagian onPressed() dan memunculkan widget AlertDialog. Saya juga menambahkan fungsi reset form.

Selanjutnya, saya menambahkan fitur navigasi pada tombol. Pada file shop_card.dart, saya menambahkan kode berikut.

```
onTap: () {
  // Memunculkan SnackBar ketika diklik
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(
        content: Text("Kamu telah menekan tombol ${item.name}!")));

  // Navigate ke route yang sesuai (tergantung jenis tombol)
  if (item.name == "Tambah Item") {
    // Menggunakan Navigator.push untuk melakukan navigasi ke MaterialPageRoute yang mencakup ShopFormPage.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            const ShopFormPage(), 
      ),
    );
  }
},

```

Saya menambahkan kode tersebut agar form dapat diakses melalui card. Sekian dari saya, terima kasih.

