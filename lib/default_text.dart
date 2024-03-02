import 'package:flutter/widgets.dart';
// import 'package:google_fonts/google_fonts.dart';

class default_text extends StatelessWidget {
  final String text = '';
  final double size = 0;
  final Color color = Color.fromARGB(250, 255, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Text(text, selectionColor: color);
  }
  // const default_text({this.text, this.size, this.color});

  // Widget build(BuildContext context) {
  //   return Text(
  //     text,
  //     TextStyle: GoogleFonts.alegreyaSans,
  //     selectionColor: color
  //   )
  // }
}
