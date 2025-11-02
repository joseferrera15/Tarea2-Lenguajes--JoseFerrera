import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_apps/src/shared/text_fields.dart';

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});
    
    @override
    _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage>{
    bool  _obscureText = true;

    //Controles para el email y password.
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

     bool get _isFormValid {
        return _emailController.text.isNotEmpty && 
               _passwordController.text.isNotEmpty;
              
    
    }
    @override
  Widget build(BuildContext context) {
    void _handleLogin() {
    if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Complete todos los campos', 
                    textAlign: TextAlign.center, 
                    style:TextStyle(
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
    
    // validacion de que se este utilizando el correo institucional
    if (!_emailController.text.contains('jaferrerac@unah.hn')) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Use su correo institucional',
                    textAlign: TextAlign.center, 
                    style:TextStyle(
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
    //validacion que sea el numero de cuenta
    if (!_passwordController.text.contains('20172000455')) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Contrasena incorrecta',
                    textAlign: TextAlign.center, 
                    style:TextStyle(
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
    
    context.go('/todos');
}
    // TODO: implement build
   return Scaffold(
    body: Container(
        padding:EdgeInsets.symmetric(vertical: 30) ,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                Colors.yellow.shade900,
                Colors.yellow.shade800,
                Colors.amberAccent.shade100,

            ])
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                const SizedBox(height: 80,),
                const Padding(padding: EdgeInsetsGeometry.all(20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                            Text("Login", style: TextStyle(color: Colors.white, fontSize: 40),)
                        ],
                    ),
                ),
                const SizedBox(height: 20,),
                Expanded(
                    child: SingleChildScrollView(
                           child: Container(
                    decoration: BoxDecoration(
                        color: Colors.amberAccent.shade100,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                    ),
                    child: Padding(
                        padding: const EdgeInsets.all(30),
                        child: Column(
                            children: <Widget>[
                                SizedBox(height: 60,),
                                Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration:  BoxDecoration(
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
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border(bottom: BorderSide(color:Colors.grey.shade200))
                                                ),
                                                //Los TextFields
                                                child: CustomTextField(
                                                  controller: _emailController, 
                                                  hintText: "Correo Institucional",
                                                  onChanged: (value) => setState(() {}),
                                                  
                                                  )
                                                /*TextField(
                                                    controller: _emailController,
                                                    onChanged: (value) => setState(() {}),
                                                    decoration: InputDecoration(
                                                        hintText: "Correo Institucional",
                                                        hintStyle: TextStyle(color: Colors.grey),
                                                        border: InputBorder.none

                                                    ),
                                                ),*/
                                            ),
                                            Container(
                                                decoration: BoxDecoration(
                                                    border: Border(bottom: BorderSide(color:Colors.grey.shade200))
                                                ),
                                                //Los TextFields
                                                child: CustomTextField(
                                                  controller: _passwordController, 
                                                  hintText: "Contraseña",
                                                  onChanged: (value) => setState(() {}),
                                                  isPassword: true,

                                                  )
                                                
                                                /*TextField(
                                                    controller: _passwordController,
                                                    onChanged: (value) => setState(() {}),
                                                    obscureText: _obscureText,
                                                    decoration: InputDecoration(
                                                        hintText: "Contraseña",
                                                        hintStyle: TextStyle(color: Colors.grey),
                                                        border: InputBorder.none,
                                                        suffixIcon: Align(widthFactor: 1.0, heightFactor: 1.0, child:IconButton(
                                                            onPressed: (){
                                                                setState(() {
                                                                    _obscureText = !_obscureText; // Cambiar estado
                                                                });
                                                            }, 
                                                            icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,),
                                                            
                                                            )),
                                                        

                                                    ),
                                                ),*/
                                            ),
                                        ]
                                    ),
                                ),
                                SizedBox(height: 40,),
                                Text('¿Olvido Contraseña?',style: TextStyle(color: Colors.black45),),
                                SizedBox(height: 40,),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.amber[900],
                                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30), // Rounded corners
                                            ),
                                        elevation: 2
                                        ),
                                    onPressed: _handleLogin,
                                    child: Text('Login', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                                ),
                                TextButton(
                                    style: TextButton.styleFrom(
                                        
                                    ),
                                    onPressed: () { 
                                        context.go('/registro');
                                    },
                                    child: Text('Registrarse'),
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

