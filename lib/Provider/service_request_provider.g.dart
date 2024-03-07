// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_request_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myServiceRequestHash() => r'e5e1cfd7797ff43257ca23e9407722e5e227fb3e';

/// See also [MyServiceRequest].
@ProviderFor(MyServiceRequest)
final myServiceRequestProvider =
    AsyncNotifierProvider<MyServiceRequest, ServiceRequestResponse>.internal(
  MyServiceRequest.new,
  name: r'myServiceRequestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myServiceRequestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyServiceRequest = AsyncNotifier<ServiceRequestResponse>;
String _$acceptBookingHash() => r'af03546a8ac5be2b6fb6d4091ccf56f3fb177df9';

/// See also [AcceptBooking].
@ProviderFor(AcceptBooking)
final acceptBookingProvider =
    AutoDisposeAsyncNotifierProvider<AcceptBooking, SuccessResponse>.internal(
  AcceptBooking.new,
  name: r'acceptBookingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$acceptBookingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AcceptBooking = AutoDisposeAsyncNotifier<SuccessResponse>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
