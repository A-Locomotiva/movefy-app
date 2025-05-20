import 'package:flutter/material.dart';

void main() {
  runApp(MovefyApp());
}

class MovefyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MoveFy',
      debugShowCheckedModeBanner: false,
      home: SignupScreen(),
    );
  }
}

class SignupScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset('assets/logo.png', height: 120),
                SizedBox(height: 24),
                Text(
                  "Crie sua conta",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: () {
                    // TODO: ação de login com Google
                  },
                  icon: Image.asset('assets/google_icon.png', height: 24),
                  label: Text(
                    "Continuar com google",
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.grey.shade300),
                    minimumSize: Size(double.infinity, 50),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text("OU"),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 16),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: "Nome completo",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 12),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Senha",
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // TODO: ação de criar conta
                  },
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                    ), // cor branca na fonte
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6557D9),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Já tem uma conta? "),
                    GestureDetector(
                      onTap: () {
                        // TODO: Navegar para a tela de login
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          color: Color(0xFF6557D9),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
