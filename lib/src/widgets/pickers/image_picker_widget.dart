import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flounaelza/src/constants/app_colors_constant.dart';
import 'package:flounaelza/src/constants/asset_constant.dart';
import 'package:flounaelza/src/constants/locale_constant.dart';
import 'package:flounaelza/src/widgets/buttons/pressable.dart';
import 'package:flounaelza/src/widgets/snackbar/snackbar_widget.dart';
import 'package:flounaelza/src/widgets/texts/default_text.dart';
import 'package:flutter_localization/flutter_localization.dart';

enum ImagePickerVariant { avatar, companyLogo }

/// ### Example:
/// ```dart
/// File? _selectedLogoImage;
/// ImagePickerWidget(
///   selectedImage: _selectedLogoImage,
///   variant: ImagePickerVariant.companyLogo,
///   onImageSelected: (File? image) {
///     setState(() { _selectedLogoImage = image; });
///   },
///   onDeleteImage: () {
///     setState(() { _selectedLogoImage = null; });
///   },
/// ),
/// ImagePickerWidget(
///   selectedImage: _selectedAvatarImage,
///   variant: ImagePickerVariant.avatar,
///   onImageSelected: (File? image) {
///     setState(() { _selectedAvatarImage = image; });
///   },
///   onDeleteImage: () {
///     setState(() { _selectedAvatarImage = null; });
///   },
/// ),
/// ```
class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({
    super.key, 
    required this.selectedImage,
    this.allowCropImage = false, 
    this.onImageSelected,
    this.onDeleteImage,
    this.variant = ImagePickerVariant.companyLogo,
    this.imageSource = ImageSource.gallery,
  });

  final File? selectedImage; 
  final bool allowCropImage;
  final Function(File?)? onImageSelected;
  final Function()? onDeleteImage;
  final ImagePickerVariant variant;
  final ImageSource imageSource;

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  Future _pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: widget.imageSource);
      if (image == null) return;
      File? img = File(image.path);

      if (widget.allowCropImage) {
        img = await _cropImage(imageFile: img);
      }

      setState(() {
        widget.onImageSelected?.call(img);
      });
    } on PlatformException catch (e) {
      SnackbarWidget.error(message: e.toString());
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: imageFile.path
    );
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  @override
  Widget build(BuildContext context) {
    return widget.variant == ImagePickerVariant.avatar
      ? _buildAvatarImagePicker(context)
      : _buildCompanyLogoImagePicker(context);
  }

  _buildAvatarImagePicker(BuildContext context) {
    return Pressable(
      onPressed: (){
        _pickImage();
      },
      child: Stack(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: AppColors.backgroundColor,
            backgroundImage: widget.selectedImage != null
              ? FileImage(widget.selectedImage!)
              : const AssetImage(
                  ImageAssetConstant.avatarPlaceholderImage,
                )
          ),
          Positioned(
            bottom: 2,
            right: 2,
            child: SvgPicture.asset(
              height: 20,
              width: 20,
              SvgAssetConstant.editAvatarIcon,
            )
          ),
        ],
      ),
    );
  }

  _buildCompanyLogoImagePicker(BuildContext context) {
    return widget.selectedImage != null
    ? Container(
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.neutral300,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 90,
              height: 90,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.file(
                  widget.selectedImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Pressable(
              onPressed: () {
                setState(() {
                  widget.onDeleteImage?.call();
                });
              },
              child: Row(
                children: [
                  DefaultText(
                    text: AppLocale.delete.getString(context),
                    type: DefaultTextType.textSM,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.errorColor,
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.delete,
                    color: AppColors.errorColor,
                  )
                ],
              ),
            ),
          ],
        ),
      )
    : Pressable(
        onPressed: (){
          _pickImage();
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(6),
            color: AppColors.neutral400,
            dashPattern: const [8, 4],
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 24),
              width: double.infinity,
              child: Column(
                children: [
                  SvgPicture.asset(
                    SvgAssetConstant.galleryIcon,
                    colorFilter: const ColorFilter.mode(
                      AppColors.neutral500,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(height: 8),
                  DefaultText(
                    text: AppLocale.clickToUpload.getString(context),
                    type: DefaultTextType.text3XS,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.neutral500,
                  ),
                  DefaultText(
                    text: AppLocale.clickToUpload.getString(context),
                    type: DefaultTextType.text3XS,
                    weight: DefaultTextWeight.regular,
                    color: AppColors.neutral500,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  }
}