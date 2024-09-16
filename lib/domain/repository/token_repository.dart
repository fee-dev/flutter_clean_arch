import 'package:testtest/domain/entity/authentication/authentication.dart';

abstract class TokenRepository {
  String? accessToken;
  String? refreshToken;

  Future<void> clear();

  Future<void> update(Authentication authEntity);

  Future<Authentication?> getAuthData();
}
