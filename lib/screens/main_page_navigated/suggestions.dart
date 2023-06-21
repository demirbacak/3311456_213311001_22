import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  State<Suggestions> createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> with TickerProviderStateMixin{

  bool _isSuggestionEmpty = true;

  final List<Suggestion> _suggestions = [];

  final _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text){
    _textController.clear();
    Suggestion newSuggestion = Suggestion(

      text: text,
      animationController: AnimationController(
        duration:const Duration(milliseconds: 700),
        vsync: this,),
    );
    setState(() {
      _suggestions.insert(0, newSuggestion);
      _isSuggestionEmpty = true;
    });
    _focusNode.requestFocus();
    newSuggestion.animationController.forward();
  }

  Widget _buildTextConposer(){
    return Container(
      margin:  const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              onChanged: (String text){
                setState(() {
                  _isSuggestionEmpty = text.isEmpty;
                });
              },
              controller: _textController,
              onSubmitted: _isSuggestionEmpty ? null : _handleSubmitted,
              focusNode: _focusNode,
              decoration: const InputDecoration.collapsed(hintText: "we care about your opinions"),
            ),
          ),
          IconButton(
              onPressed: _isSuggestionEmpty ? null : ()=>_handleSubmitted(_textController.text),
              icon: const Icon(FontAwesomeIcons.paperPlane)),
        ],
      ),
    );
  }

  @override
  void dispose(){
    for(Suggestion mySuggest in _suggestions ) {
      mySuggest.animationController.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("suggestions",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(decoration: const BoxDecoration(
            color: color2,
          ),child: _buildTextConposer(),
          ),
          const Divider(height: 6.0,),
          Flexible(child: ListView.builder(
            padding: const EdgeInsets.all(8),
           // reverse: true,
            itemBuilder: (_, int index) => _suggestions[index],
            itemCount: _suggestions.length,),
          ),


        ],
      ),
    );
  }
}


class Suggestion extends StatelessWidget {
  // const Mesaj({Key? key}) : super(key: key);

  const Suggestion({super.key,  required this.text, required this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve:Curves.easeOut ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: BorderRadius.circular(6),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
            style: const TextStyle(
              color: color2,
            ),),
          ),
        ),
      ),
    );
  }
}


/*class Suggestios extends StatelessWidget {
  const Suggestios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("suggestions",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: " We care about your opinions."),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text(
                            "Thanks for feedback",
                            style: (TextStyle(
                              fontStyle: FontStyle.italic,
                            )),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    child: const Text(
                      "send",
                      style: TextStyle(
                        color: color2,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),

    );
  }
}*/
/*lass Suggestios extends StatelessWidget {
  const Suggestios({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("suggestions",
            style: TextStyle(
                fontSize: 18, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              decoration: const InputDecoration(
                  hintText: " We care about your opinions."),
              keyboardType: TextInputType.text,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => const AlertDialog(
                          content: Text(
                            "Thanks for feedback",
                            style: (TextStyle(
                              fontStyle: FontStyle.italic,
                            )),
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: color1),
                    child: const Text(
                      "send",
                      style: TextStyle(
                        color: color2,
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
      persistentFooterButtons: [
        buildFooterButtons(context),
      ],
    );
  }
}

 */
