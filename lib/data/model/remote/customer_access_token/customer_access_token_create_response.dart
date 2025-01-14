import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:testtest/data/model/remote/customer_access_token/customer_access_token.dart';
import 'package:testtest/data/model/remote/customer_access_token/customer_user_error_response.dart';

part 'customer_access_token_create_response.g.dart';

@JsonSerializable()
class CustomerAccessTokenCreateResponse {
  const CustomerAccessTokenCreateResponse(
    this.typename,
    this.customerAccessToken,
    this.customerUserErrors,
  );

  @JsonKey(name: '__typename')
  final String? typename;
  final CustomerAccessToken? customerAccessToken;
  final List<CustomerUserErrorResponse>? customerUserErrors;

  factory CustomerAccessTokenCreateResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return _$CustomerAccessTokenCreateResponseFromJson(json);
  }
}
