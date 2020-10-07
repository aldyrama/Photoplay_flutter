import 'account_local_data_source.dart';
import 'account_repository_contract.dart';

import '../../../../core.dart';

class AccountRemoteDataSource extends AccountRepositoryContract {
  final RestClient restClient;
  final AccountLocalDataSource accountLocalDataSource;

  static final AccountRemoteDataSource _singleton = AccountRemoteDataSource._internal(
    restClient: RestClient(),
    accountLocalDataSource: AccountLocalDataSource(),
  );

  factory AccountRemoteDataSource() {
    return _singleton;
  }

  AccountRemoteDataSource._internal({this.restClient, this.accountLocalDataSource});

}