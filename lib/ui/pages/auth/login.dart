import 'package:f_parche/navigation.dart';
import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Get.find<AuthController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fondo (Capa 1)
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/LogBackground.png'), // Ruta de tu imagen de fondo
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Montañas (Capa 2)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/Background Hills.png', // Ruta de tu segunda imagen
              fit: BoxFit.cover, // Ancho de la imagen
            ),
          ),
          // Contenido Principal (Capa 3)
          SafeArea(
            child: Container(
              //colocar un margen
              margin: const EdgeInsets.all(25),
              //vamos a hacer un login

              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/Logo.svg'),
                    const Text(
                      'Inicio de Sesión',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Usuario',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _userController,
                          decoration: const InputDecoration(
                            //colocar un texto blanco
                            hintText: 'PepitoPerez24',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(125, 255, 255, 255)),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese un usuario';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Contraseña',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: '*********',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(125, 255, 255, 255)),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese una contraseña';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    RichText(
                        text: TextSpan(
                      children: <TextSpan>[
                        const TextSpan(
                          text: '¿No tienes una cuenta? ',
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                        TextSpan(
                          text: 'Registrate',
                          style: const TextStyle(
                              fontSize: 10,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(Routes.register);
                            },
                        ),
                      ],
                    )
                        // style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Procesando datos'),
                                  ),
                                );
                                authProvider.login(
                                  email: _userController.text,
                                  password: _passwordController.text,
                                );
                              }
                            },
                            // style: ElevatedButton.styleFrom(
                            //   minimumSize: const Size(200, 50),
                            //   backgroundColor: ThemeData().primaryColorDark,
                            // ),
                            child: const Text(
                              'Iniciar Sesión',
                              // style: TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            //aumenta el tamaño del boton
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
