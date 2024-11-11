import 'package:sales_app/data/datasources/auth_remote_data_source.dart';

class AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepository(this.remoteDataSource);

  Future<String?> login(String username, String password) {
    return remoteDataSource.login(username, password);
  }
}
