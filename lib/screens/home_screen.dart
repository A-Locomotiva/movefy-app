import 'package:flutter/material.dart';
import 'package:movefy/screens/profilePage_screen.dart';
import 'package:movefy/screens/searchActivities_screen.dart';

class FeedHomeScreen extends StatefulWidget {
  const FeedHomeScreen({Key? key}) : super(key: key);

  @override
  _FeedHomeScreenState createState() => _FeedHomeScreenState();
}

class _FeedHomeScreenState extends State<FeedHomeScreen> {
  int _currentIndex = 0;

  // Lista de telas para a BottomNavigationBar
  final List<Widget> _screens = [
    _FeedContent(), // Conteúdo do feed diretamente aqui
    ActivitySearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex == 0 ? AppBar(title: Text('Início')) : null,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Color(0xFF4285F4),
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Atividades',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
      floatingActionButton: _currentIndex == 0
          ? FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/post');
              },
              child: Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}

// Widget com o conteúdo do feed (antigo FeedScreen)
class _FeedContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      children: [
        _buildPostCard(
          username: 'João Silva',
          content: 'Legenda com localização',
          comment: 'Ótimo lugar para correr!',
        ),
        _buildPostCard(
          username: 'Maria Souza',
          content: 'Procuro pessoas para jogar futebol',
        ),
        _buildPostCard(
          username: 'Carlos Mendes',
          content: 'Procuro pessoas para praticar ciclismo',
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required String username,
    required String content,
    String? comment,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  username,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(content, style: TextStyle(fontSize: 15)),
            if (comment != null) ...[
              const SizedBox(height: 12),
              Text(
                comment,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.favorite_border, 'Curtir'),
                _buildActionButton(Icons.comment_outlined, 'Comentar'),
                _buildActionButton(Icons.repeat, 'Repostar'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(IconData icon, String label) {
    return TextButton.icon(
      onPressed: () {},
      icon: Icon(icon, color: Colors.grey[700], size: 20),
      label: Text(
        label,
        style: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
      style: TextButton.styleFrom(foregroundColor: Colors.grey[700]),
    );
  }
}