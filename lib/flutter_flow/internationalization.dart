import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // WelcomeScreen
  {
    'sz9dux2j': {
      'en': 'Welcome!',
      'hi': 'स्वागत!',
    },
    'j2yq8gyo': {
      'en':
          'Start your journey to a healthier, more active lifestyle. Join live sessions, walk while you talk, and track your steps effortlessly.',
      'hi':
          'एक स्वस्थ, अधिक सक्रिय जीवनशैली की ओर अपनी यात्रा शुरू करें। लाइव सेशन में शामिल हों, बात करते हुए चलें और अपने कदमों को सहजता से ट्रैक करें।',
    },
    '8sof5c07': {
      'en': 'Get Started',
      'hi': 'शुरू हो जाओ',
    },
    'pm9bjeqq': {
      'en': 'My Account',
      'hi': 'मेरा खाता',
    },
    '6v1zwfeq': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // OnBoardingScreen
  {
    'v7dupwv2': {
      'en': 'Fitness Stats',
      'hi': 'फिटनेस आँकड़े',
    },
    'u0utc4qk': {
      'en':
          'Stay on top of your fitness journey with real-time stats. Monitor your steps, calories burned, distance covered, and more, all in one place. Set your goals, track your achievements, and see the progress you\'ve made daily. Your fitness journey starts here!\n\n',
      'hi':
          'वास्तविक समय के आँकड़ों के साथ अपनी फिटनेस यात्रा पर नज़र रखें। अपने कदमों, बर्न की गई कैलोरी, तय की गई दूरी और बहुत कुछ पर नज़र रखें, सब एक ही जगह पर। अपने लक्ष्य निर्धारित करें, अपनी उपलब्धियों को ट्रैक करें और रोज़ाना अपनी प्रगति देखें। आपकी फिटनेस यात्रा यहीं से शुरू होती है!',
    },
    'clvni9c5': {
      'en': 'Personal Trainer',
      'hi': 'निजी प्रशिक्षक',
    },
    'gl73djqi': {
      'en':
          'Connect with certified personal trainers who understand your fitness goals. Enjoy tailored workout plans, personalized feedback, and motivation directly in the app. From beginners to pros, our trainers are here to guide you every step of the way.',
      'hi':
          'प्रमाणित व्यक्तिगत प्रशिक्षकों से जुड़ें जो आपके फिटनेस लक्ष्यों को समझते हैं। ऐप में सीधे अनुकूलित वर्कआउट प्लान, व्यक्तिगत फीडबैक और प्रेरणा का आनंद लें। शुरुआती से लेकर पेशेवरों तक, हमारे प्रशिक्षक आपको हर कदम पर मार्गदर्शन करने के लिए मौजूद हैं।',
    },
    '5hkln261': {
      'en': 'Healthy Habit',
      'hi': 'स्वस्थ आदत',
    },
    'u6tdhjft': {
      'en':
          'Create and maintain healthy habits that fit your lifestyle. From daily walks to mindful eating, track your habits and see the positive impact on your health. Small steps lead to big changes—start building better habits today!\n\n',
      'hi':
          'अपनी जीवनशैली के अनुकूल स्वस्थ आदतें बनाएँ और उन्हें बनाए रखें। रोज़ाना टहलने से लेकर ध्यानपूर्वक खाने तक, अपनी आदतों पर नज़र रखें और अपने स्वास्थ्य पर सकारात्मक प्रभाव देखें। छोटे-छोटे कदम बड़े बदलाव लाते हैं—आज से ही बेहतर आदतें बनाना शुरू करें!',
    },
    '80bj8ws8': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // LoginScreen
  {
    'a922furx': {
      'en': 'Fitty',
      'hi': 'फिट्टी',
    },
    '7hv1dwzn': {
      'en': '',
      'hi': '',
    },
    '3l9drgj0': {
      'en': 'Mobile Number',
      'hi': 'मोबाइल नंबर',
    },
    'igpbm5pl': {
      'en': '',
      'hi': '',
    },
    'bw7tndsu': {
      'en': 'Send OTP',
      'hi': 'ओटीपी भेजें',
    },
    'cxu104i9': {
      'en': 'By creating account, you agree to ',
      'hi': 'खाता बनाकर, आप सहमत होते हैं',
    },
    '4hr4kzfb': {
      'en': 'Fitty,',
      'hi': 'फिट्टी,',
    },
    'xyh25b38': {
      'en': ' Terms and Conditions ',
      'hi': 'नियम और शर्तें',
    },
    '6uijtmhf': {
      'en': ' and ',
      'hi': 'और',
    },
    'zsffq6hh': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
    },
    's890mh6l': {
      'en': '.',
      'hi': '.',
    },
    'o4uxmt3h': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // OtpScreen
  {
    'lzp4nne1': {
      'en': 'Fitty',
      'hi': 'फिट्टी',
    },
    'zdrqfmka': {
      'en': 'OTP sent to ',
      'hi': 'ओटीपी भेजा गया',
    },
    '71e1lqwy': {
      'en': ' ',
      'hi': '',
    },
    '0erf6er8': {
      'en': '(Wrong Number)',
      'hi': '(गलत संख्या)',
    },
    'nrsb9wzl': {
      'en': 'Verify & Continue',
      'hi': 'सत्यापित करें और जारी रखें',
    },
    'jbwd1ca1': {
      'en': 'By creating account, you agree to ',
      'hi': 'खाता बनाकर, आप सहमत होते हैं',
    },
    'o0cter3k': {
      'en': 'Fitty,',
      'hi': 'फिट्टी,',
    },
    '9rm9a228': {
      'en': ' Terms and Conditions ',
      'hi': 'नियम और शर्तें',
    },
    'fu9a2i0z': {
      'en': ' and ',
      'hi': 'और',
    },
    'j7xz4r2j': {
      'en': 'Privacy Policy',
      'hi': 'गोपनीयता नीति',
    },
    'qhmoxo0q': {
      'en': '.',
      'hi': '.',
    },
    '7de0z1nn': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Home-Fit
  {
    '5g0tr13n': {
      'en': 'Yoga Room\'s',
      'hi': 'योग कक्ष',
    },
    '2qp7iaj2': {
      'en': 'Yoga Day Room',
      'hi': 'योग दिवस कक्ष',
    },
    'azk5xcgs': {
      'en': 'Anyone can join this ',
      'hi': 'कोई भी इसमें शामिल हो सकता है',
    },
    'nz0bft14': {
      'en': 'Fitty',
      'hi': 'फिट्टी',
    },
    '7x4pfrw4': {
      'en': 'Fit',
      'hi': 'उपयुक्त',
    },
  },
  // Home-MyDay
  {
    'hjt6mnk2': {
      'en': 'My Day',
      'hi': 'मेरा दिन',
    },
    'o0a8lquv': {
      'en': 'Your total steps seince from last ',
      'hi': '',
    },
    '5ep8sd7b': {
      'en': 'Fitty',
      'hi': 'फिट्टी',
    },
    'tt9dn6ub': {
      'en': 'My Day',
      'hi': 'मेरा दिन',
    },
  },
  // Home-Friends
  {
    '0n1zkcsy': {
      'en': 'Top Fitty Friends',
      'hi': 'शीर्ष फिटी मित्र',
    },
    '2fjjmgn7': {
      'en': 'All friends',
      'hi': 'सभी दोस्त',
    },
    '3ce2a8tr': {
      'en': 'Last Message',
      'hi': 'अंतिम संदेश',
    },
    'c1p1cejg': {
      'en': 'Fitty',
      'hi': 'फिट्टी',
    },
    'qpk1brus': {
      'en': 'Friends',
      'hi': 'दोस्त',
    },
  },
  // ProfileScreen
  {
    'n1o9nzv5': {
      'en': 'Below are your profile details',
      'hi': 'नीचे आपकी प्रोफ़ाइल का विवरण दिया गया है',
    },
    's8glw5ee': {
      'en': 'Manage your account',
      'hi': 'अपना खाता प्रबंधित करें',
    },
    'vxcvoxq8': {
      'en': 'Edit Profile',
      'hi': 'प्रोफ़ाइल संपादित करें',
    },
    '8tn2tiuu': {
      'en': 'Reset Password',
      'hi': 'पासवर्ड रीसेट',
    },
    '2u94lp1n': {
      'en': 'English',
      'hi': 'अंग्रेज़ी',
    },
    'tsolikn0': {
      'en': 'Hindi',
      'hi': 'हिन्दी',
    },
    'tjyvydrj': {
      'en': 'Get in Touch',
      'hi': 'संपर्क में रहो',
    },
    'd9y9e9p6': {
      'en': 'Help & Support',
      'hi': 'सहायता एवं समर्थन',
    },
    '6wpbf23o': {
      'en': 'Share [App Name]',
      'hi': '[ऐप का नाम] साझा करें',
    },
    'ptu85yfz': {
      'en': 'Logout',
      'hi': 'लॉग आउट',
    },
    'beldhufr': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
    },
    'x546iwhv': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // EditProfileScreen
  {
    'd1w7uq19': {
      'en': 'Below are your profile details',
      'hi': 'नीचे आपकी प्रोफ़ाइल का विवरण दिया गया है',
    },
    'qnx5kln5': {
      'en': 'Change Photo',
      'hi': 'छवि बदलो',
    },
    '4de4wwgj': {
      'en': '',
      'hi': 'आपका नाम',
    },
    '6wq8sp27': {
      'en': 'Your Name',
      'hi': 'आपका नाम',
    },
    '86uxc20s': {
      'en': '',
      'hi': '',
    },
    'qw5vk36v': {
      'en': '',
      'hi': '',
    },
    'j9sy6gp8': {
      'en': 'Your Email',
      'hi': 'आपका ईमेल',
    },
    '4p4n875f': {
      'en': '',
      'hi': '',
    },
    'ioo4keaw': {
      'en': 'Date of Birth',
      'hi': 'जन्म तिथि',
    },
    'bmzvbm28': {
      'en': 'Gender',
      'hi': 'लिंग',
    },
    'scff2dd7': {
      'en': 'Male',
      'hi': 'पुरुष',
    },
    '3ucawamk': {
      'en': 'Male',
      'hi': 'पुरुष',
    },
    'xfhsgi4d': {
      'en': 'Female',
      'hi': 'महिला',
    },
    '929axg83': {
      'en': '',
      'hi': '',
    },
    'u2wiqlhs': {
      'en': 'Height (Fit)',
      'hi': 'ऊंचाई (फिट)',
    },
    'rscqmkk6': {
      'en': '',
      'hi': '',
    },
    '3sa3wk55': {
      'en': 'Weight (KG)',
      'hi': 'वजन (किलोग्राम)',
    },
    '20znbepf': {
      'en': '',
      'hi': '',
    },
    'c763h0ie': {
      'en': 'Cancel',
      'hi': 'रद्द करना',
    },
    'srnnhc3h': {
      'en': 'Save Changes',
      'hi': 'परिवर्तनों को सुरक्षित करें',
    },
    'fbx89t91': {
      'en': 'Field is required',
      'hi': '',
    },
    '59yh1mql': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '5rtu2u9u': {
      'en': 'Field is required',
      'hi': '',
    },
    'wtlpi8qi': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'pu9ba286': {
      'en': 'Field is required',
      'hi': '',
    },
    '2o00brf5': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'dfjpzl89': {
      'en': 'Profile',
      'hi': 'प्रोफ़ाइल',
    },
    '21r0x9oq': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // UserSearch
  {
    'lfv9yitl': {
      'en': 'Search for users...',
      'hi': 'उपयोगकर्ताओं को खोजें...',
    },
    'kx88sx4s': {
      'en': 'Recent search...',
      'hi': 'हाल ही की खोज...',
    },
    'mgkqphry': {
      'en': 'Search users',
      'hi': 'उपयोगकर्ता खोजें',
    },
    'hywqr7wq': {
      'en': 'Requests',
      'hi': 'अनुरोध',
    },
    'uj6dg8ra': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // ViewRequests
  {
    'b901u6x2': {
      'en': 'Recent search...',
      'hi': 'हाल ही की खोज...',
    },
    'r433s7mj': {
      'en': 'Friend Requests',
      'hi': 'मित्र अनुरोध',
    },
    'vt6zs26o': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // Room
  {
    'iih0463m': {
      'en': 'Home',
      'hi': 'घर',
    },
  },
  // UserInfoSheet
  {
    '5ab1odgv': {
      'en': '- Remove Friend',
      'hi': '- मित्र को हटाएँ',
    },
    'hrgxtka4': {
      'en': '+ Add Friend',
      'hi': '+ मित्र जोड़ें',
    },
    'ljotla8c': {
      'en': 'Requested',
      'hi': 'अनुरोधित',
    },
  },
  // Miscellaneous
  {
    '4i6f0juf': {
      'en': 'Button',
      'hi': 'बटन',
    },
    'ud8rbi5c': {
      'en': 'Button',
      'hi': 'बटन',
    },
    'ujnwdwd6': {
      'en': 'TextField',
      'hi': 'पाठ्य से भरा',
    },
    'aw7k4ol0': {
      'en': 'To join walk room with camera',
      'hi': 'वॉक रूम को कैमरे से जोड़ने के लिए',
    },
    'kfomxq3g': {
      'en': 'To update the profile photo',
      'hi': 'प्रोफ़ाइल फ़ोटो अपडेट करने के लिए',
    },
    'qzeykeg3': {
      'en': 'This application tracks your steps',
      'hi': 'यह एप्लिकेशन आपके कदमों को ट्रैक करता है',
    },
    'yrxtttlu': {
      'en': 'This app will microphone for calls',
      'hi': 'यह ऐप कॉल के लिए माइक्रोफ़ोन करेगा',
    },
    'kiza8w49': {
      'en': '',
      'hi': '',
    },
    'lhedw8z3': {
      'en': '',
      'hi': '',
    },
    'fhoep6cg': {
      'en': '',
      'hi': '',
    },
    'dhspt2hb': {
      'en': '',
      'hi': '',
    },
    'fbyu487q': {
      'en': '',
      'hi': '',
    },
    'xa2t47k9': {
      'en': '',
      'hi': '',
    },
    'eu0fid6g': {
      'en': '',
      'hi': '',
    },
    'rmdh2m3h': {
      'en': '',
      'hi': '',
    },
    'tpfej8qr': {
      'en': '',
      'hi': '',
    },
    '1b26fhwe': {
      'en': '',
      'hi': '',
    },
    'j0ydgazo': {
      'en': '',
      'hi': '',
    },
    'qtg65uim': {
      'en': '',
      'hi': '',
    },
    'fwxb3e75': {
      'en': '',
      'hi': '',
    },
    'a9g11i9f': {
      'en': '',
      'hi': '',
    },
    '8edjuqor': {
      'en': '',
      'hi': '',
    },
    'sa9djs56': {
      'en': '',
      'hi': '',
    },
    'lz2tzm1j': {
      'en': '',
      'hi': '',
    },
    'ebwtd650': {
      'en': '',
      'hi': '',
    },
    '7v1r31oc': {
      'en': '',
      'hi': '',
    },
    'h101fygy': {
      'en': '',
      'hi': '',
    },
    '9c8ui754': {
      'en': '',
      'hi': '',
    },
    'pc9l7cqf': {
      'en': '',
      'hi': '',
    },
    'f7ze64z1': {
      'en': '',
      'hi': '',
    },
    'gcjn0oeb': {
      'en': '',
      'hi': '',
    },
    'osnjht0f': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
