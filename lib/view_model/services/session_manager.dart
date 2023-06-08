
class SessionController {
  static final SessionController _session = SessionController._internal();
  String? Uid;

  factory SessionController() {
    return _session;
  }

  SessionController._internal() {

  }
}