import 'package:dio/dio.dart';
import 'package:product_manager/app/models/user_model.dart';

class UsersRepository {
  UsersRepository({required this.client});

  final Dio client;

  Future<UserModel> getRandomUser(String id) async {
    try {
      final response = await client.get<dynamic>('/users/$id');

      final responseData = response.data as Map<String, dynamic>;

      final user = UserModel.fromJson(responseData);

      return user;
    } on DioException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      rethrow;
    }
  }
}
