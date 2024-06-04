import 'package:flutter/material.dart';
import 'package:image_editor/models/text_info.dart';
import 'package:image_editor/screens/edit_image_screen.dart';
import 'package:image_editor/widgets/default_button.dart';

abstract class EditImageViewModel extends State<EditImageScreen> {
  TextEditingController textEditingController = TextEditingController();
  TextEditingController creatorText = TextEditingController();
  List<TextInfo> texts=[];
  int currentIndex=0;
  setCurrentIndex(BuildContext context,index){
    setState((){
      currentIndex=index;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content:Text('Selected For Styling',style:TextStyle(fontSize:16))));
  }
  changeTextColor(Color color){
    setState((){
      texts[currentIndex].color=color;
    });
  }
  increaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize++;
    });
  }

  decreaseFontSize() {
    setState(() {
      texts[currentIndex].fontSize--;
    });
  }

  alignLeft() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.left;
    });
  }

  alignCenter() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.center;
    });
  }

  alignRight() {
    setState(() {
      texts[currentIndex].textAlign = TextAlign.right;
    });
  }

  boldText() {
    setState(() {
      if (texts[currentIndex].fontWeight == FontWeight.bold) {
        texts[currentIndex].fontWeight = FontWeight.normal;
      } else {
        texts[currentIndex].fontWeight = FontWeight.bold;
      }
    });
  }

  italicText() {
    setState(() {
      if (texts[currentIndex].fontStyle == FontStyle.italic) {
        texts[currentIndex].fontStyle = FontStyle.normal;
      } else {
        texts[currentIndex].fontStyle = FontStyle.italic;
      }
    });
  }

  addLinesToText() {
    setState(() {
      if (texts[currentIndex].text.contains('\n')) {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll('\n', ' ');
      } else {
        texts[currentIndex].text =
            texts[currentIndex].text.replaceAll(' ', '\n');
      }
    });
  }
  addNewText(BuildContext context){
    setState((){
      texts.add(TextInfo(text: textEditingController.text, left: 0, top: 0, color: Colors.black, fontWeight: FontWeight.normal, fontStyle: FontStyle.normal, fontSize: 20, textAlign: TextAlign.left));
    });
    Navigator.of(context).pop();
  }

  addNewDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Add New Text'),
        content: TextField(
          controller: textEditingController,
          maxLines: 5,
          decoration: const InputDecoration(
            suffixIcon: Icon(Icons.edit),
            filled: true,
            hintText: 'Your Text Here....',
          ),
        ),
        actions:<Widget>[
          DefaultButton(onPressed: ()=>Navigator.of(context).pop(), child: const Text('Back'), color: Colors.white, textColor: Colors.black),
          DefaultButton(onPressed:()=>addNewText(context), child: Text('Add Text'), color: Colors.green, textColor: Colors.black),
        ]
      ),
    );
  }
}
