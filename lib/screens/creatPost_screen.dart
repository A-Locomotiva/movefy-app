import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PostScreen(),
    );
  }
}

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController _controller = TextEditingController();
  final int _maxLength = 280;
  int _currentLength = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentLength = _controller.text.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criar nova publicação'),
        centerTitle: true,
        backgroundColor: Color(0xFF4285F4),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Avatar + Nome
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Nome do usuário',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Campo de texto com contador
            Expanded(
              child: TextField(
                controller: _controller,
                maxLength: _maxLength,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  hintText: 'No que você está pensando?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  counterText: '$_currentLength/$_maxLength',
                  counterStyle: TextStyle(
                    fontSize: 12,
                    color:
                        _currentLength > _maxLength
                            ? Colors.red
                            : Colors.grey[600],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Botões de mídia (fictícios por enquanto)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // lógica futura de imagem
                  },
                  icon: Icon(Icons.image),
                  label: Text('Imagem'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // lógica futura de vídeo
                  },
                  icon: Icon(Icons.videocam),
                  label: Text('Vídeo'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black87,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Botão de publicação
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    _currentLength > 0 && _currentLength <= _maxLength
                        ? () {
                          // publicar
                        }
                        : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4285F4),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text('Publicar agora', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
