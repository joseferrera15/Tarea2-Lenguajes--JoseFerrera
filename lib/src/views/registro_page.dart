import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_apps/src/shared/text_fields.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _obscureText = true;
  bool _obscureConfirmText = true;

  
  final _nombreCompletoController = TextEditingController();
  final _celularController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool get _isFormValid {
    return _nombreCompletoController.text.isNotEmpty &&
           _celularController.text.isNotEmpty &&
           _emailController.text.isNotEmpty && 
           _passwordController.text.isNotEmpty &&
           _confirmPasswordController.text.isNotEmpty;
  }

  void _handleSignUp() {
    // Validación de campos vacíos
    if (!_isFormValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Complete todos los campos',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Validacion de correo institucional
    if (!_emailController.text.endsWith('@unah.hn')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Use su correo institucional',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    // Validacion de coincidencia de contraseñas
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Las contraseñas no coinciden',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
    //Validacion de caracteres
    final specialCharRegex = RegExp(r'[!@#$%^&*(),.?":{}|<>]');
    if (!specialCharRegex.hasMatch(_passwordController.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'La contraseña tiene que incluir al menos un caracter ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }
    //validacion de longitud de contraseñas
    if (_passwordController.text.length<6) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Las contraseñas tiene que tener un minimo de 6 caracteres',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold
            )
          ),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    
    context.go('/login'); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 30),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.yellow.shade900,
              Colors.yellow.shade800,
              Colors.amberAccent.shade100,
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 80),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Registro", style: TextStyle(color: Colors.white, fontSize: 40)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amberAccent.shade100,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 60),
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [BoxShadow(
                              color: Color.fromRGBO(225, 95, 27, .3),
                              blurRadius: 20,
                              offset: Offset(0, 10)
                            )]
                          ),
                          child: Column(
                            children: <Widget>[
                              // Campo de Nombre Completo
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: CustomTextField(
                                  controller: _nombreCompletoController,
                                  hintText: "Nombre Completo",
                                  onChanged: (value) => setState(() {}),
                                ),
                              ),
                              // Campo de Celular
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: CustomTextField(
                                  controller: _celularController,
                                  hintText: "Celular",
                                  onChanged: (value) => setState(() {}),
                                ),
                              ),
                              // Campo de Email
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: CustomTextField(
                                  controller: _emailController,
                                  hintText: "Correo Institucional",
                                  onChanged: (value) => setState(() {}),
                                ),
                              ),
                              // Campo de Contraseña
                              Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                ),
                                child: CustomTextField(
                                  controller: _passwordController,
                                  hintText: "Contraseña",
                                  onChanged: (value) => setState(() {}),
                                  isPassword: true,
                                ),
                              ),
                              // Campo de Confirmar Contraseña
                              Container(
                                child: CustomTextField(
                                  controller: _confirmPasswordController,
                                  hintText: "Confirmar Contraseña",
                                  onChanged: (value) => setState(() {}),
                                  isPassword: true,
                                ),
                              ),
                            ]
                          ),
                        ),
                        const SizedBox(height: 40),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber[900],
                            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            elevation: 2
                          ),
                          onPressed: _handleSignUp,
                          child: Text('Registrarse', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                        ),
                        TextButton(
                          onPressed: () { 
                            context.go('/login');
                          },
                          child: Text('¿Ya tienes cuenta? Inicia sesión'),
                        )
                      ],
                    ),
                  ),
                )
              )
            )
          ],
        ),
      )
    );
  }
}