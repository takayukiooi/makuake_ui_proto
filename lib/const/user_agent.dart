import 'dart:io';

const kUserAgentBase = 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/62.0.3202.94 Mobile Safari/537.36';
final os = Platform.isIOS ? 'makuake-ios' : 'makuake-android';
final makuakeUserAgent = '$kUserAgentBase $os';
