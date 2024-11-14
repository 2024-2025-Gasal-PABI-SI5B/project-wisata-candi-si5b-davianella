import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
// TODO : 1. Deklarasi Variable 
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String _errorText = '';
  bool _isSignUp = false;
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Pasang AppBar
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      //TODO: 3. Pasang Body
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              child: Column(
                //TODO : 4. Atur mainAxisAligment dan crossAxisAlignment
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //TODO : 5. Buat TextformField untuk Nama Lengkap
                  TextFormField(
                    controller: _fullnameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      hintText: 'Masukkan Nama Lengkap',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  //TODO : 6. Buat TextfromField untuk username
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama Pengguna',
                      hintText: 'Masukkan Nama Pengguna',
                      border: OutlineInputBorder(),
                    ),
                  ),

                  //TODO : 7. Buat TextformField untuk password
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Kata Sandi',
                      hintText: 'Masukkan Kata Sandi',
                      border: const OutlineInputBorder(),
                      errorText: _errorText.isNotEmpty ? _errorText : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurePassword = !_obscurePassword;
                          });
                        },
                        icon: Icon(
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
                        ),
                      ),
                    ),
                    obscureText: _obscurePassword,
                  ),

                  //TODO : 8. Buat Elevated Button Sign Up
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    //TODO : 9. Buat method password
                    onPressed: (){
                      setState(() {
                        String password = _passwordController.text;
                        if (password.length < 8) {
                          _errorText = 'Kata sandi harus minimal 8 karakter';
                        } else if (!RegExp(r'[A-Z]').hasMatch(password)) {
                          _errorText = 'Kata sandi harus mengandung minimal satu huruf besar';
                        } else if (!RegExp(r'[a-z]').hasMatch(password)) {
                          _errorText = 'Kata sandi harus mengandung minimal satu huruf kecil';
                        } else if (!RegExp(r'[0-9]').hasMatch(password)) {
                          _errorText = 'Kata sandi harus mengandung minimal satu angka';
                        } else if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
                          _errorText = 'Kata sandi harus mengandung minimal satu karakter khusus (!@#\$&*~)';
                        } else {
                        // Reset error text jika password valid
                        _errorText = '';
                        _isSignUp = true;
                       }
                      });
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}