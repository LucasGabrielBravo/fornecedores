class Fornecedor {
  final String matricula;
  final String nome;
  final String cidade;
  final String estado;

  Fornecedor({
    required this.matricula,
    required this.nome,
    required this.cidade,
    required this.estado,
  });

  factory Fornecedor.fromMap(Map<String, dynamic> data) {
    return Fornecedor(
      matricula: data['matricula'],
      nome: data['nome'],
      cidade: data['cidade'],
      estado: data['estado'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'matricula': matricula,
      'nome': nome,
      'cidade': cidade,
      'estado': estado,
    };
  } 
}