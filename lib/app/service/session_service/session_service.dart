import 'dart:async';

import 'package:flutter/foundation.dart';

import 'package:testtest/app/service/session_service/session_status.dart';
import 'package:testtest/core/di/repository.dart';
import 'package:testtest/domain/entity/authentication/authentication.dart';

class SessionService extends ChangeNotifier {
  SessionStatus _sessionStatus = SessionStatus.closed;

  SessionStatus get sessionStatus => _sessionStatus;

  Future<void> renewSession() async {
    final authData = await tokenRepository.getAuthData();
    if (authData == null) {
      return;
    }
    if (authData.accessToken.isEmpty) {
      return;
    }
    _sessionStatus = SessionStatus.open;

    notifyListeners();
  }

  Future<void> openSession(Authentication authEntity) async {
    await tokenRepository.update(authEntity);
    _sessionStatus = SessionStatus.open;

    notifyListeners();
  }

  Future<void> closeSession() async {
    await tokenRepository.clear();
    _sessionStatus = SessionStatus.closed;

    notifyListeners();
  }
}
