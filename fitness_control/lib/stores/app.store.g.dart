// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppStore on _AppStore, Store {
  final _$idAtom = Atom(name: '_AppStore.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_AppStore.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_AppStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_AppStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$pictureAtom = Atom(name: '_AppStore.picture');

  @override
  String get picture {
    _$pictureAtom.context.enforceReadPolicy(_$pictureAtom);
    _$pictureAtom.reportObserved();
    return super.picture;
  }

  @override
  set picture(String value) {
    _$pictureAtom.context.conditionallyRunInAction(() {
      super.picture = value;
      _$pictureAtom.reportChanged();
    }, _$pictureAtom, name: '${_$pictureAtom.name}_set');
  }

  final _$typeUserAtom = Atom(name: '_AppStore.typeUser');

  @override
  String get typeUser {
    _$typeUserAtom.context.enforceReadPolicy(_$typeUserAtom);
    _$typeUserAtom.reportObserved();
    return super.typeUser;
  }

  @override
  set typeUser(String value) {
    _$typeUserAtom.context.conditionallyRunInAction(() {
      super.typeUser = value;
      _$typeUserAtom.reportChanged();
    }, _$typeUserAtom, name: '${_$typeUserAtom.name}_set');
  }

  final _$accessTokenAtom = Atom(name: '_AppStore.accessToken');

  @override
  String get accessToken {
    _$accessTokenAtom.context.enforceReadPolicy(_$accessTokenAtom);
    _$accessTokenAtom.reportObserved();
    return super.accessToken;
  }

  @override
  set accessToken(String value) {
    _$accessTokenAtom.context.conditionallyRunInAction(() {
      super.accessToken = value;
      _$accessTokenAtom.reportChanged();
    }, _$accessTokenAtom, name: '${_$accessTokenAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  void setUser(int pIdUser, String pName, String pEmail, String pPassword,
      String pPicture, String pTypeUser, String pToken) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.setUser(
          pIdUser, pName, pEmail, pPassword, pPicture, pTypeUser, pToken);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
