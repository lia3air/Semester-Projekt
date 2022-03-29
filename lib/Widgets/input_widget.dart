import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vegan/Constants/sizes.dart';

//Eigenes Textfeld

typedef void VoidCallback();

class InputWidget extends StatefulWidget {

  void Function(String) onInputChanged;
  void Function(String) onInputSubmitted;
  void Function(bool) onFocusChanged;
  bool Function() onReset;

  String placeHolder, text;
  bool passwordInput, placeHolderInsideOfInput;
  int maxLength, maxLines;
  TextInputType textInputType;
  Color color, textColor, placeHolderColor, focusedColor;

  InputWidget({required this.onInputChanged, required this.onFocusChanged, required this.onInputSubmitted, required this.onReset, this.placeHolder : "", this.text : "", this.passwordInput : false, this.maxLength : 10000, this.maxLines : 1, this.textInputType : TextInputType.text, this.color = const Color(0xffbbbbbb), this.textColor = const Color(0xffffffff), this.placeHolderColor = const Color(0xbbbbbbbb), this.focusedColor : const Color.fromARGB(255, 75, 75, 75), this.placeHolderInsideOfInput = true});

  @override
  _InputWidgetState createState() => _InputWidgetState();

}

class _InputWidgetState extends State<InputWidget> {

  FocusNode focus =  FocusNode();
  late Color currentColor;
  late TextEditingController inputController;


  @override
  void initState() {
    super.initState();
    currentColor = widget.color;
    inputController =  TextEditingController(text: widget.text);
    focus.addListener(onFocusChange);
  }

  void onFocusChange(){
    if(widget.onFocusChanged != null){
      widget.onFocusChanged(focus.hasFocus);
    }
    if(focus.hasFocus){
      setState(() {
        currentColor = widget.focusedColor;
      });
    }else{
      setState(() {
        currentColor = widget.color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Container(
          margin: EdgeInsets.only(bottom: !widget.placeHolderInsideOfInput ? Sizes.paddingSmall : 0),
          width: double.infinity,
          child: !widget.placeHolderInsideOfInput ?  Text(
            widget.placeHolder != null ? widget.placeHolder : "",
            style: TextStyle(
              fontSize: Sizes.textSizeSmall,
              color: widget.placeHolderColor,
              fontFamily: "Poppins Regular"
            ),
          ) :  Container(),
        ),
         AnimatedContainer(
          curve: Curves.ease,
          duration: widget.maxLines == 1 ? Duration(milliseconds: 250) : const Duration(milliseconds: 0),
          decoration:  BoxDecoration(
            color: currentColor,
            borderRadius: widget.maxLines == null || widget.maxLines == 1 ?  BorderRadius.circular(Sizes.width) :  BorderRadius.circular(Sizes.borderRadius)
          ),
          padding: EdgeInsets.symmetric(
            horizontal: Sizes.paddingSmall
          ),
          child:  TextField(
            focusNode: focus,
            inputFormatters: widget.maxLength != null ? [
              LengthLimitingTextInputFormatter(widget.maxLength)
            ] : [],
            decoration:  InputDecoration(
              border: InputBorder.none,
              hintText: widget.placeHolder != null && widget.placeHolderInsideOfInput ? widget.placeHolder : "",
              hintStyle:  TextStyle(
                color: widget.placeHolderColor,
                fontFamily: "Poppins-Regular",
                fontSize: Sizes.textSizeSmall,
              ),
            ),
            onSubmitted: (String value){
              widget.onInputSubmitted(value);
            },
            onChanged: (String value){
              widget.text = value;
              widget.onInputChanged(value);
            },
            obscureText: widget.passwordInput,
            controller: inputController,
            maxLines: widget.maxLines != null ? widget.maxLines : 1,
            cursorColor: Color(0xffffffff),
            autocorrect: false,
            //textInputAction: TextInputAction.done,
            textAlign: TextAlign.left,
            keyboardType: widget.textInputType,
            style:  TextStyle(
              color: widget.textColor,
              fontFamily: "Poppins Regular",
              fontSize: Sizes.textSizeSmall,
            ),
          ),
        ),
      ],
    );
  }
}
