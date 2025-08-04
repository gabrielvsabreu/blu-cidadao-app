import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'notifications_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    NotificationsScreen(),
    ProfileScreen(),
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
                      backgroundImage: AssetImage(
                        'assets/avatar.png',
                      ), // substitua pela imagem real se quiser
                      backgroundColor: Colors.grey,
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
                  // Pode abrir uma página com informações do app futuramente
                },
              ),
              ListTile(
                leading: const Icon(Icons.support_agent),
                title: const Text('Suporte'),
                onTap: () {
                  // Pode abrir formulário ou contato com suporte
                },
              ),
              const Spacer(),

              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Icon(Icons.color_lens),
                    const SizedBox(width: 8),
                    const Text('Tema:'),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        // Aqui futuramente pode alternar entre claro/escuro
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                      child: const Text('Claro'),
                    ),
                    const SizedBox(width: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Aqui futuramente pode alternar entre claro/escuro
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                      ),
                      child: const Text('Escuro'),
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
