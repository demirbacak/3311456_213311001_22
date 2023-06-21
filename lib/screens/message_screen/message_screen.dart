import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> with TickerProviderStateMixin{

  bool _isMessageEmpty = true;

  final List<Message> _mesages = [];

  final _textController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  void _handleSubmitted(String text){
    _textController.clear();
    Message newMessage = Message(
      text: text,
      animationController: AnimationController(
        duration:const Duration(milliseconds: 700),
        vsync: this,),
    );
    setState(() {
      _mesages.insert(0, newMessage);
      _isMessageEmpty = true;
    });
    _focusNode.requestFocus();
    newMessage.animationController.forward();
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
                  _isMessageEmpty = text.isEmpty;
                });
              },
              controller: _textController,
              onSubmitted: _isMessageEmpty ? null : _handleSubmitted,
              focusNode: _focusNode,
              decoration: const InputDecoration.collapsed(hintText: "send"),
            ),
          ),
          IconButton(
              onPressed: _isMessageEmpty ? null : ()=>_handleSubmitted(_textController.text),
              icon: const Icon(FontAwesomeIcons.paperPlane)),
        ],
      ),
    );
  }

  @override
  void dispose(){
    for(Message mesaj in _mesages ) {
      mesaj.animationController.dispose();
    }
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color1,
        title: const Text("send a message",
            style: TextStyle(
                fontSize: 20, color: color2, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Flexible(child: ListView.builder(
            padding: const EdgeInsets.all(8),
            reverse: true,
            itemBuilder: (_, int index) => _mesages[index],
            itemCount: _mesages.length,),
          ),
          const Divider(height: 6.0,),
          Container(decoration: const BoxDecoration(
            color: color1,
          ),child: _buildTextConposer(),
          ),
        ],
      ),
    );
  }
}


class Message extends StatelessWidget {
  // const Mesaj({Key? key}) : super(key: key);

  const Message({super.key,  required this.text, required this.animationController});
  final String text;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(parent: animationController, curve:Curves.easeOut ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Text(text),
      ),
    );
  }
}
