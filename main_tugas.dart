import 'package:flutter/material.dart';
import 'dart:async'; // Untuk timer

// Fungsi utama untuk menjalankan aplikasi
void main() {
  runApp(const MyApp());
}

class SearchBarExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Example'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              // Search Bar
              Expanded(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(Icons.search, color: Colors.grey),
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search here',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Button
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Icon(Icons.more_horiz, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Kelas utama aplikasi
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Menampilkan SplashScreen pertama kali
    );
  }
}

class CosmeticsHomePage extends StatelessWidget {
  const CosmeticsHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Bagian atas halaman (AppBar)
      appBar: AppBar(
        title: const Row(
          children: [
            FlutterLogo(size: 24),
            SizedBox(width: 8),
            Text('Camera E-Commerce'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CartPage()),
              );
            },
          ),
        ],
      ),
      // Isi utama halaman
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner promosi di bagian atas
            Container(
              padding: const EdgeInsets.all(50),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Penawaran Hari Ini',
                          style: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Diskon 50% untuk Produk Tertentu',
                          style: TextStyle(color: Colors.grey),
                        ),
                        ElevatedButton(
                          onPressed: () {}, // Tombol "Belanja Sekarang"
                          child: const Text('Belanja Sekarang'),
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 158, 193, 222)),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/gambar/r50.jpg', // Gambar promosi
                    width: 400,
                  ),
                ],
              ),
            ),

            // Bagian freelance terbaik
            const SectionTitle(title: 'Top Rated Freelances'),
            const FreelanceList(), // Widget daftar freelancer
            // Bagian layanan terbaik
            const SectionTitle(title: 'Layanan Terbaik'),
            const ServiceList(), // Daftar layanan
            // Bagian promosi terbaik
            const SectionTitle(title: 'Promosi Terbaik'),
            const PromotionBanner(), // Banner promosi
            // Bagian produk dengan rating tertinggi menggunakan GridView
            const SectionTitle(title: 'Produk Rating Tertinggi'),
            ProductGrid(), // Daftar produk
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Widget untuk menampilkan daftar freelancer
class FreelanceList extends StatelessWidget {
  const FreelanceList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // Tinggi widget daftar freelancer
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: freelanceData.length,
        itemBuilder: (context, index) {
          final freelancer = freelanceData[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(freelancer['imagePath']),
                  onBackgroundImageError: (_, __) {
                    debugPrint(
                        "Gambar tidak ditemukan: ${freelancer['imagePath']}");
                  },
                  child: freelancer['imagePath'] == null
                      ? const Icon(Icons.person, size: 40, color: Colors.grey)
                      : null, // Fallback gambar default
                ),
                const SizedBox(height: 8),
                Text(
                  freelancer['name'],
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  freelancer['profession'],
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      freelancer['rating'].toString(),
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Data freelancer
const List<Map<String, dynamic>> freelanceData = [
  {
    'name': 'Kamera 1',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/a6400.jpg',
  },
  {
    'name': 'Kamera 2',
    'profession': 'Mirrorless',
    'rating': 4.8,
    'imagePath': 'assets/gambar/x100s.jpg',
  },
  {
    'name': 'Kamera 3',
    'profession': 'Mirrorless',
    'rating': 4.7,
    'imagePath': 'assets/gambar/a6400.jpg',
  },
  {
    'name': 'Kamera 4',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/x100s.jpg',
  },
  {
    'name': 'Kamera 5',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/r50.jpg',
  },
  {
    'name': 'Kamera 6',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/x100s.jpg',
  },
  {
    'name': 'Kamera 7',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/a6400.jpg',
  },
  {
    'name': 'Kamera 8',
    'profession': 'Mirrorless',
    'rating': 4.9,
    'imagePath': 'assets/gambar/r50.jpg',
  },
];

class ProductGrid extends StatelessWidget {
  ProductGrid({super.key});

  // Daftar gambar produk
  final List<String> productImages = [
    'assets/gambar/x100s.jpg',
    'assets/gambar/r50.jpg',
    'assets/gambar/x100s.jpg',
    'assets/gambar/a6400.jpg',
    'assets/gambar/r50.jpg',
  ];

  // Daftar nama produk
  final List<String> productNames = [
    'Bedak',
    'Canon R50',
    'Fujifilm X100S',
    'Farfum',
    'Sony a6400r',
  ];

  // Daftar harga produk dalam dolar
  final List<double> productPrices = [
    3.00,
    40,
    333,
    50,
    4.33,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.2,
      ),
      itemCount: productImages.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Column(
            children: [
              Image.asset(
                'assets/product/${productImages[index]}',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 2),
              Text(productNames[index]),
              Text(
                  '\$${productPrices[index].toStringAsFixed(2)}'), // Harga dalam dolar
            ],
          ),
        );
      },
    );
  }
}

const List<String> productImages = [
  'r50.jpg',
  'assets/gambar/a6400.jpg',
  'assets/gambar/x100s.jpg',
  'assets/gambar/r50.jpg',
  'assets/gambar/x100s.jpg',
];

const List<String> productNames = [
  'Canon R50',
  'Farfum',
  'Fujifilm X100S',
  'Sony a6400r',
  'Bedak',
];

class Service {
  final String imagePath;
  final String name;
  final String subtitle;
  final String description;
  final double rating;

  Service({
    required this.imagePath,
    required this.name,
    required this.subtitle,
    required this.description,
    required this.rating,
  });
}

class ServiceList extends StatelessWidget {
  const ServiceList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Service> services = [
      Service(
        imagePath: 'assets/gambar/a6400.jpg',
        name: 'SONY A6400',
        subtitle: 'Mirrorless',
        description: 'Like New',
        rating: 4.9,
      ),
      Service(
        imagePath: 'assets/gambar/r50.jpg',
        name: 'CANON R50',
        subtitle: 'Mirrorless',
        description: 'New',
        rating: 4.7,
      ),
      Service(
        imagePath: 'assets/gambar/x100s.jpg',
        name: 'FUJIFILM X100S',
        subtitle: 'Mirrorless',
        description: 'Second Hand',
        rating: 4.8,
      ),
    ];

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Container(
            color: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Services',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Service List
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: services.length,
            itemBuilder: (context, index) {
              Service service = services[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15, vertical: 16.0), // Mengubah padding
                child: Stack(
                  children: [
                    Align(
                      alignment:
                          Alignment.centerLeft, // Gambar diposisikan ke kiri
                      child: Container(
                        width: 120, // Mengubah ukuran gambar
                        height: 120, // Mengubah ukuran gambar
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            service.imagePath,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Text('Error loading image'));
                            },
                          ),
                        ),
                      ),
                    ),
                    // Overlay Card
                    Positioned(
                      top: 0,
                      right: 50,
                      left: 200,
                      child: Container(
                        width: 240,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              blurRadius: 8,
                              offset: const Offset(10, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              service.subtitle,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              service.description,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            // const SizedBox(height: 0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.amber, size: 16),
                                    const SizedBox(width: 4),
                                    Text(
                                      '${service.rating}',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: 150, // Menetapkan lebar tombol
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 97, 157, 226),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      minimumSize:
                                          const Size(150, 40), // Ukuran minimal
                                    ),
                                    child: const Text(
                                      'Book Now',
                                      style: TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PromotionBanner extends StatelessWidget {
  const PromotionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(50),
      color: const Color.fromARGB(255, 255, 255, 255),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Diskon 60%', // Judul promosi
                  style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Dapatkan produk kamera dengan diskon dengan 60%! Cepat, tawaran segera berakhir, jangan sampe ketinggalan',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                ),
                ElevatedButton(
                  onPressed: () {}, // Tombol "Belanja Sekarang"
                  child: const Text(
                    'Belanja Sekarang',
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 50, 45, 139)),
                ),
              ],
            ),
          ),
          Image.asset(
            'assets/gambar/a6400.jpg', // Gambar promosi
            width: 400,
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CosmeticsHomePage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const FlutterLogo(size: 100), // Logo di tengah
            const SizedBox(height: 20),
            const Text(
              'Camera E-Commerce',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            CircularProgressIndicator(
              color: Colors.pink.shade200, // Indikator loading
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Canon R50',
      'price': 40,
      'quantity': 1,
      'image': 'assets/gambar/r50.jpg'
    },
    {
      'name': 'Fujifilm X100S',
      'price': 333,
      'quantity': 1,
      'image': 'assets/gambar/x100s.jpg'
    },
    {
      'name': 'Sony a6400r',
      'price': 50,
      'quantity': 1,
      'image': 'assets/gambar/a6400.jpg'
    },
  ];

  int discount = 4;
  int deliveryCharges = 2;

  // Memastikan item['quantity'] dan item['price'] tidak null sebelum dihitung
  int get subtotal {
    return cartItems.fold(0, (int sum, item) {
      final int price = item['price'] ?? 0; // Menggunakan 0 jika null
      final int quantity = item['quantity'] ?? 0; // Menggunakan 0 jika null
      return sum + (price * quantity); // Menghitung subtotal
    });
  }

  int get totalItems => cartItems.fold(0, (sum, item) {
        final int quantity =
            item['quantity'] ?? 0; // Pastikan quantity tidak null
        return sum + quantity; // Menghitung jumlah total item
      });

  @override
  Widget build(BuildContext context) {
    int total = subtotal - discount + deliveryCharges;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ListTile(
                    leading: Image.asset(item['image'],
                        width: 50, fit: BoxFit.cover),
                    title: Text(item['name']),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price: \$${item['price']}'),
                        Text('Quantity: ${item['quantity']}'),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove_circle),
                          onPressed: () {
                            setState(() {
                              if (item['quantity'] > 1) {
                                item['quantity']--;
                              }
                            });
                          },
                        ),
                        Text('${item['quantity']}'),
                        IconButton(
                          icon: const Icon(Icons.add_circle),
                          onPressed: () {
                            setState(() {
                              item['quantity']++;
                            });
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              cartItems.removeAt(index); // Menghapus item
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  content: Text(
                                      '${item['name']} telah dihapus dari keranjang')),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Menambahkan total jumlah item di atas subtotal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total Items:'),
                    Text('${totalItems} items'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Subtotal:'),
                    Text('\$${subtotal}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Discount:'),
                    Text('-\$${discount}'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Delivery Charges:'),
                    Text('\$${deliveryCharges}'),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('\$${total}',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Tampilkan Snackbar
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Checkout berhasil!'),
                        duration: Duration(seconds: 2), // Lama durasi snackbar
                        behavior: SnackBarBehavior.floating, // Posisi Snackbar
                      ),
                    );
                  },
                  child: const Text(
                    'Check Out',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 128, 199, 234),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
