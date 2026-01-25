class RegistrarInsumosDto {
  final String? idExterno;
  final String haciendaIdExterno;
  final List<Map<String, dynamic>> items;

  RegistrarInsumosDto({
    this.idExterno,
    required this.haciendaIdExterno,
    required this.items,
  });

  Map<String, dynamic> toJson() => {
        if (idExterno != null) 'idExterno': idExterno,
        'haciendaIdExterno': haciendaIdExterno,
        'items': items,
      };
}