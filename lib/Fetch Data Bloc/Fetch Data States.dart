

 import 'package:equatable/equatable.dart';
import '../Models/Data.dart';
abstract class FetchDataState extends Equatable{
}

class LoadingState extends FetchDataState{
  @override
  // TODO: implement props
  List<Object> get props => [];

}
 class LoadingDataSuccessfulState extends FetchDataState{
   List<Data> places;
  LoadingDataSuccessfulState(this.places);
  @override
  // TODO: implement props
  List<Object> get props => [places];
 }


 // ignore: must_be_immutable
 class ErrorState extends FetchDataState{
 String messageError;
 ErrorState(this.messageError);
  @override
  // TODO: implement props
  List<Object> get props => [messageError];
 }
