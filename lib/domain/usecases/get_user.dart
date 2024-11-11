import 'package:sales_app/data/models/user.dart';
import 'package:sales_app/data/repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);

  Future<User?> call() {
    return repository.getUser();
  }
}
