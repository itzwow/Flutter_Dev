import 'package:flutter/material.dart';

Image logowidget(String imgname) {
  return Image.asset(
    imgname,
    fit: BoxFit.fitWidth,
    width: 140,
    height: 140,

    // color: Colors.white,
  );
}

TextField reusableTextField(String text, IconData icon, bool isPasswordType,
    TextEditingController controller) {
  return TextField(
    controller: controller,
    obscureText: isPasswordType,
    enableSuggestions: !isPasswordType,
    autocorrect: !isPasswordType,
    style: TextStyle(color: Colors.white.withOpacity(0.8)),
    decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white70,
        ),
        labelText: text,
        labelStyle: TextStyle(color: Colors.white.withOpacity((0.9))),
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        fillColor: Colors.white.withOpacity(0.3),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(width: 0, style: BorderStyle.none),
        )),
    keyboardType: isPasswordType
        ? TextInputType.visiblePassword
        : TextInputType.emailAddress,
  );
}

//Login button
Container reusableButton(
    BuildContext context, bool isLogin, Function ? onTap()) {
  return Container(
      // width: MediaQuery.of(context).size.width,
      width: double.infinity,
      height: 50,
      // margin: const EdgeInsets.fromLTRB(0,10,0, 20),
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0)),
      child: ElevatedButton(
        child: Text(
          isLogin ? 'Login' : 'Sign-Up',
          style: TextStyle(
              color: Colors.black54, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              Colors.blueGrey.withOpacity((0.4))),
        ),

        onPressed: () {
          onTap();
        },
      ));
}


//Alert Box
SnackBar alertBox(BuildContext context, String textMessage, String color){
  return SnackBar(content: Container(
    height: 90,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: color=="red"?Colors.redAccent:Colors.green,
      borderRadius: BorderRadius.circular(20),
    ),

    child: Column(
      children: [
        Text(color=="red"?"Ohh Snap!":"Success", style: TextStyle(fontSize: 18, color: Colors.white),),
        Text("$textMessage", style: TextStyle(fontSize: 12, color: Colors.white),
          overflow: TextOverflow.ellipsis,

        ),
      ],

    ),

  ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}
