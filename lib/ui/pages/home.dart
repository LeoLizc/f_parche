import 'package:f_parche/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.login);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only(top: 40.0),
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
                border: Border.all(color: Colors.white, width: 4.0),
              ),
            ),
          ),
          const Expanded(
            flex: 0,
            child: SizedBox(height: 20.0),
          ),
          const Text(
            '8:30 P.M.',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.black,
            ),
          ),
          Spacer(flex: 2),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('A la lista de amigos'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFEAA68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: SvgPicture.asset(
                        'assets/icons/friends.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.primary,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Flexible(
                  flex: 0,
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Al mapa'),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFFFEAA68),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/map.svg',
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.primary,
                            BlendMode.srcIn,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 0,
            child: SizedBox(height: 20.0),
          ),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Agregar amigos'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFEAA68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Icon(size: 50.0, Icons.add),
                    ),
                  ),
                ),
                SizedBox(width: 20.0),
                Flexible(
                  flex: 0,
                  child: Container(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('A los mensajes'),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFFEAA68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Icon(size: 50.0, Icons.message),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            flex: 2,
            child: SizedBox(height: 20.0),
          ),
        ],
      ),
    );
  }
}

class CustomSquare extends StatelessWidget {
  final double size;
  final IconData icon;

  CustomSquare({required this.size, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(0xFFFEAA68),
        border: Border.all(color: Colors.white, width: 4.0),
      ),
      child: Center(
        child: Icon(
          icon,
          size: 40.0,
          color: Colors.black,
        ),
      ),
    );
  }
}
