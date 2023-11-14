import 'package:flutter/material.dart';

class ParchePage extends StatelessWidget {
  const ParchePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Número de pestañas
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat App'),
          backgroundColor: Color(0xFFFC6411), // Cambiar el color de la AppBar
          bottom: TabBar(
            tabs: [
              Tab(text: 'Chat'),
              Tab(text: 'Amigos'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatTab(), // Contenido de la primera pestaña (Chat)
            FriendsTab(), // Contenido de la segunda pestaña (Amigos)
          ],
        ),
      ),
    );
  }
}

class ChatTab extends StatelessWidget {
  final List<Planes> planes = [
    Planes('Super salida', Icons.people),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: planes.length,
      itemBuilder: (context, index) {
        final friend = planes[index];
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFEAA68), // Cambiar el color de fondo a blanco
          ),
          onPressed: () {
            // Agregar la lógica para manejar el botón de amigo aquí.
          },
          child: Container(
            child: Row(
              children: [
                Icon(friend.icon, size: 50),
                SizedBox(width: 25),
                //damos tamaño al texto y color negro
                Text(friend.name,
                    style: TextStyle(
                      fontSize: 50,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FriendsTab extends StatelessWidget {
  final List<Amigos> amigos = [
    Amigos('John', Icons.person),
    Amigos('Alice', Icons.person),
    Amigos('Bob', Icons.person),
    Amigos('Eve', Icons.person),
    Amigos('Charlie', Icons.person),
    Amigos('Grace', Icons.person),
    Amigos('David', Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: amigos.length,
      itemBuilder: (context, index) {
        final friend = amigos[index];
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(0xFFFEAA68), // Cambiar el color de fondo a blanco
          ),
          onPressed: () {
            // Agregar la lógica para manejar el botón de amigo aquí.
          },
          child: Container(
            child: Row(
              children: [
                Icon(friend.icon),
                SizedBox(width: 8),
                //damos tamaño al texto y color negro
                Text(friend.name,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Amigos {
  final String name;
  final IconData icon;

  Amigos(this.name, this.icon);
}

class Planes {
  final String name;
  final IconData icon;

  Planes(this.name, this.icon);
}
