class LoginRequest {
  final String entrada;
  final String clave;

  LoginRequest({required this.entrada, required this.clave});

  Map<String, dynamic> toJson() => {
    "entrada": entrada,
    "clave": clave,
  };
}
