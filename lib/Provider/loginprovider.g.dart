// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'loginprovider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$loginMechHash() => r'72614b67ebae0d01aa1e961c1440788c7a0862b1';

/// See also [LoginMech].
@ProviderFor(LoginMech)
final loginMechProvider =
    AsyncNotifierProvider<LoginMech, LoginResponse?>.internal(
  LoginMech.new,
  name: r'loginMechProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$loginMechHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LoginMech = AsyncNotifier<LoginResponse?>;
String _$signUpHash() => r'f8ed145676779ccdbb251c24991df74132eef07d';

/// Implementation for SignUp provider
///
/// Copied from [SignUp].
@ProviderFor(SignUp)
final signUpProvider =
    AutoDisposeAsyncNotifierProvider<SignUp, RegistrationResponse>.internal(
  SignUp.new,
  name: r'signUpProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$signUpHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SignUp = AutoDisposeAsyncNotifier<RegistrationResponse>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
