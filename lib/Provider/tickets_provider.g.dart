// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tickets_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getTicketHash() => r'5a5ade5ef81f88eb37f4d517c5d3fe1c5c0a637e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getTicket].
@ProviderFor(getTicket)
const getTicketProvider = GetTicketFamily();

/// See also [getTicket].
class GetTicketFamily extends Family<AsyncValue<SingleTicketResponse>> {
  /// See also [getTicket].
  const GetTicketFamily();

  /// See also [getTicket].
  GetTicketProvider call(
    String id,
  ) {
    return GetTicketProvider(
      id,
    );
  }

  @override
  GetTicketProvider getProviderOverride(
    covariant GetTicketProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getTicketProvider';
}

/// See also [getTicket].
class GetTicketProvider extends FutureProvider<SingleTicketResponse> {
  /// See also [getTicket].
  GetTicketProvider(
    String id,
  ) : this._internal(
          (ref) => getTicket(
            ref as GetTicketRef,
            id,
          ),
          from: getTicketProvider,
          name: r'getTicketProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getTicketHash,
          dependencies: GetTicketFamily._dependencies,
          allTransitiveDependencies: GetTicketFamily._allTransitiveDependencies,
          id: id,
        );

  GetTicketProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<SingleTicketResponse> Function(GetTicketRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetTicketProvider._internal(
        (ref) => create(ref as GetTicketRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  FutureProviderElement<SingleTicketResponse> createElement() {
    return _GetTicketProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetTicketProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetTicketRef on FutureProviderRef<SingleTicketResponse> {
  /// The parameter `id` of this provider.
  String get id;
}

class _GetTicketProviderElement
    extends FutureProviderElement<SingleTicketResponse> with GetTicketRef {
  _GetTicketProviderElement(super.provider);

  @override
  String get id => (origin as GetTicketProvider).id;
}

String _$allTicketsHash() => r'c08103d68b738e8ecd6be6fc3e04299c90045b95';

/// See also [AllTickets].
@ProviderFor(AllTickets)
final allTicketsProvider =
    AutoDisposeAsyncNotifierProvider<AllTickets, TicketsResponse>.internal(
  AllTickets.new,
  name: r'allTicketsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$allTicketsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AllTickets = AutoDisposeAsyncNotifier<TicketsResponse>;
String _$addTicketHash() => r'709601fadf612d68a87d62fcd8000804c60e4c3c';

/// See also [AddTicket].
@ProviderFor(AddTicket)
final addTicketProvider =
    AutoDisposeAsyncNotifierProvider<AddTicket, SuccessResponse?>.internal(
  AddTicket.new,
  name: r'addTicketProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$addTicketHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AddTicket = AutoDisposeAsyncNotifier<SuccessResponse?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
