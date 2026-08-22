import 'package:flutter/material.dart';

void main() {
  runApp(const KheperApp());
}

class KheperApp extends StatelessWidget {
  const KheperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kheper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const KheperHomePage(),
    );
  }
}

class KheperHomePage extends StatelessWidget {
  const KheperHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Kheper')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 640),
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Icon(Icons.auto_stories_outlined, size: 56),
                const SizedBox(height: 24),
                Semantics(
                  header: true,
                  child: Text(
                    'Learn Middle Egyptian scripts',
                    style: theme.textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Kheper will teach paired monumental-hieroglyphic and '
                  'Hieratic forms through a private, offline-first course.',
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                const Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(label: Text('Monumental hieroglyphs')),
                    Chip(label: Text('Hieratic')),
                    Chip(label: Text('Offline by design')),
                  ],
                ),
                const SizedBox(height: 32),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Application foundation',
                          style: theme.textTheme.titleLarge,
                        ),
                        const SizedBox(height: 12),
                        const _FoundationPoint(
                          icon: Icons.phone_android_outlined,
                          label: 'One Flutter codebase for iOS and Android',
                        ),
                        const _FoundationPoint(
                          icon: Icons.cloud_off_outlined,
                          label: 'No account, telemetry, or runtime network access',
                        ),
                        const _FoundationPoint(
                          icon: Icons.inventory_2_outlined,
                          label: 'Course content will be packaged with the app',
                        ),
                      ],
                    ),
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

class _FoundationPoint extends StatelessWidget {
  const _FoundationPoint({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, semanticLabel: ''),
          const SizedBox(width: 12),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}
