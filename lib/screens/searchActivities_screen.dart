import 'package:flutter/material.dart';

void main() {
  runApp(const MoveFyApp());
}

class MoveFyApp extends StatelessWidget {
  const MoveFyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoveFy',
      theme: ThemeData(
        primaryColor: Colors.blue[700],
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.blue[700],
        ),
      ),
      home: const ActivitySearchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// Tela principal: lista de atividades
class ActivitySearchScreen extends StatelessWidget {
  const ActivitySearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lista de atividades
    final activities = [
      {
        'title': 'Natação em Grupo',
        'dayTime': 'Sábado - 15:30/16:30',
        'location': 'Ginásio Santa Maria',
        'confirmed': '5 Pessoas confirmadas',
        'icon': '🏊‍♂️',
      },
      {
        'title': 'Corrida no Parque',
        'dayTime': 'Domingo - 07:00/08:00',
        'location': 'Parque das Águas',
        'confirmed': '12 Pessoas confirmadas',
        'icon': '🏃‍♀️',
      },
      {
        'title': 'Aula de Yoga',
        'dayTime': 'Segunda - 18:00/19:00',
        'location': 'Espaço Zen Vila Rica',
        'confirmed': '8 Pessoas confirmadas',
        'icon': '🧘‍♂️',
      },
      {
        'title': 'Funcional na Praia',
        'dayTime': 'Terça - 06:00/07:00',
        'location': 'Praia Central',
        'confirmed': '10 Pessoas confirmadas',
        'icon': '🏖️',
      },
      {
        'title': 'Pedalada Noturna',
        'dayTime': 'Sexta - 20:00/22:00',
        'location': 'Av. das Palmeiras',
        'confirmed': '18 Pessoas confirmadas',
        'icon': '🚴‍♂️',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Logo e Título
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  // Quadrado reservado para o logo
                  Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Procurar Atividades',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Botão de Filtros
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const FilterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text('Filtros', style: TextStyle(color: Colors.white)),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Lista de cards de atividade
            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  final activity = activities[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ActivityDetailScreen(
                              name: activity['title']!,
                              date: activity['dayTime']!,
                              time: '',
                              location: activity['location']!,
                              description: '${activity['icon']} Detalhes da atividade.',
                              participants: int.parse(
                                  activity['confirmed']!.split(' ')[0]),
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.blue[700],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${activity['icon']} ${activity['title']}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                activity['dayTime']!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                activity['location']!,
                                style: const TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    activity['confirmed']!,
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const CreateActivityScreen()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

/// Tela de detalhes da atividade
class ActivityDetailScreen extends StatelessWidget {
  final String name;
  final String date;
  final String time;
  final String location;
  final String description;
  final int participants;

  const ActivityDetailScreen({
    Key? key,
    required this.name,
    required this.date,
    required this.time,
    required this.location,
    required this.description,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes da Atividade'),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(name,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent)),
            const SizedBox(height: 8),
            Text(date),
            const SizedBox(height: 8),
            Text('Local: $location'),
            const SizedBox(height: 16),
            Text(description),
            const Spacer(),
            Text('Participantes confirmados: $participants'),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // lógica para se inscrever na atividade
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Participar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tela para criar uma nova atividade
class CreateActivityScreen extends StatelessWidget {
  const CreateActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criar Atividade', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(labelText: 'Nome da Atividade'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Data (dd/mm/aaaa)'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Horário (hh:mm)'),
            ),
            const TextField(
              decoration: InputDecoration(labelText: 'Local'),
            ),
            const TextField(
              maxLines: 3,
              decoration: InputDecoration(labelText: 'Descrição'),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // lógica de salvar nova atividade
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Salvar', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Tela de filtros
class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool swimming = false;
  bool running = false;
  bool cycling = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtros', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SwitchListTile(
              title: const Text('Natação'),
              value: swimming,
              onChanged: (v) => setState(() => swimming = v),
            ),
            SwitchListTile(
              title: const Text('Corrida'),
              value: running,
              onChanged: (v) => setState(() => running = v),
            ),
            SwitchListTile(
              title: const Text('Ciclismo'),
              value: cycling,
              onChanged: (v) => setState(() => cycling = v),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[700],
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text('Aplicar Filtros', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
