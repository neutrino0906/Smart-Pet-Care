import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart' as dotenv;
import 'package:velocity_x/velocity_x.dart';

// import '../widgets/chatMessage.dart';
import '../widgets/threeDots.dart';
import '../widgets/chatMessage.dart';

// class ChatScreen extends StatelessWidget {
//   const ChatScreen({super.key});
//   String getRoute() => "ChatScreen";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//           toolbarHeight: 80,
//           iconTheme: IconThemeData(color: Colors.black),
//           centerTitle: true,
//           actions: const [
//             Icon(
//               Icons.person,
//               color: Color.fromARGB(255, 0, 0, 0),
//             ),
//             SizedBox(
//               width: 20,
//             )
//           ],
//           // shadowColor: Colors.black,
//           elevation: 0,
//           backgroundColor: Colors.transparent),
//       body: Column(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             width: MediaQuery.of(context).size.width * 0.7,
//             height: 2,
//             color: Colors.black,
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
// }

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});
  String getRoute() => "ChatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];
  late OpenAI? chatGPT;
  bool _isImageSearch = false;

  bool _isTyping = false;

  @override
  void initState() {
    chatGPT = OpenAI.instance;
    super.initState();
  }

  @override
  void dispose() {
    // chatGPT?.close();
    // chatGPT?.genImgClose();
    // chatGPT?.cancelAIGenerate();
    super.dispose();
  }

  // Link for api - https://beta.openai.com/account/api-keys

  void _sendMessage() async {
    if (_controller.text.isEmpty) return;
    ChatMessage message = ChatMessage(
      text: _controller.text,
      sender: "user",
      isImage: false,
    );

    setState(() {
      _messages.insert(0, message);
      _isTyping = true;
    });

    _controller.clear();

    if (_isImageSearch) {
      final request = GenerateImage(message.text, 1, size: ImageSize.size256);

      final response = await chatGPT!.generateImage(request);
      Vx.log(response!.data!.last!.url!);
      insertNewData(response.data!.last!.url!, isImage: true);
    } else {
      final request =
          CompleteText(prompt: message.text, model: TextDavinci3Model());

      final response = await chatGPT!
          .build(
            // token: "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",
            token: "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",
          )
          .onCompletion(request: request);
      Vx.log(response!.choices[0].text);
      insertNewData(response.choices[0].text, isImage: false);
    }
  }

  void insertNewData(String response, {bool isImage = false}) {
    ChatMessage botMessage = ChatMessage(
      text: response,
      sender: "bot",
      isImage: isImage,
    );

    setState(() {
      _isTyping = false;
      _messages.insert(0, botMessage);
    });
  }

  Widget _buildTextComposer() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _controller,
            onSubmitted: (value) => _sendMessage(),
            decoration: const InputDecoration.collapsed(
                hintText: "Question/description"),
          ),
        ),
        ButtonBar(
          children: [
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                _isImageSearch = false;
                _sendMessage();
              },
            ),
            TextButton(
                onPressed: () {
                  _isImageSearch = true;
                  _sendMessage();
                },
                child: const Text("Generate Image"))
          ],
        ),
      ],
    ).px16();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            toolbarHeight: 80,
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: const [
              Icon(
                Icons.person,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              SizedBox(
                width: 20,
              )
            ],
            // shadowColor: Colors.black,
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 2,
                color: Colors.black,
              ),
              const SizedBox(height: 20),
              Flexible(
                  child: ListView.builder(
                reverse: true,
                padding: Vx.m8,
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  return _messages[index];
                },
              )),
              if (_isTyping) const ThreeDots(),
              const Divider(
                height: 1.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: context.cardColor,
                ),
                child: _buildTextComposer(),
              )
            ],
          ),
        ));
  }
}
