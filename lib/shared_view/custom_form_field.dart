// // ignore: file_names
// import 'package:digicard/cores/constans/padding_constants.dart';
// import 'package:digicard/data/source/network/result_dto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';


// class TextFormFieldCustom extends StatefulWidget {
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final bool autoFocus;
//   final int? maxLength;
//   final bool enable;
//   final bool isPassword;
//   final String? hintText;
//   final String? helperText;
//   final String? errorText;
//   final String? labelText;
//   final String? suffixText;
//   final TextCapitalization textCapitalization;
//   final Widget? icon;
//   final TextStyle? textStyle;
//   final FocusNode? focusNode;
//   final TextAlign textAlign;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmited;
//   final String? Function(String?)? validator;
//   final List<TextInputFormatter>? formaters;
//   final bool isCollapsed;
//   final bool hasError;
//   final EdgeInsets? contentPadding;
//   final Errors? errors;
//   final EdgeInsets scrollPadding;
//   final Widget? suffixIcon;
//   final TextStyle? hintStyle;
//   final int? maxLine;
//   final int? minLine;
//   final BorderRadius? radius;
//   final Color? focusColor;
//   final Color? fillColor;
//   final Color? blurColorBorder;
//   final Color? enableInputColor;
//   final VoidCallback? onTap;
//   final TextInputAction? textInputAction;

//   const TextFormFieldCustom({
//     Key? key,
//     this.controller,
//     this.maxLine = 1,
//     this.textInputType,
//     this.maxLength,
//     this.minLine,
//     this.enable = true,
//     this.isPassword = false,
//     this.hintText,
//     this.onTap,
//     this.textInputAction,
//     this.focusColor,
//     this.onSubmited,
//     this.labelText,
//     this.fillColor,
//     this.helperText,
//     this.enableInputColor,
//     this.errorText,
//     this.blurColorBorder,
//     this.icon,
//     this.textStyle,
//     this.focusNode,
//     this.onChanged,
//     this.validator,
//     this.hintStyle,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.formaters,
//     this.autoFocus = false,
//     this.textAlign = TextAlign.start,
//     this.suffixText,
//     this.isCollapsed = false,
//     this.radius,
//     this.contentPadding = PaddingConstants.padAll12,
//     this.errors,
//     this.hasError = false,
//     this.suffixIcon,
//     this.scrollPadding = const EdgeInsets.only(bottom: 16.0),
//   })  : assert(maxLength == null || maxLength > 0),
//         super(key: key);

//   @override
//   _TextFormFieldCustomState createState() => _TextFormFieldCustomState();
// }

// class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
//   late bool showPassword;
//   late String content;
//   late TextEditingController controller;

//   _TextFormFieldCustomState();

//   @override
//   void initState() {
//     showPassword = widget.isPassword;
//     controller = widget.controller ?? TextEditingController(text: '');
//     content = controller.text;
//     super.initState();
//   }

//   Color getColorBorderFocus() {
//     return widget.focusColor ?? Theme.of(context).primary;
//   }

//   Color getColorBorderBlur() {
//     return widget.blurColorBorder ?? Theme.of(context).background;
//   }

//   Color getColorBorderError() {
//     return Theme.of(context).errorColor1;
//   }

//   BorderRadius getBorderRadius() {
//     return widget.radius ?? BorderRadiusConstants.bor04;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       controller: controller,
//       style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//       keyboardType: widget.textInputType,
//       textCapitalization: widget.textCapitalization,
//       enabled: widget.enable,
//       onTap: widget.onTap,
//       textInputAction: widget.textInputAction,
//       readOnly: widget.onTap != null,
//       maxLength: widget.maxLength,
//       onChanged: (val) {
//         setState(() {
//           content = val;
//           widget.onChanged?.call(content);
//         });
//       },
//       obscuringCharacter: '•',
//       obscureText: showPassword,
//       focusNode: widget.focusNode,
//       onFieldSubmitted: (val) {
//         widget.onSubmited?.call(content);
//       },
//       autofocus: widget.autoFocus,
//       maxLines: widget.maxLine,
//       minLines: widget.minLine,
//       textAlign: widget.textAlign,
//       validator: widget.validator,
//       scrollPadding: widget.scrollPadding,
//       decoration: InputDecoration(
//           isCollapsed: widget.isCollapsed,
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderFocus(), width: 3),
//             borderRadius: getBorderRadius(),
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//                 color: widget.enableInputColor == null
//                     ? getColorBorderBlur()
//                     : Colors.transparent,
//                 width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderError(), width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderBlur(), width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderError(), width: 1),
//             borderRadius: getBorderRadius(),
//           ),
//           prefixIcon: widget.icon,
//           contentPadding: widget.contentPadding,
//           hintText: widget.hintText,
//           fillColor: widget.fillColor ?? context.backgroundColor,
//           hintStyle: widget.hintStyle ??
//               Theme.of(context).textTheme.labelLarge?.copyWith(
//                   color: Theme.of(context).neutral6,
//                   fontWeight: FontWeight.w400),
//           suffixText: widget.suffixText,
//           filled: true,
//           counterText: '',
//           labelStyle:
//               widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//           labelText: widget.labelText,
//           helperText: widget.helperText,
//           suffixIcon: widget.suffixIcon),
//     );
//   }

//   Widget getSuffixIcon(BuildContext context, String content,
//       {bool isPassword = false}) {
//     return Transform.translate(
//         offset: const Offset(10, 0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (isPassword)
//               GestureDetector(
//                 child: ImageIcon(
//                   !showPassword
//                       ? const AssetImage(ImageConstants.icVisibility)
//                       : const AssetImage(ImageConstants.icVisibilityOff),
//                   color: Theme.of(context).neutral4,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     showPassword = !showPassword;
//                   });
//                 },
//               )
//           ],
//         ));
//   }
// }

// class TextFormFieldCustomBorder extends StatefulWidget {
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final bool autoFocus;
//   final int? maxLength;
//   final bool enable;
//   final bool isPassword;
//   final String? hintText;
//   final String? helperText;
//   final String? errorText;
//   final String? labelText;
//   final String? suffixText;
//   final TextCapitalization textCapitalization;
//   final Widget? icon;
//   final TextStyle? textStyle;
//   final FocusNode? focusNode;
//   final TextAlign textAlign;
//   final ValueChanged<String>? onChanged;
//   final String? Function(String?)? validator;
//   final List<TextInputFormatter>? formaters;
//   final bool isCollapsed;
//   final bool hasError;
//   final EdgeInsets contentPadding;
//   final Errors? errors;
//   final EdgeInsets scrollPadding;
//   final Widget? suffixIcon;
//   final TextStyle? hintStyle;
//   final int? maxLine;
//   final Color? fillColor;
//   final void Function(String?)? onSaved;

//   const TextFormFieldCustomBorder({
//     Key? key,
//     this.onSaved,
//     this.controller,
//     this.maxLine = 1,
//     this.textInputType,
//     this.maxLength,
//     this.enable = true,
//     this.isPassword = false,
//     this.hintText,
//     this.labelText,
//     this.fillColor,
//     this.helperText,
//     this.errorText,
//     this.icon,
//     this.textStyle,
//     this.focusNode,
//     this.onChanged,
//     this.validator,
//     this.hintStyle,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.formaters,
//     this.autoFocus = false,
//     this.textAlign = TextAlign.start,
//     this.suffixText,
//     this.isCollapsed = false,
//     this.contentPadding = PaddingConstants.padAll12,
//     this.errors,
//     this.hasError = false,
//     this.suffixIcon,
//     this.scrollPadding = const EdgeInsets.only(bottom: 16.0),
//   })  : assert(maxLength == null || maxLength > 0),
//         super(key: key);

//   @override
//   _CustomTextFormFieldWithBorderState createState() =>
//       _CustomTextFormFieldWithBorderState();
// }

// class _CustomTextFormFieldWithBorderState
//     extends State<TextFormFieldCustomBorder> {
//   late bool showPassword;
//   late String content;
//   late TextEditingController controller;

//   _CustomTextFormFieldWithBorderState();

//   @override
//   void initState() {
//     showPassword = widget.isPassword;
//     controller = widget.controller ?? TextEditingController(text: '');
//     content = controller.text;
//     super.initState();
//   }

//   Color getColorBorderFocus() {
//     return Theme.of(context).primary;
//   }

//   Color getColorBorderBlur() {
//     return Theme.of(context).neutral7;
//   }

//   Color getColorBorderError() {
//     return Theme.of(context).errorColor1;
//   }

//   BorderRadius getBorderRadius() {
//     return BorderRadiusConstants.bor08;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         TextFormField(
//           style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//           keyboardType: widget.textInputType,
//           textCapitalization: widget.textCapitalization,
//           enabled: widget.enable,
//           maxLength: widget.maxLength,
//           controller: controller,
//           inputFormatters: widget.formaters ?? [],
//           onChanged: (val) {
//             setState(() {
//               content = val;
//             });
//             widget.onChanged?.call(val);
//           },
//           onSaved: widget.onSaved,
//           obscuringCharacter: '•',
//           obscureText: showPassword,
//           focusNode: widget.focusNode,
//           autofocus: widget.autoFocus,
//           textAlign: widget.textAlign,
//           maxLines: widget.maxLine,
//           validator: widget.validator,
//           scrollPadding: widget.scrollPadding,
//           decoration: InputDecoration(
//             // suffixIconConstraints: BoxConstraints(minHeight: 0, minWidth: 0),
//             filled: true,
//             isCollapsed: widget.isCollapsed,
//             contentPadding: widget.contentPadding,
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: getColorBorderFocus(), width: 1.5),
//               borderRadius: getBorderRadius(),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: getColorBorderBlur(), width: 1.5),
//               borderRadius: getBorderRadius(),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: getColorBorderError(), width: 1.5),
//               borderRadius: getBorderRadius(),
//             ),
//             disabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: getColorBorderBlur(), width: 1.5),
//               borderRadius: getBorderRadius(),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: getColorBorderError(), width: 1),
//               borderRadius: getBorderRadius(),
//             ),
//             prefixIcon: widget.icon,
//             hintText: widget.hintText,
//             fillColor: widget.enable
//                 ? widget.fillColor ?? context.backgroundColor
//                 : Theme.of(context).disabledColor.withOpacity(0.15),
//             suffixText: widget.suffixText,
//             counterText: '',
//             labelStyle:
//                 widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//             labelText: widget.labelText,
//             helperText: widget.helperText,
//             hintStyle: widget.hintStyle ??
//                 Theme.of(context).textTheme.labelLarge?.copyWith(
//                     color: Theme.of(context).neutral6,
//                     fontWeight: FontWeight.w400),
//             suffixIcon: widget.suffixIcon ??
//                 getSuffixIcon(
//                   context,
//                   content,
//                   isPassword: widget.isPassword,
//                 ),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget getSuffixIcon(BuildContext context, String content,
//       {bool isPassword = false}) {
//     return Transform.translate(
//         offset: const Offset(10, 0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (isPassword)
//               GestureDetector(
//                 child: ImageIcon(
//                   !showPassword
//                       ? const AssetImage(ImageConstants.icVisibility)
//                       : const AssetImage(ImageConstants.icVisibilityOff),
//                   color: Theme.of(context).neutral4,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     showPassword = !showPassword;
//                   });
//                 },
//               )
//           ],
//         ));
//   }
// }

// class TextFieldCustom extends StatefulWidget {
//   final TextEditingController? controller;
//   final TextInputType? textInputType;
//   final bool autoFocus;
//   final int? maxLength;
//   final bool enable;
//   final bool isPassword;
//   final String? hintText;
//   final String? helperText;
//   final String? errorText;
//   final String? labelText;
//   final String? suffixText;
//   final TextCapitalization textCapitalization;
//   final Widget? icon;
//   final TextStyle? textStyle;
//   final FocusNode? focusNode;
//   final TextAlign textAlign;
//   final ValueChanged<String>? onChanged;
//   final ValueChanged<String>? onSubmited;
//   final List<TextInputFormatter>? formaters;
//   final bool isCollapsed;
//   final bool hasError;
//   final EdgeInsets? contentPadding;
//   final Errors? errors;
//   final EdgeInsets scrollPadding;
//   final Widget? suffixIcon;
//   final TextStyle? hintStyle;
//   final int? maxLine;
//   final int? minLine;
//   final BorderRadius? radius;
//   final Color? focusColor;
//   final Color? fillColor;
//   final Color? blurColorBorder;
//   final Color? enableInputColor;
//   final VoidCallback? onTap;
//   final TextInputAction? textInputAction;

//   const TextFieldCustom({
//     Key? key,
//     this.controller,
//     this.maxLine = 1,
//     this.textInputType,
//     this.maxLength,
//     this.minLine,
//     this.enable = true,
//     this.isPassword = false,
//     this.hintText,
//     this.onTap,
//     this.textInputAction,
//     this.focusColor,
//     this.onSubmited,
//     this.labelText,
//     this.fillColor,
//     this.helperText,
//     this.enableInputColor,
//     this.errorText,
//     this.blurColorBorder,
//     this.icon,
//     this.textStyle,
//     this.focusNode,
//     this.onChanged,
//     this.hintStyle,
//     this.textCapitalization = TextCapitalization.sentences,
//     this.formaters,
//     this.autoFocus = false,
//     this.textAlign = TextAlign.start,
//     this.suffixText,
//     this.isCollapsed = false,
//     this.radius,
//     this.contentPadding = PaddingConstants.padAll12,
//     this.errors,
//     this.hasError = false,
//     this.suffixIcon,
//     this.scrollPadding = const EdgeInsets.only(bottom: 16.0),
//   })  : assert(maxLength == null || maxLength > 0),
//         super(key: key);

//   @override
//   _TextFieldCustomState createState() => _TextFieldCustomState();
// }

// class _TextFieldCustomState extends State<TextFieldCustom> {
//   late bool showPassword;
//   late String content;
//   late TextEditingController controller;

//   _TextFieldCustomState();

//   @override
//   void initState() {
//     showPassword = widget.isPassword;
//     controller = widget.controller ?? TextEditingController(text: '');
//     content = controller.text;
//     super.initState();
//   }

//   Color getColorBorderFocus() {
//     return widget.focusColor ?? Theme.of(context).primary;
//   }

//   Color getColorBorderBlur() {
//     return widget.blurColorBorder ?? Theme.of(context).background;
//   }

//   Color getColorBorderError() {
//     return Theme.of(context).errorColor1;
//   }

//   BorderRadius getBorderRadius() {
//     return widget.radius ?? BorderRadiusConstants.bor04;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       style: widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//       keyboardType: widget.textInputType,
//       textCapitalization: widget.textCapitalization,
//       enabled: widget.enable,
//       onTap: widget.onTap,
//       textInputAction: widget.textInputAction,
//       readOnly: widget.onTap != null,
//       maxLength: widget.maxLength,
//       onChanged: (val) {
//         setState(() {
//           content = val;
//           widget.onChanged?.call(content);
//         });
//       },
//       obscuringCharacter: '•',
//       obscureText: showPassword,
//       focusNode: widget.focusNode,
//       onSubmitted: (val) {
//         widget.onSubmited?.call(content);
//       },
//       autofocus: widget.autoFocus,
//       maxLines: widget.maxLine,
//       minLines: widget.minLine,
//       textAlign: widget.textAlign,
//       scrollPadding: widget.scrollPadding,
//       decoration: InputDecoration(
//           isCollapsed: widget.isCollapsed,
//           focusedBorder: UnderlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderFocus(), width: 3),
//             borderRadius: getBorderRadius(),
//           ),
//           enabledBorder: UnderlineInputBorder(
//             borderSide: BorderSide(
//                 color: widget.enableInputColor == null
//                     ? getColorBorderBlur()
//                     : Colors.transparent,
//                 width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderError(), width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           disabledBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderBlur(), width: 1.5),
//             borderRadius: getBorderRadius(),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: getColorBorderError(), width: 1),
//             borderRadius: getBorderRadius(),
//           ),
//           prefixIcon: widget.icon,
//           contentPadding: widget.contentPadding,
//           hintText: widget.hintText,
//           fillColor: widget.fillColor ?? context.backgroundColor,
//           hintStyle: widget.hintStyle ??
//               Theme.of(context).textTheme.labelLarge?.copyWith(
//                   color: Theme.of(context).neutral6,
//                   fontWeight: FontWeight.w400),
//           suffixText: widget.suffixText,
//           filled: true,
//           counterText: '',
//           labelStyle:
//               widget.textStyle ?? Theme.of(context).textTheme.labelLarge,
//           labelText: widget.labelText,
//           helperText: widget.helperText,
//           suffixIcon: widget.suffixIcon),
//     );
//   }

//   Widget getSuffixIcon(BuildContext context, String content,
//       {bool isPassword = false}) {
//     return Transform.translate(
//         offset: const Offset(10, 0),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             if (isPassword)
//               GestureDetector(
//                 child: ImageIcon(
//                   !showPassword
//                       ? const AssetImage(ImageConstants.icVisibility)
//                       : const AssetImage(ImageConstants.icVisibilityOff),
//                   color: Theme.of(context).neutral4,
//                 ),
//                 onTap: () {
//                   setState(() {
//                     showPassword = !showPassword;
//                   });
//                 },
//               )
//           ],
//         ));
//   }
// }
