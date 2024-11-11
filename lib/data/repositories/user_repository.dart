import 'package:sales_app/data/datasources/user_remote_data_source.dart';
import 'package:sales_app/data/models/user.dart';

class UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepository(this.remoteDataSource);

  Future<User?> getUser() {
    return remoteDataSource.fetchUserData();
  }
}
