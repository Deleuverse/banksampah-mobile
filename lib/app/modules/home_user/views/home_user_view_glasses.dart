import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../configs/resources/color.dart';


class TrashBankApp extends StatelessWidget {
  const TrashBankApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorConfig.greenLight.withOpacity(0.5),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: dark,
      home: const GlassHome(),
    );
  }
}

class GlassHome extends StatefulWidget {
  const GlassHome({super.key});
  @override
  State<GlassHome> createState() => _GlassHomeState();
}

class _GlassHomeState extends State<GlassHome> {
  int idx = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const _Dashboard(),
      const _PricesPage(),
      const _HistoryPage(),
      const _RewardsPage(),
    ];

    return Stack(
      children: [
        const _BackgroundGradient(),
        Scaffold(
          extendBody: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text('Bank Sampah'),
            centerTitle: true,
          ),
          body: pages[idx],
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
            child: GlassContainer(
              borderRadius: BorderRadius.circular(24),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _NavItem(
                    icon: Icons.home_rounded,
                    label: 'Beranda',
                    selected: idx == 0,
                    onTap: () => setState(() => idx = 0),
                  ),
                  _NavItem(
                    icon: Icons.price_change_rounded,
                    label: 'Harga',
                    selected: idx == 1,
                    onTap: () => setState(() => idx = 1),
                  ),
                  _NavItem(
                    icon: Icons.receipt_long_rounded,
                    label: 'Riwayat',
                    selected: idx == 2,
                    onTap: () => setState(() => idx = 2),
                  ),
                  _NavItem(
                    icon: Icons.card_giftcard_rounded,
                    label: 'Rewards',
                    selected: idx == 3,
                    onTap: () => setState(() => idx = 3),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _BackgroundGradient extends StatelessWidget {
  const _BackgroundGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0B1220), Color(0xFF0C2E2A)],
        ),
      ),
      child: Container(), // keeps it simple; add textures/particles later if needed
    );
  }
}

class GlassContainer extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final BorderRadius borderRadius;
  final double blurSigma;
  final double fillOpacity;
  final double borderOpacity;

  const GlassContainer({
    super.key,
    this.child,
    this.padding = const EdgeInsets.all(16),
    this.borderRadius = const BorderRadius.all(Radius.circular(24)),
    this.blurSigma = 22,
    this.fillOpacity = 0.08,
    this.borderOpacity = 0.18,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurSigma, sigmaY: blurSigma),
        child: Container(
          padding: padding,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(fillOpacity),
            border: Border.all(color: Colors.white.withOpacity(borderOpacity)),
            borderRadius: borderRadius,
          ),
          child: child,
        ),
      ),
    );
  }
}

class _Dashboard extends StatelessWidget {
  const _Dashboard();

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          GlassContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Saldo Poin', style: text.titleMedium),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text('12,450', style: text.displaySmall?.copyWith(fontWeight: FontWeight.w700)),
                    const SizedBox(width: 8),
                    _StatPill(icon: Icons.currency_exchange_rounded, label: '≈ Rp124.500'),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    _PrimaryGlassButton(
                      icon: Icons.qr_code_rounded,
                      label: 'QR Saya',
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _GlassButton(
                      icon: Icons.history_rounded,
                      label: 'Riwayat',
                      onTap: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.recycling_rounded,
                  label: 'Setor',
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickActionCard(
                  icon: Icons.local_shipping_rounded,
                  label: 'Jemput',
                  onTap: () {},
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          GlassContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Harga Hari Ini', style: text.titleMedium),
                const SizedBox(height: 12),
                _PriceRow(material: 'Plastik', price: 'Rp4.200/kg'),
                _PriceRow(material: 'Kertas', price: 'Rp2.300/kg'),
                _PriceRow(material: 'Logam',  price: 'Rp9.100/kg'),
                _PriceRow(material: 'Kaca',   price: 'Rp1.800/kg'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          GlassContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Panduan Sortir', style: text.titleMedium),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8, runSpacing: 8,
                  children: const [
                    _GuideChip(label: 'Bilas botol plastik'),
                    _GuideChip(label: 'Pisahkan kertas berminyak'),
                    _GuideChip(label: 'Pecahkan kaca besar'),
                    _GuideChip(label: 'Ikat kardus'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _QuickActionCard({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: onTap,
      child: GlassContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: const Color(0xFF00E676)),
            const SizedBox(height: 12),
            Text(label, style: text.titleMedium),
          ],
        ),
      ),
    );
  }
}

class _StatPill extends StatelessWidget {
  final IconData icon;
  final String label;
  const _StatPill({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(999),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(children: [
        Icon(icon, size: 16),
        const SizedBox(width: 6),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ]),
    );
  }
}

class _PriceRow extends StatelessWidget {
  final String material;
  final String price;
  const _PriceRow({required this.material, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(material, style: Theme.of(context).textTheme.bodyLarge)),
          GlassContainer(
            borderRadius: BorderRadius.circular(999),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Text(price),
          ),
        ],
      ),
    );
  }
}

class _GuideChip extends StatelessWidget {
  final String label;
  const _GuideChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.circular(999),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Text(label),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF00E676) : Colors.white70;
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

class _PricesPage extends StatelessWidget {
  const _PricesPage();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Daftar harga detail + grafik tren (to-do)'));
  }
}

class _HistoryPage extends StatelessWidget {
  const _HistoryPage();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Riwayat transaksi (to-do)'));
  }
}

class _RewardsPage extends StatelessWidget {
  const _RewardsPage();
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Rewards & withdraw (to-do)'));
  }
}

class _GlassButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _GlassButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: GlassContainer(
          borderRadius: BorderRadius.circular(16),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18),
              const SizedBox(width: 8),
              Text(label, style: text.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class _PrimaryGlassButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _PrimaryGlassButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF00E676);
    final text = Theme.of(context).textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: GlassContainer(
          borderRadius: BorderRadius.circular(16),
          fillOpacity: 0.10, // sedikit lebih pekat untuk tombol utama
          borderOpacity: 0.22,
          padding: EdgeInsets.zero, // padding diatur di inner container
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  accent.withOpacity(0.28),
                  accent.withOpacity(0.12),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: 18, color: accent),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: text.labelLarge?.copyWith(
                    color: accent,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
