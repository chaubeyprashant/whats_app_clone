import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:agora_project/config/agora_config.dart';
import 'package:agora_project/models/call.dart';
import 'package:agora_project/constants.dart';
import '../../../common/utility/circularloader.dart';
import '../controller/call_controller.dart';

class CallScreen extends ConsumerStatefulWidget {
  final String channelId;
  final Call call;
  final bool isGroupChat;
  const CallScreen({
    Key? key,
    required this.channelId,
    required this.call,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CallScreenState();
}

class _CallScreenState extends ConsumerState<CallScreen> {
  AgoraClient? client;
  String baseUrl = AppConstant.baseUrl;

  @override
  void initState() {
    super.initState();
    client = AgoraClient(
      agoraConnectionData: AgoraConnectionData(
        appId: AgoraConfig.appId,
        channelName: widget.channelId,
        tokenUrl: baseUrl,
      ),
    );
    initAgora();
  }

  void initAgora() async {
    await client!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: client == null
          ? const Loader()
          : SafeArea(
              child: Stack(
                children: [
                  AgoraVideoViewer(client: client!),
                  AgoraVideoButtons(
                    client: client!,
                    disconnectButtonChild: IconButton(
                      onPressed: () async {
                        await client!.engine.leaveChannel();
                        // ignore: use_build_context_synchronously
                        ref.read(callControllerProvider).endCall(
                              widget.call.callerId,
                              widget.call.receiverId,
                              context,
                            );
                        ref.read(callControllerProvider).endGroupCall(
                            widget.call.callerId,
                            widget.call.receiverId,
                            context);
                        // ignore: use_build_context_synchronously
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.call_end),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
