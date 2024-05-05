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

class FilteringProducts extends LayoutCubitState {}

class GetFavoritesSuccessState extends LayoutCubitState {}

class FailedToGetFavoritesState extends LayoutCubitState {}

class AddOrRemoveItemFromFavoritesSuccessState extends LayoutCubitState {}

class FailedToAddOrRemoveItemFromFavoritesState extends LayoutCubitState {}

class GetBannersLoadingState extends LayoutCubitState {}

class GetBannersSuccessState extends LayoutCubitState {}

class FailedToGetBannersState extends LayoutCubitState {}

class GetCategoriesSuccessState extends LayoutCubitState {}

class FailedToGetCategoriesState extends LayoutCubitState {}

class GetProductsSuccessState extends LayoutCubitState {}

class FailedToGetProductsState extends LayoutCubitState {}

class FilterProductsSuccessState extends LayoutCubitState {}

class GetCartsSuccessState extends LayoutCubitState {}

class FailedToGetCartsState extends LayoutCubitState {}

class ChangePasswordLoadingState extends LayoutCubitState {}

class ChangePasswordSuccessState extends LayoutCubitState {}

class ChangePasswordWithFailureState extends LayoutCubitState {
  String error;

  ChangePasswordWithFailureState(this.error);
}

class UpdateUserDataLoadingState extends LayoutCubitState {}

class UpdateUserDataSuccessState extends LayoutCubitState {}

class UpdateUserDataWithFailureState extends LayoutCubitState {
  String error;

  UpdateUserDataWithFailureState(this.error);
}
