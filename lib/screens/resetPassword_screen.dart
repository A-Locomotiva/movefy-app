import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  
  bool _emailSent = false;
  bool _isLoading = false;

  Future<void> _sendResetCode() async {
    setState(() => _isLoading = true);
    
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      
      setState(() {
        _emailSent = true;
        _isLoading = false;
      });
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Código enviado para seu e-mail'),
          backgroundColor: Colors.green,
        )
      );
      Navigator.pushNamedAndRemoveUntil(
        context, 
        '/', 
        (route) => false
      );
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      String errorMessage;
      
      if (e.code == 'user-not-found') {
        errorMessage = 'Nenhuma conta encontrada para este e-mail';
      } else {
        errorMessage = 'Erro: ${e.message}';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  Future<void> _resetPassword() async {
    setState(() => _isLoading = true);
    
    try {
      await FirebaseAuth.instance.confirmPasswordReset(
        code: _codeController.text.trim(),
        newPassword: _newPasswordController.text.trim(),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Senha alterada com sucesso!'),
          backgroundColor: Colors.green,
        )
      );
      
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      setState(() => _isLoading = false);
      String errorMessage;
      
      if (e.code == 'expired-action-code') {
        errorMessage = 'Código expirado. Solicite um novo.';
      } else if (e.code == 'invalid-action-code') {
        errorMessage = 'Código inválido. Tente novamente.';
      } else {
        errorMessage = 'Erro: ${e.message}';
      }
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
          backgroundColor: Colors.red,
        )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/logo.png',
                  height: 100,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 24),
                Text(
                  _emailSent ? "Redefinir Senha" : "Recuperar Senha",
                  style: TextStyle(
                    fontSize: 24, 
                    fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  _emailSent
                    ? "Insira o código recebido e sua nova senha"
                    : "Digite seu e-mail para receber o código de redefinição",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600
                  ),
                ),
                SizedBox(height: 32),
                
                if (!_emailSent) ...[
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: "E-mail cadastrado",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.email, color: Colors.grey.shade500),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 24),
                ],
                
                if (_emailSent) ...[
                  TextField(
                    controller: _codeController,
                    decoration: InputDecoration(
                      hintText: "Código de verificação",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock_outline, color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: _newPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Nova senha",
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: Icon(Icons.lock, color: Colors.grey.shade500),
                    ),
                  ),
                  SizedBox(height: 24),
                ],
                
                ElevatedButton(
                  onPressed: _isLoading 
                    ? null 
                    : _emailSent ? _resetPassword : _sendResetCode,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6557D9),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: _isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                        _emailSent ? "Redefinir Senha" : "Enviar Código",
                        style: TextStyle(
                          fontSize: 16, 
                          color: Colors.white
                        ),
                      ),
                ),
                
                SizedBox(height: 20),
                if (_emailSent)
                  TextButton(
                    onPressed: () => setState(() => _emailSent = false),
                    child: Text(
                      "Reenviar código",
                      style: TextStyle(
                        color: Color(0xFF6557D9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}