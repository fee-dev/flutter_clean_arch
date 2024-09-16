import 'package:get_it/get_it.dart';

import 'package:testtest/core/di/app.dart';
import 'package:testtest/core/di/bloc.dart';
import 'package:testtest/core/di/local.dart';
import 'package:testtest/core/di/remote.dart';
import 'package:testtest/core/di/repository.dart';
import 'package:testtest/core/di/services.dart';
import 'package:testtest/core/di/source.dart';
import 'package:testtest/core/di/usecase.dart';

void initializeDi(GetIt getIt) {
  registerLocal(getIt);
  registerCoreServices(getIt);
  registerRemote(getIt);
  registerSources(getIt);
  registerRepositories(getIt);
  registerApp(getIt);
  registerAppServices(getIt);
  registerUseCases(getIt);
  registerBloc(getIt);
}
