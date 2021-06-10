import 'package:fetch_todos/core/data/http_client.dart';
import 'package:fetch_todos/core/providers/loading_provider.dart';
import 'package:fetch_todos/features/todos_list/data/repositories/fetch_todos_repository_impl.dart';
import 'package:fetch_todos/features/todos_list/data/services/fetch_todos_service_impl.dart';
import 'package:fetch_todos/features/todos_list/domain/repositories/fetch_todos_repository.dart';
import 'package:fetch_todos/features/todos_list/domain/services/fetch_todos_service.dart';
import 'package:fetch_todos/features/todos_list/presentation/providers/todos_list_provider.dart';
import 'package:get_it/get_it.dart';

// This is our global ServiceLocator
GetIt getIt = GetIt.instance;

class Dependencyinjector {
  static void init() {
    getIt.registerLazySingleton(() => HttpClient());

    // coreProviders
    getIt.registerLazySingleton(() => LoadingProvider());

    // providers
    getIt.registerLazySingleton(
      () => TodoListProvider(
        fetchTodosRepository: getIt(),
        loadingProvider: getIt(),
      ),
    );

    // repositories
    getIt.registerLazySingleton<FetchTodosRepository>(
        () => FetchTodosRepositoryImp(service: getIt()));

    //services
    getIt.registerLazySingleton<FetchTodosService>(
        () => FetchTodosServiceImp(client: getIt()));
  }
}
