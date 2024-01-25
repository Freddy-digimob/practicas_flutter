abstract class AppState {
  List<String> data;

  AppState({required this.data});
}

class InitData extends AppState {
  InitData() : super(data: []);
}

class LoadingData extends AppState {
  List<String> allData;
  LoadingData({required this.allData}) : super(data: allData);
}

class GetData extends AppState {
  List<String> allData;

  GetData({required this.allData}) : super(data: allData);
}
