import 'dart:async';
import 'package:f_parche/domain/entities/chat.dart';

/// The repository interface for managing chat items.
abstract class ChatItemRepository {
  /// Retrieves a list of chat items for the specified user.
  ///
  /// Returns a list of [ChatItem] objects.
  List<ChatItem> getChatItems(String userKey);

  /// Creates a new chat item for the specified user.
  ///
  /// Returns the created [ChatItem].
  ChatItem createChatItem(String userKey, ChatItem chatItem);

  /// Listens for updates to a specific chat item for the specified user.
  ///
  /// The [onUpdate] callback is called whenever the chat item is updated.
  ///
  /// Returns a [StreamSubscription] that can be used to cancel the subscription.
  StreamSubscription<ChatItem?> listenNewChatItem(
    String userKey,
    void Function(ChatItem?) onUpdate,
  );

  /// Listens for updates to the list of chat items for the specified user.
  ///
  /// The [onUpdate] callback is called whenever the list of chat items is updated.
  ///
  /// Returns a [StreamSubscription] that can be used to cancel the subscription.
  StreamSubscription<List<ChatItem>> listenChatItems(
    String userKey,
    void Function(List<ChatItem>) onUpdate,
  );

  // TODO: Should modify when readed
  // TODO: Should be posible to edit the members
}
