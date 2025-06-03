import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.blue[700],
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue[700],
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[700],
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black),
          bodyMedium: TextStyle(color: Colors.black87),
        ),
      ),
      home: FeedScreen(),
    );
  }
}

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Início'),
      ),
      body: ListView(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
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
            // Header: Avatar + Username
            Row(
              children: [
                // Avatar placeholder
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
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )
              ],
            ),
            const SizedBox(height: 12),
            // Content
            Text(
              content,
              style: TextStyle(fontSize: 15),
            ),
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
            // Action Buttons
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
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey[700],
      ),
    );
  }
}

class PostScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar Postagem'),
      ),
      body: Center(
        child: Text(
          'Conteúdo da tela de postagem',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
