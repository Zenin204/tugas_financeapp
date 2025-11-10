import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../widgets/atm_card.dart';
import '../widgets/transaction_item.dart';
import '../models/transaction.dart';
import '../widgets/quick_action_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      TransactionModel('Coffee Shop', '-Rp35.000', 'Food'),
      TransactionModel('Grab Ride', '-Rp25.000', 'Travel'),
      TransactionModel('Gym Membership', '-Rp150.000', 'Health'),
      TransactionModel('Movie Ticket', '-Rp60.000', 'Event'),
      TransactionModel('Salary', '+Rp5.000.000', 'Income'),
      TransactionModel('Online Shopping', '-Rp80.000', 'Shopping'),
      TransactionModel('Electricity Bill', '-Rp120.000', 'Utilities'),
    ];

    // === PERUBAHAN: Warna kartu disesuaikan dengan screenshot ===
    final cardData = [
      {
        'bankName': 'Bank A',
        'cardNumber': '**** 2345',
        'balance': 'Rp12.500.000',
        'color1': const Color(0xFF84A98C), // Hijau Zaitun
        'color2': const Color(0xFF52796F),
        'bankIcon': Icons.credit_card // Ganti ikonnya
      },
      {
        'bankName': 'Bank B',
        'cardNumber': '**** 8765',
        'balance': 'Rp5.350.000',
        'color1': const Color(0xFF0077B6), // Biru Cerah
        'color2': const Color(0xFF023E8A),
        'bankIcon': Icons.credit_card
      },
      {
        'bankName': 'Bank C',
        'cardNumber': '**** 1122',
        'balance': 'Rp2.700.000',
        'color1': const Color(0xFF354F52), // Hijau Tua
        'color2': const Color(0xFF2F3E46),
        'bankIcon': Icons.account_balance
      },
      {
        'bankName': 'E-Wallet',
        'cardNumber': '**** 9090',
        'balance': 'Rp50.500.000',
        'color1': const Color(0xFF343A40), // Abu-abu Tua
        'color2': const Color(0xFF1B1B1B),
        'bankIcon': Icons.wallet // Ganti ikonnya
      },
    ];
    // === BATAS PERUBAHAN KARTU ===

    return Scaffold(
      // === PERUBAHAN: Latar belakang utama (gelap) ===
      backgroundColor: const Color(0xFF1A202C), 

      // === PERUBAHAN: AppBar (gelap) ===
      appBar: AppBar(
        backgroundColor: const Color(0xFF2D3748), // Abu-abu tua (lebih terang)
        elevation: 2,
        title: const Text(
          'Finance Mate',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // Teks jadi putih
          ),
        ),
        centerTitle: true,
        foregroundColor: Colors.white, // Ikon jadi putih
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.1), // Latar transparan
            child: const Icon(
              Icons.person,
              color: Colors.white, // Ikon putih
            ),
          ).animate().fadeIn(delay: 100.ms).scale(),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications_none_rounded,
              color: Colors.white, // Ikon putih
            ),
            onPressed: () {},
          ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.5),
        ],
      ),
      // === BATAS PERUBAHAN APPBAR ===

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // === PERUBAHAN: Teks header (putih) ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selamat Datang,', // Sesuai screenshot
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ).animate().fadeIn(delay: 300.ms).slideX(begin: -0.2),
                  Text(
                    'Nazzar Maulana',
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ).animate().fadeIn(delay: 400.ms).slideX(begin: -0.2),
                  const SizedBox(height: 16),
                  
                  // Bagian "Total Balance" tidak ada di screenshot, 
                  // jadi kita sembunyikan agar lebih mirip.
                  // (Jika ingin ditampilkan, ubah warnanya jadi putih)

                ],
              ),
            ),

            // === PERUBAHAN: Judul "My Cards" (putih) ===
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
              child: Text(
                'My Cards',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ).animate().fadeIn(delay: 700.ms).slideX(begin: -0.2),
            ),

            // Daftar Kartu (layout tetap, warna sudah diganti di cardData)
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16.0),
                itemCount: cardData.length,
                itemBuilder: (context, index) {
                  final card = cardData[index];
                  return AtmCard(
                    bankName: card['bankName'] as String,
                    cardNumber: card['cardNumber'] as String,
                    balance: card['balance'] as String,
                    color1: card['color1'] as Color,
                    color2: card['color2'] as Color,
                    bankIcon: card['bankIcon'] as IconData,
                  );
                },
              ),
            ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2),
            
            const SizedBox(height: 30),

            // === PERUBAHAN: Panel "Quick Actions" (gelap) ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Quick Actions',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Teks putih
                ),
              ).animate().fadeIn(delay: 1000.ms).slideX(begin: -0.2),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2D3748), // Warna panel abu-abu tua
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  QuickActionButton(icon: Icons.send_rounded, label: 'Send'),
                  QuickActionButton(icon: Icons.receipt_long_rounded, label: 'Bills'),
                  QuickActionButton(icon: Icons.add_card_rounded, label: 'Top Up'),
                  QuickActionButton(icon: Icons.more_horiz_rounded, label: 'More'),
                ],
              ),
            ).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.3),
            
            const SizedBox(height: 30),

            // === PERUBAHAN: Panel "Recent Transactions" (gelap) ===
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Recent Transactions',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Teks putih
                ),
              ).animate().fadeIn(delay: 1200.ms).slideX(begin: -0.2),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
              decoration: BoxDecoration(
                color: const Color(0xFF2D3748), // Warna panel abu-abu tua
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return TransactionItem(transaction: transactions[index])
                      .animate()
                      .fadeIn(delay: (1300 + index * 100).ms)
                      .slideY(begin: 0.2);
                },
              ),
            ).animate().fadeIn(delay: 1300.ms).slideY(begin: 0.4),
          ],
        ),
      ),
    );
  }
}