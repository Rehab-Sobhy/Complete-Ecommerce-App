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

class GetCategoriesSuccess extends LayoutCubitState {}

class GetCategoriesFailed extends LayoutCubitState {}

class GetCategoriesLoading extends LayoutCubitState {}

class GetProductSuccess extends LayoutCubitState {}

class GetProductFailed extends LayoutCubitState {}

class GetProductLoading extends LayoutCubitState {}
