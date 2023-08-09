import 'package:objectbox/objectbox.dart';
import 'package:taskmanager/data/data.dart';
import 'package:taskmanager/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:taskmanager/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:taskmanager/ui/views/home/home_view.dart';
import 'package:taskmanager/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:taskmanager/ui/views/task_list/task_list_view.dart';

import '../data/source/mock_data_source.dart';
import '../di/di.dart';
import '../domain/domain.dart';
import 'package:taskmanager/ui/views/add_task/add_task_view.dart';
import 'package:taskmanager/ui/views/task_detail/task_detail_view.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: TaskListView),
    MaterialRoute(page: AddTaskView),
    MaterialRoute(page: TaskDetailView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(
      classType: TaskRepositoryImpl,
      asType: TaskRepository,
    ),
    LazySingleton(classType: LocalDataSource, asType: DataSource),
    Presolve(
      classType: AppModule,
      asType: Store,
      presolveUsing: AppModule.getStore,
    ),

// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
// @stacked-dialog
  ],
)
class App {}
