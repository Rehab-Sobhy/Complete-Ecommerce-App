import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_commerce_app/account/profile_cubit/layout_cubit_states.dart';
import 'package:http/http.dart' as https;

class LayOutCubit extends Cubit<LayoutCubitState> {
  LayOutCubit() : super(LayOutIntialize());

  void getData() {
    https.get(Uri.parse(""), headers: {
      'Authorization': token,
    });
  }
}
