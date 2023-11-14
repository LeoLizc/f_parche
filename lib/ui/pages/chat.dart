import 'package:flutter/material.dart';

// TODO: TERMINAR
class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sala de Chat'),
        backgroundColor: Color(0xFFFC6411), // Cambiar el color de la AppBar
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.grey[300], // Color de fondo de la sala de chat
              child: ListView(
                padding: EdgeInsets.all(10.0),
                children: [
                  ChatMessage(message: 'Hola, ¿cómo estás?'),
                  ChatMessage(message: '¡Hola! Estoy bien, ¿y tú?'),
                  ChatMessage(message: 'Todo bien, gracias.'),
                  // Agregar más mensajes de chat
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            color: Colors.white, // Color de fondo del área de entrada de texto
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe un mensaje...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.person),
                  onPressed: () {
                    // Agregar la lógica para enviar el mensaje
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String message;

  ChatMessage({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue, // Color del avatar
            radius: 20.0,
          ),
          SizedBox(width: 10.0),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.white, // Color del mensaje
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
