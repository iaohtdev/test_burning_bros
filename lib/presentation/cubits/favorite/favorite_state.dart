part of 'favorite_cubit.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();

  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteAdded extends FavoriteState {
  final ProductItem product;

  const FavoriteAdded(this.product);

  @override
  List<Object> get props => [product];
}

class FavoriteRemoved extends FavoriteState {
  final int productId;

  const FavoriteRemoved(this.productId);

  @override
  List<Object> get props => [productId];
}

class FavoriteChecked extends FavoriteState {
  final int productId;
  final bool isFavorite;

  const FavoriteChecked(this.productId, this.isFavorite);

  @override
  List<Object> get props => [productId, isFavorite];
}

class FavoritesLoaded extends FavoriteState {
  final List<ProductItem> favorites;

  const FavoritesLoaded(this.favorites);

  @override
  List<Object> get props => [favorites];
}
