import 'package:f_parche/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          // Fondo (Capa 1)
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/images/LogBackground.png', // Ruta de tu imagen de fondo
              width: Get.width,
              fit: BoxFit.cover,
            ),
          ),
          // Montañas (Capa 2)
          Positioned(
            top: Get.height - 260,
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
                child: ListView(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SvgPicture.asset('assets/icons/Logo.svg'),
                    const Text(
                      'Registrate',
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                            errorStyle: TextStyle(color: Colors.white),
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
                            'Email',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                            //colocar un texto blanco
                            errorStyle: TextStyle(color: Colors.white),
                            hintText: 'PepitoPerez24@example.ex',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(125, 255, 255, 255)),
                            border: OutlineInputBorder(),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Por favor ingrese email';
                            }
                            if (!GetUtils.isEmail(value)) {
                              return 'Por favor ingrese un email valido';
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
                            errorStyle: TextStyle(color: Colors.white),
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
                            if (value.length < 8) {
                              return 'La contraseña debe tener al menos 6 caracteres';
                            }
                            return null;
                          },
                        ),
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Confirma contraseña',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: const InputDecoration(
                            hintText: '*********',
                            errorStyle: TextStyle(color: Colors.white),
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

                            if (value != _passwordController.text) {
                              return 'Las contraseñas no coinciden';
                            }
                            return null;
                          },
                        ),
                      ],
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

                                Get.toNamed(Routes.home);
                              }
                            },
                            // style: ElevatedButton.styleFrom(
                            //   minimumSize: const Size(200, 50),
                            //   backgroundColor: ThemeData().primaryColorDark,
                            // ),
                            child: const Text(
                              'Registrarse',
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
