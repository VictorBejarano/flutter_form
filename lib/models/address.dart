/// Modelo de Direccion
///   Parámetros:
///   * [street] Direccion
///   * [city] Ciudad
///   * [state] Estado
///   * [zipCode] Codigo postal
class Address {
  final String street;
  final String city;
  final String state;
  final String zipCode;

  /// Crea una instancia de Address
  Address({
    required this.street,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  /// Crea json a partir de [Address]
  Map<String, dynamic> toJson() => {
        'street': street,
        'city': city,
        'state': state,
        'zipCode': zipCode,
      };

  /// Crea [Address] a partir de json
  factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json['street'],
        city: json['city'],
        state: json['state'],
        zipCode: json['zipCode'],
      );
}
