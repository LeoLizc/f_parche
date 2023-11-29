import 'package:f_parche/navigation.dart';
import 'package:f_parche/ui/controllers/auth_controller.dart';
import 'package:f_parche/ui/widgets/clock.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Get.find<AuthController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              authProvider.logout();
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
              margin: const EdgeInsets.only(top: 40.0),
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
          const Clock(),
          const Spacer(flex: 2),
          Expanded(
            flex: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 0,
                  child: SizedBox(
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
                        backgroundColor: const Color(0xFFFEAA68),
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
                const SizedBox(width: 20.0),
                Flexible(
                  flex: 0,
                  child: SizedBox(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                        onPressed: () {
                          // ScaffoldMessenger.of(context).showSnackBar(
                          //   const SnackBar(
                          //     content: Text('Al mapa'),
                          //   ),
                          // );
                          // ! FIXME Shouldn't be here
                          Get.toNamed(Routes.map);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFEAA68),
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
                  child: SizedBox(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text('Agregar Parche'),
                        //   ),
                        // );
                        Get.toNamed(Routes.create);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEAA68),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                      child: const Icon(size: 50.0, Icons.add),
                    ),
                  ),
                ),
                const SizedBox(width: 20.0),
                Flexible(
                  flex: 0,
                  child: SizedBox(
                    width: 140.0,
                    height: 140.0,
                    child: ElevatedButton(
                      onPressed: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   const SnackBar(
                        //     content: Text('A los Parches'),
                        //   ),
                        // );
                        Get.toNamed(Routes.parches);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFEAA68),
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
