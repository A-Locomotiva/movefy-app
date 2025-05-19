import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Password Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NewPasswordScreen(),
    );
  }
}

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({Key? key}) : super(key: key);

  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void saveNewPassword() {
    final pw = passwordController.text;
    final cpw = confirmPasswordController.text;
    if (pw.length < 8) {
      _showMessage("A senha deve ter pelo menos 8 caracteres.");
    } else if (pw != cpw) {
      _showMessage("As senhas não coincidem.");
    } else {
      _showMessage("Senha definida com sucesso!");
      // TODO: salve a senha
    }
  }

  void _showMessage(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue[700],
        title: const Text(
          'Defina sua nova senha',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Icon(Icons.lock_outline, size: 120, color: Colors.blue[700]),
              const SizedBox(height: 24),

              // Campos de senha
              _buildPasswordField(
                controller: passwordController,
                hintText: 'Nova senha',
                visible: isPasswordVisible,
                onToggle: () => setState(() => isPasswordVisible = !isPasswordVisible),
              ),
              const SizedBox(height: 16),
              _buildPasswordField(
                controller: confirmPasswordController,
                hintText: 'Confirme sua nova senha',
                visible: isConfirmPasswordVisible,
                onToggle: () => setState(() => isConfirmPasswordVisible = !isConfirmPasswordVisible),
              ),
              const SizedBox(height: 24),

              // Texto informativo acima do botão
              const Text(
                'Sua nova senha deve ter pelo menos 8 caracteres',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 12),

              // Botão salvar nova senha
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: saveNewPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[700],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Salvar nova senha',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required String hintText,
    required bool visible,
    required VoidCallback onToggle,
  }) {
    return TextField(
      controller: controller,
      obscureText: !visible,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.shade200,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        suffixIcon: IconButton(
          icon: Icon(visible ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: onToggle,
        ),
      ),
    );
  }
}