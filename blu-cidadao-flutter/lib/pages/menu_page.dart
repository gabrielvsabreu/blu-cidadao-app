import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'notifications_page.dart';
import 'profile_page.dart';
import 'package:provider/provider.dart';
import '../theme_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationsPage(),
    ProfilePage(),
  ];

  final List<String> _titles = [
    'Olá, cidadão!',
    'Notificações',
    'Perfil do Usuário',
  ];

  void _onSelectScreen(int index) {
    Navigator.pop(context); // Fecha o menu
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontSize: 20),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/avatar.png'),
                      //backgroundColor: Colors.grey,
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Gabriel Abreu',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ID: 2984000063',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),

              ListTile(
                leading: const Icon(Icons.dashboard),
                title: const Text('Início'),
                onTap: () => _onSelectScreen(0),
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text('Notificações'),
                onTap: () => _onSelectScreen(1),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text('Perfil'),
                onTap: () => _onSelectScreen(2),
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Sobre'),
                onTap: () {
                  // abrir página futura
                },
              ),
              ListTile(
                leading: const Icon(Icons.support_agent),
                title: const Text('Suporte'),
                onTap: () {
                  // abrir suporte futuro
                },
              ),

              const Spacer(),

              const Divider(),

              // Switch de tema escuro claro no rodapé
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    const Icon(Icons.brightness_6),
                    const SizedBox(width: 12),
                    const Text('Modo Escuro'),
                    const Spacer(),
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) {
                        return Switch(
                          value: themeProvider.isDarkMode,
                          onChanged: (value) {
                            themeProvider.toggleTheme(value);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      body: _screens[_selectedIndex],
    );
  }
}
