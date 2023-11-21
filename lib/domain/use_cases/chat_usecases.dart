import 'package:f_parche/domain/entities/chat.dart';
import 'package:f_parche/domain/repositories/chat_item_repository.dart';
import 'package:f_parche/domain/repositories/chat_repository.dart';
import 'package:f_parche/domain/repositories/messages_repository.dart';
import 'package:f_parche/domain/services/auth_service.dart';

class ChatUseCases {
  final ChatItemRepository _chatItemRepository;
  final AuthService _authService;
  final ChatRepository _chatRepository;
  final MessagesRepository _messagesRepository;

  ChatUseCases({
    required ChatItemRepository chatItemRepository,
    required AuthService authService,
    required ChatRepository chatRepository,
    required MessagesRepository messagesRepository,
  })  : _chatItemRepository = chatItemRepository,
        _authService = authService,
        _chatRepository = chatRepository,
        _messagesRepository = messagesRepository;

  Future<List<ChatItem>> getChatItems() async {
    final user = await _authService.getCurrentUser();
    final chatItems = await _chatItemRepository.getChatItems(user!.id);
    return chatItems;
  }

  Future<Chat?> getChat(String chatId) async {
    try {
      final chat = await _chatRepository.getChat(chatId);
      return chat;
    } catch (e) {
      rethrow;
    }
  }
}