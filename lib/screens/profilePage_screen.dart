import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final List<Map<String, String>> atividades = [
    {
      'legenda': 'Corrida no parque com amigos!',
      'local': 'Parque Central, SP',
      'data': '20/05/2025',
    },
    {
      'legenda': 'Joguei uma pelada hoje à tarde!',
      'local': 'Quadra da Vila Nova',
      'data': '18/05/2025',
    },
    {
      'legenda': 'Trilha de bike incrível pelas montanhas!',
      'local': 'Serra do Mar, SP',
      'data': '15/05/2025',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
        backgroundColor: Color(0xFF4285F4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho com avatar e informações do usuário
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Avatar Placeholder
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                  ),
                ),
                const SizedBox(width: 16),
                // Informações
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Nome do usuário',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Idade: 25'),
                      Text('E-mail: usuario@email.com'),
                      Text('Cidade, Estado'),
                      Text('Esporte principal: Futebol'),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Divider(),
            const SizedBox(height: 8),

            Text('Atividades',
                style: TextStyle(
                    fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 12),

            // Lista de atividades
            ListView.builder(
              itemCount: atividades.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final atividade = atividades[index];

                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Cabeçalho com avatar e nome
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey[300],
                              ),
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Nome do usuário',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  atividade['data']!,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(atividade['legenda']!),
                        const SizedBox(height: 8),
                        Text(atividade['local']!,
                            style: TextStyle(color: Colors.blue)),
                        const SizedBox(height: 12),
                        Divider(),
                        // Ações
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border,
                                  color: Colors.grey[700]),
                              label: Text("Curtir",
                                  style:
                                      TextStyle(color: Colors.grey[700])),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.comment_outlined,
                                  color: Colors.grey[700]),
                              label: Text("Comentar",
                                  style:
                                      TextStyle(color: Colors.grey[700])),
                            ),
                            TextButton.icon(
                              onPressed: () {},
                              icon: Icon(Icons.repeat,
                                  color: Colors.grey[700]),
                              label: Text("Repostar",
                                  style:
                                      TextStyle(color: Colors.grey[700])),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}