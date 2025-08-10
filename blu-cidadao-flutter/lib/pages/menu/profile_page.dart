import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil do Usuário'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // 👤 Avatar e nome do usuário
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage(
                    'assets/avatar.png',
                  ), // substitua com imagem real se quiser
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 16),
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
                    Text(
                      'gabriel@email.com',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),

            // ⚙️ Opções do perfil
            ListTile(
              leading: const Icon(Icons.edit, color: Colors.blue),
              title: const Text('Editar informações pessoais'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // navegar para tela de edição (futura)
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: const Text('Histórico de serviços'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // navegar para histórico (futura)
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.settings, color: Colors.teal),
              title: const Text('Configurações'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // navegar para configurações (futura)
              },
            ),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Sair'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // implementar logout
              },
            ),
          ],
        ),
      ),
    );
  }
}
