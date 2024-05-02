abstract class LayoutCubitState {}

class LayOutIntialize extends LayoutCubitState {}

class GetSuccess extends LayoutCubitState {}

class GetFailed extends LayoutCubitState {
  String error;
  GetFailed({required this.error});
}

class GetLoading extends LayoutCubitState {}

class GetBannerSuccess extends LayoutCubitState {}

class GetBannerFailed extends LayoutCubitState {}

class GetBannerLoading extends LayoutCubitState {}
