// ignore_for_file: public_member_api_docs, sort_constructors_first
class Endereco {
  final String logradouro;
  final int numero;
  final String bairro;

  Endereco(this.logradouro, this.numero, this.bairro);

  @override
  int get hashCode => logradouro.hashCode ^ numero.hashCode ^ bairro.hashCode;

  @override
  bool operator ==(covariant Endereco other) {
    if (identical(this, other)) return true;
    return other.hashCode == hashCode;
  }
}

class User {
  final String username;
  final String password;
  final Endereco endereco;

  User(this.username, this.password, this.endereco);

  @override
  int get hashCode => username.hashCode ^ password.hashCode ^ endereco.hashCode;
}

void main() {
  final endereco = Endereco("Rua bd", 448, "Rosa Elze");
  final endereco2 = Endereco("Rua bd", 448, "Rosa Elze");
  final user = User("nayanne", "123456", endereco);
  final user2 = User("igorgoncalves", "123456", endereco2);
  print(user.endereco == user2.endereco);
}
