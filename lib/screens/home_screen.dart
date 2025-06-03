import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Início'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () => Navigator.pushNamed(context, '/profile'),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        children: [
          _buildPostCard(
            username: 'João Silva',
            content: 'Acabei de completar 5km no Parque Ibirapuera! 🏃‍♂️',
            location: 'Parque Ibirapuera, São Paulo',
            imageUrl: 'https://example.com/park.jpg',
            likes: 24,
            comments: 5,
          ),
          _buildPostCard(
            username: 'Maria Souza',
            content: 'Alguém quer jogar futebol neste final de semana? ⚽',
            location: 'Quadra Municipal - Centro',
            likes: 12,
            comments: 8,
          ),
          _buildPostCard(
            username: 'Carlos Mendes',
            content: 'Grupo de ciclismo saindo domingo às 7h. Interessados? 🚴‍♂️',
            location: 'Praça da Sé',
            imageUrl: 'https://example.com/bike.jpg',
            likes: 31,
            comments: 14,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/post'),
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildPostCard({
    required String username,
    required String content,
    String? location,
    String? imageUrl,
    int likes = 0,
    int comments = 0,
  }) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with user info
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (location != null)
                      Text(
                        location,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey[600],
                        ),
                      ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            
            // Post content
            Text(
              content,
              style: const TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 12),
            
            // Post image (if any)
            if (imageUrl != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(height: 16),
            
            // Post stats
            Row(
              children: [
                Icon(Icons.favorite, color: Colors.red[400], size: 16),
                const SizedBox(width: 4),
                Text(likes.toString()),
                const SizedBox(width: 16),
                Icon(Icons.comment, color: Colors.grey[600], size: 16),
                const SizedBox(width: 4),
                Text(comments.toString()),
              ],
            ),
            const SizedBox(height: 8),
            
            // Action buttons
            const Divider(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildActionButton(Icons.favorite_outline, 'Curtir'),
                _buildActionButton(Icons.comment_outlined, 'Comentar'),
                _buildActionButton(Icons.share, 'Compartilhar'),
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
  final TextEditingController _postController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Postagem'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Lógica para postar
              Navigator.pop(context);
            },
            child: const Text(
              'Publicar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: const [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage('https://example.com/avatar.jpg'),
                ),
                SizedBox(width: 12),
                Text('Você', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _postController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'No que você está pensando?',
                border: InputBorder.none,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo_library, color: Colors.blue),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.blue),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}