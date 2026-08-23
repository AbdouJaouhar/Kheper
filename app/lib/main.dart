import 'package:flutter/material.dart';

void main() {
  runApp(const KheperApp());
}

enum KheperDestination { learn, review, signs, read, settings }

@immutable
class AppCopy {
  const AppCopy({
    required this.appName,
    required this.learnLabel,
    required this.reviewLabel,
    required this.signsLabel,
    required this.readLabel,
    required this.settingsLabel,
    required this.learnTitle,
    required this.learnBody,
    required this.foundationTitle,
    required this.foundationBody,
    required this.reviewTitle,
    required this.reviewBody,
    required this.signsTitle,
    required this.signsBody,
    required this.readTitle,
    required this.readBody,
    required this.inscriptionPreviewTitle,
    required this.inscriptionPreviewSemantics,
    required this.settingsTitle,
    required this.settingsBody,
    required this.offlineStatus,
  });

  static const english = AppCopy(
    appName: 'Kheper',
    learnLabel: 'Learn',
    reviewLabel: 'Review',
    signsLabel: 'Signs',
    readLabel: 'Read',
    settingsLabel: 'Settings',
    learnTitle: 'Learn Middle Egyptian scripts',
    learnBody:
        'Build a foundation in monumental hieroglyphic and Hieratic forms.',
    foundationTitle: 'Application foundation',
    foundationBody: 'The first learning unit will appear here after its reviewed content is packaged.',
    reviewTitle: 'Review',
    reviewBody: 'Due review sessions will appear here.',
    signsTitle: 'Signs',
    signsBody: 'The offline sign reference will appear here.',
    readTitle: 'Read',
    readBody: 'Controlled reading activities will appear here.',
    inscriptionPreviewTitle: 'Inscription direction preview',
    inscriptionPreviewSemantics:
        'Placeholder inscription shown independently from interface direction',
    settingsTitle: 'Settings',
    settingsBody: 'Local preferences and data controls will appear here.',
    offlineStatus: 'Offline by design',
  );

  static const frenchExpansionFixture = AppCopy(
    appName: 'Kheper',
    learnLabel: 'Apprentissage',
    reviewLabel: 'Révisions',
    signsLabel: 'Répertoire des signes',
    readLabel: 'Lecture guidée',
    settingsLabel: 'Paramètres',
    learnTitle: 'Apprendre les systèmes d’écriture du moyen égyptien',
    learnBody: 'Construisez progressivement une base solide dans les formes hiéroglyphiques monumentales et hiératiques.',
    foundationTitle: 'Fondation de l’application',
    foundationBody: 'La première unité pédagogique apparaîtra ici lorsque son contenu révisé aura été intégré à l’application.',
    reviewTitle: 'Révisions programmées',
    reviewBody: 'Les séances de révision disponibles apparaîtront ici.',
    signsTitle: 'Répertoire des signes',
    signsBody: 'Le répertoire des signes disponible hors ligne apparaîtra ici.',
    readTitle: 'Lecture guidée',
    readBody: 'Les activités de lecture contrôlée apparaîtront ici.',
    inscriptionPreviewTitle: 'Aperçu de la direction de l’inscription',
    inscriptionPreviewSemantics: 'Inscription fictive affichée indépendamment de la direction de l’interface',
    settingsTitle: 'Paramètres de l’application',
    settingsBody: 'Les préférences locales et les contrôles des données apparaîtront ici.',
    offlineStatus: 'Fonctionne intégralement hors ligne',
  );

  static const arabicFixture = AppCopy(
    appName: 'خيبر',
    learnLabel: 'التعلّم',
    reviewLabel: 'المراجعة',
    signsLabel: 'العلامات',
    readLabel: 'القراءة',
    settingsLabel: 'الإعدادات',
    learnTitle: 'تعلّم أنظمة الكتابة المصرية الوسطى',
    learnBody: 'ابنِ أساساً تدريجياً للتعلّم دون اتصال بالشبكة.',
    foundationTitle: 'أساس التطبيق',
    foundationBody: 'ستظهر الوحدة التعليمية الأولى هنا بعد مراجعة محتواها.',
    reviewTitle: 'المراجعة',
    reviewBody: 'ستظهر جلسات المراجعة المستحقة هنا.',
    signsTitle: 'العلامات',
    signsBody: 'سيظهر مرجع العلامات المتاح دون اتصال هنا.',
    readTitle: 'القراءة',
    readBody: 'ستظهر أنشطة القراءة الموجّهة هنا.',
    inscriptionPreviewTitle: 'معاينة اتجاه النقش',
    inscriptionPreviewSemantics: 'نقش تجريبي مستقل عن اتجاه واجهة المستخدم',
    settingsTitle: 'الإعدادات',
    settingsBody: 'ستظهر التفضيلات المحلية وأدوات التحكم بالبيانات هنا.',
    offlineStatus: 'مصمم للعمل دون اتصال',
  );

  final String appName;
  final String learnLabel;
  final String reviewLabel;
  final String signsLabel;
  final String readLabel;
  final String settingsLabel;
  final String learnTitle;
  final String learnBody;
  final String foundationTitle;
  final String foundationBody;
  final String reviewTitle;
  final String reviewBody;
  final String signsTitle;
  final String signsBody;
  final String readTitle;
  final String readBody;
  final String inscriptionPreviewTitle;
  final String inscriptionPreviewSemantics;
  final String settingsTitle;
  final String settingsBody;
  final String offlineStatus;
}

class KheperApp extends StatelessWidget {
  const KheperApp({
    super.key,
    this.copy = AppCopy.english,
    this.uiTextDirection = TextDirection.ltr,
    this.inscriptionTextDirection = TextDirection.rtl,
  });

  final AppCopy copy;
  final TextDirection uiTextDirection;
  final TextDirection inscriptionTextDirection;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: copy.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00695C),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      builder: (context, child) => Directionality(
        key: const ValueKey('ui-direction'),
        textDirection: uiTextDirection,
        child: child ?? const SizedBox.shrink(),
      ),
      home: KheperShell(
        copy: copy,
        inscriptionTextDirection: inscriptionTextDirection,
      ),
    );
  }
}

class KheperShell extends StatefulWidget {
  const KheperShell({
    required this.copy,
    required this.inscriptionTextDirection,
    super.key,
  });

  final AppCopy copy;
  final TextDirection inscriptionTextDirection;

  @override
  State<KheperShell> createState() => _KheperShellState();
}

class _KheperShellState extends State<KheperShell> {
  var _selectedDestination = KheperDestination.learn;

  void _selectDestination(int index) {
    setState(() {
      _selectedDestination = KheperDestination.values[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final copy = widget.copy;
    final destinations = _destinations(copy);
    final selectedIndex = _selectedDestination.index;
    final page = _DestinationPage(
      key: ValueKey(_selectedDestination),
      destination: _selectedDestination,
      copy: copy,
      inscriptionTextDirection: widget.inscriptionTextDirection,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final useRail = constraints.maxWidth >= 700;
        return Scaffold(
          appBar: AppBar(
            title: Text(copy.appName),
            actions: [
              Padding(
                padding: const EdgeInsetsDirectional.only(end: 16),
                child: Tooltip(
                  message: copy.offlineStatus,
                  child: Icon(
                    Icons.cloud_off_outlined,
                    semanticLabel: copy.offlineStatus,
                  ),
                ),
              ),
            ],
          ),
          body: useRail
              ? Row(
                  children: [
                    NavigationRail(
                      selectedIndex: selectedIndex,
                      onDestinationSelected: _selectDestination,
                      labelType: NavigationRailLabelType.all,
                      destinations: destinations
                          .map(
                            (destination) => NavigationRailDestination(
                              icon: Icon(destination.icon),
                              selectedIcon: Icon(destination.selectedIcon),
                              label: Text(destination.label),
                            ),
                          )
                          .toList(),
                    ),
                    const VerticalDivider(width: 1),
                    Expanded(child: page),
                  ],
                )
              : page,
          bottomNavigationBar: useRail
              ? null
              : NavigationBar(
                  selectedIndex: selectedIndex,
                  onDestinationSelected: _selectDestination,
                  destinations: destinations
                      .map(
                        (destination) => NavigationDestination(
                          icon: Icon(destination.icon),
                          selectedIcon: Icon(destination.selectedIcon),
                          label: destination.label,
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }
}

final class _DestinationDefinition {
  const _DestinationDefinition({
    required this.label,
    required this.icon,
    required this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final IconData selectedIcon;
}

List<_DestinationDefinition> _destinations(AppCopy copy) => [
  _DestinationDefinition(
    label: copy.learnLabel,
    icon: Icons.school_outlined,
    selectedIcon: Icons.school,
  ),
  _DestinationDefinition(
    label: copy.reviewLabel,
    icon: Icons.refresh_outlined,
    selectedIcon: Icons.refresh,
  ),
  _DestinationDefinition(
    label: copy.signsLabel,
    icon: Icons.grid_view_outlined,
    selectedIcon: Icons.grid_view,
  ),
  _DestinationDefinition(
    label: copy.readLabel,
    icon: Icons.menu_book_outlined,
    selectedIcon: Icons.menu_book,
  ),
  _DestinationDefinition(
    label: copy.settingsLabel,
    icon: Icons.settings_outlined,
    selectedIcon: Icons.settings,
  ),
];

class _DestinationPage extends StatelessWidget {
  const _DestinationPage({
    required this.destination,
    required this.copy,
    required this.inscriptionTextDirection,
    super.key,
  });

  final KheperDestination destination;
  final AppCopy copy;
  final TextDirection inscriptionTextDirection;

  @override
  Widget build(BuildContext context) {
    return switch (destination) {
      KheperDestination.learn => _LearnPage(copy: copy),
      KheperDestination.review => _PlaceholderPage(
        title: copy.reviewTitle,
        body: copy.reviewBody,
      ),
      KheperDestination.signs => _PlaceholderPage(
        title: copy.signsTitle,
        body: copy.signsBody,
      ),
      KheperDestination.read => _ReadPage(
        copy: copy,
        inscriptionTextDirection: inscriptionTextDirection,
      ),
      KheperDestination.settings => _PlaceholderPage(
        title: copy.settingsTitle,
        body: copy.settingsBody,
      ),
    };
  }
}

class _LearnPage extends StatelessWidget {
  const _LearnPage({required this.copy});

  final AppCopy copy;

  @override
  Widget build(BuildContext context) {
    return _PageFrame(
      title: copy.learnTitle,
      children: [
        Text(copy.learnBody, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  copy.foundationTitle,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 12),
                Text(copy.foundationBody),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ReadPage extends StatelessWidget {
  const _ReadPage({required this.copy, required this.inscriptionTextDirection});

  final AppCopy copy;
  final TextDirection inscriptionTextDirection;

  @override
  Widget build(BuildContext context) {
    return _PageFrame(
      title: copy.readTitle,
      children: [
        Text(copy.readBody, style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 24),
        Text(
          copy.inscriptionPreviewTitle,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 12),
        Semantics(
          label: copy.inscriptionPreviewSemantics,
          child: ExcludeSemantics(
            child: Directionality(
              key: const ValueKey('inscription-direction'),
              textDirection: inscriptionTextDirection,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Color(0xFFE0F2F1),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text('◀  □  □  □', textAlign: TextAlign.start),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PlaceholderPage extends StatelessWidget {
  const _PlaceholderPage({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return _PageFrame(
      title: title,
      children: [Text(body, style: Theme.of(context).textTheme.bodyLarge)],
    );
  }
}

class _PageFrame extends StatelessWidget {
  const _PageFrame({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Semantics(
                header: true,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ),
              const SizedBox(height: 16),
              ...children,
            ],
          ),
        ),
      ),
    );
  }
}
