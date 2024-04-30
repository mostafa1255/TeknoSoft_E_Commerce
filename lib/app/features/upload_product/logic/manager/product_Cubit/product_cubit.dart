import 'package:bloc/bloc.dart';
import 'package:e_commerce/app/features/upload_product/data/models/Products_Model.dart';
import 'package:e_commerce/app/features/upload_product/data/repos/image_picker_repo/image_picker_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/product_Repo/product_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit({required this.productRepo, required this.imagePickerRepo})
      : super(ProductInitial());
  ImagePickerRepo imagePickerRepo;
  ProductRepo productRepo;
  final productNameController = TextEditingController();
  final productDescreptionController = TextEditingController();
  final productPriceController = TextEditingController();
  String productCategoryController = "";
  String productImageUrl = '';

  Future<void> getUserUploadedProducts() async {
    emit(ProductsLoading());
    var result = await productRepo.getUserUploadedProducts();
    result.fold((faliure) {
      emit(ProductsFaliure(errMessage: faliure.errmessage));
    }, (products) {
      if (products.isEmpty) {
        return emit(VendorNotHaveProducts());
      }
      emit(ProductsSuccsess(products: products));
    });
  }

  Future<void> uploadProducts({required BuildContext context}) async {
    emit(ProductAddedLoading());
    var result = await productRepo.uploadProducts(
        category: productCategoryController,
        descreption: productDescreptionController.text,
        name: productNameController.text,
        price: productPriceController.text,
        productImageUrl: productImageUrl);
    result.fold((faliure) {
      emit(ProductAddedFaliure(errMessage: faliure.errmessage));
    }, (success) {
      clearControllers();
      emit(ProductAddedSuccsess());
    });
  }

  void clearControllers() {
    productNameController.clear();
    productDescreptionController.clear();
    productPriceController.clear();
    productCategoryController = "";
    productImageUrl = '';
  }

  Future<void> getImageFromGalleryAndUploadtoStorage() async {
    var result = await imagePickerRepo.getImageFromGallery();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
    }, (image) async {
      emit(ImageSelectedSuccsess());
      emit(ImageUploadedLoading());
      var result2 =
          await imagePickerRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageUploadedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageUploadedSuccsess(imageUrl: imageurl));
      });
    });
  }

  Future<void> getImageFromCameraAndUploadtoStorage() async {
    emit(ImageSelectedLoading());
    var result = await imagePickerRepo.getImageFromCamera();
    result.fold((faliure) {
      emit(ImageSelectedFaliure(errMessage: faliure.errmessage));
    }, (image) async {
      emit(ImageSelectedSuccsess());
      emit(ImageUploadedLoading());
      var result2 =
          await imagePickerRepo.uploadImageToStorage(userImage: image);
      result2.fold((faliure) {
        emit(ImageUploadedFaliure(errMessage: faliure.errmessage));
      }, (imageurl) {
        emit(ImageUploadedSuccsess(imageUrl: imageurl));
      });
    });
  }
}
