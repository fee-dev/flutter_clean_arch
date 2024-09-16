import 'package:testtest/core/arch/domain/entity/common/result.dart';
import 'package:testtest/domain/entity/authentication/authentication.dart';

abstract class RefreshTokenRepository {
  Future<Result<Authentication>> refresh(String refreshToken);
}
