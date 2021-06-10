class ChatMessage {
  final String text;
  final messageType;
  final messageStatus;
  final bool isSender;
  final String peerprofile;

  ChatMessage({
    this.text = '',
    this.messageType,
    required this.messageStatus,
    required this.isSender,
    this.peerprofile = "",
  });
}
