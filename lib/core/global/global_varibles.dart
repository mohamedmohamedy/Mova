class GlobalVariables {
  static final GlobalVariables _globalVariables = GlobalVariables._internal();

  String _globalUserEmail = '';
  bool _ifUserWantedToBeRemembered = false;

  factory GlobalVariables() => _globalVariables;

  GlobalVariables._internal();

  String get getGlobalUserEmail => _globalUserEmail;
  set setGlobalUserEmail(String email) => _globalUserEmail = email;

  bool get getUserDecision => _ifUserWantedToBeRemembered;
  set setUserDecision(bool decision) => _ifUserWantedToBeRemembered = decision;
}
