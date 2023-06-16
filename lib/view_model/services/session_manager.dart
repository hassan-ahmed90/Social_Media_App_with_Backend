
class SessionController {
  static final SessionController _session = SessionController._internal();
  String? uid;

  factory SessionController() {
    return _session;
  }

  SessionController._internal() {

  }
}