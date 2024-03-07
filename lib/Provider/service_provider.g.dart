// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$systemServicesHash() => r'2970391658b2905123fcef34fe20d60b3ee36d4b';

/// See also [systemServices].
@ProviderFor(systemServices)
final systemServicesProvider =
    AutoDisposeFutureProvider<ServiceResponse>.internal(
  systemServices,
  name: r'systemServicesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$systemServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef SystemServicesRef = AutoDisposeFutureProviderRef<ServiceResponse>;
String _$allServicesHash() => r'66af6d2ac0e9c7c810c1de44153ece2e751bfac5';

/// See also [AllServices].
@ProviderFor(AllServices)
final allServicesProvider =
    AutoDisposeAsyncNotifierProvider<AllServices, ServiceResponse>.internal(
  AllServices.new,
  name: r'allServicesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allServicesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllServices = AutoDisposeAsyncNotifier<ServiceResponse>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
