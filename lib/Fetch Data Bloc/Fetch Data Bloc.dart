import 'package:flutter_bloc/flutter_bloc.dart';
import 'Fetch Data Event.dart';
import 'Fetch Data States.dart';
import '../Models/Data.dart';
import '../Repository/Fetch Places API.dart';
class FetchDataBloc extends Bloc<FetchDataEvent,FetchDataState>{
  FetchDataBloc() : super(null);
   List<Data>places;

  @override
  Stream<FetchDataState> mapEventToState(FetchDataEvent event)async* {
    if (event is FetchDataEvent) {
      yield LoadingState();
      try {
        places = await FetchPlacesAPI().FetchData();
        if (places != null) {
          yield LoadingDataSuccessfulState(places);
        }
        else {
          yield LoadingState();
        }
      }
      catch (error) {
        yield ErrorState(error.toString());
      }
    }
  }
}