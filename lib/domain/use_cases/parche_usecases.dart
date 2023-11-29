import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';
import 'package:f_parche/domain/repositories/parche_repository.dart';
import 'package:loggy/loggy.dart';

import '../entities/parche.dart';

class ParcheUseCases {
  final ChatItemRepository _chatItemRepository;
  final ParcheRepository _parcheRepository;
  final ChatRepository _chatRepository;

  ParcheUseCases({
    required ChatItemRepository chatItemRepository,
    required ParcheRepository parcheRepository,
    required ChatRepository chatRepository, // Added parameter
  })  : _chatItemRepository = chatItemRepository,
        _parcheRepository = parcheRepository,
        _chatRepository = chatRepository;
  Future<bool> createParche(Parche parche) async {
    /*
    - Crea el Parche en si (Registrar)
    - Crear un chat
      - Crear el chat en si (registrar)
      - Crear el Chat Item (registrar)
    */

    // * Crear el parche
    try {
      parche = await _parcheRepository.createParche(parche);
    } catch (e) {
      logError(e);
      return false;
    }

    // * Crear el chat
    // * Crear el chat en si (registrar)
    try {
      await _chatRepository.addChat(
        Chat(
          parcheKey: parche.key!,
          chatName: parche.name,
        ),
      );
    } catch (e) {
      logError(e);
      // TODO: Eliminar el parche
      return false;
    }

    // * Crear el Chat Item (registrar)
    try {
      var futureMembers = parche.members
          .map(
            (member) => _chatItemRepository.createChatItem(
              member.key,
              ChatItem(
                parcheKey: parche.key!,
                name: parche.name,
              ),
            ),
          )
          .toList();

      await Future.wait(futureMembers);
    } catch (e) {
      logError(e);
      // TODO: Eliminar el parche
      // TODO: Eliminar el chat
      return false;
    }

    return true;
  }
}
