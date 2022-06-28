How to Change Theme in Whole app???

Answer —-

Step 1 =>
First of all, set the Ui according to the App which you got Xd or Figma File from Sir.

Step 2 =>

	Create constant file.


bool mode = false;
RxBool modes = false.obs;
GetStorage themeDataBox = GetStorage();
const Color redColor = const Color(0xffff0404);
const Color pinkColor = const Color(0xfff604f2);
const Color blackColor = const Color(0xff000000);
const Color whiteColor = const Color(0xffffffff);
const Color kLightThemeBackGroundColor = const Color(0xffa0f69e);
const Color kDarkThemeBackGroungColor = const Color(0xff021d4e);
Color comboRedAndPink() {
return mode == false ? redColor : pinkColor;
}

Color comboBlackAndWhite() {
return mode == false ? blackColor : whiteColor;
}

Color comboScaffoldBackGround(){
return mode == false ? kLightThemeBackGroundColor : kDarkThemeBackGroungColor;
}

Color getXComboRedAndPink() {
// print('mode value==${modes.value}');
return modes.value == false ? redColor : pinkColor;
}

Color getXComboBlackAndWhite() {
return modes.value == false ? blackColor : whiteColor;
}

Color getXComboScaffoldBackGround(){
return modes.value == false ? kLightThemeBackGroundColor : kDarkThemeBackGroungColor;
}


Step 3 =>

Setup local storage  like :
create theme class in Data base services folder :

class SharedPreferenceThemeStorage {
static final light = ThemeData.light().copyWith(
backgroundColor: kLightThemeBackGroundColor,
);
static final dark =
ThemeData.dark().copyWith(backgroundColor: kDarkThemeBackGroungColor);

ThemeMode get theme =>
loadThemeFromBox() != null ? ThemeMode.dark : ThemeMode.light;

Future<bool> loadThemeFromBox() async {
SharedPreferences prefs = await SharedPreferences.getInstance();
mode = (prefs.getBool("isDark") == null ? false : prefs.getBool("isDark"))!;
return mode;
}

_saveThemeToBox(Future<bool> isDarkMode) async {
SharedPreferences prefs = await SharedPreferences.getInstance();
bool isCheck = await isDarkMode;
prefs.setBool('isDark', isCheck);
}

void switchTheme() {
Get.changeThemeMode(
loadThemeFromBox() != null ? ThemeMode.light : ThemeMode.dark);
_saveThemeToBox(loadThemeFromBox());
}
}

class SharedPrefService {
Future<void> setString(String responseString, String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setString(key, responseString);
}

Future<String> getString(String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
String? getValue = prefs.getString(key);
return getValue!;
}

Future<void> setBool(bool data, String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setBool(key, data);
}

Future<bool> getBool(String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
bool updated = prefs.getBool(key) ?? false;
return updated;
}

Future<void> setInt(int data, String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.setInt(key, data);
}

Future<int> getInt(String key) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
int? updated = prefs.getInt(key);
return updated!;
}

Future<void> remove(removeKey) async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.remove(removeKey);
}

Future<void> clear() async {
final SharedPreferences prefs = await SharedPreferences.getInstance();
prefs.clear();
}
}

When you Use Getx use below code:

class GetXThemeStorage {
static final light = ThemeData.light().copyWith(
backgroundColor: kLightThemeBackGroundColor,
);
static final dark =
ThemeData.dark().copyWith(backgroundColor: kDarkThemeBackGroungColor);

ThemeMode get theme =>
loadThemeFromBox() != null ? ThemeMode.dark : ThemeMode.light;

Future<bool> loadThemeFromBox() async {

if(themeDataBox.read("isDark") == null){
modes.value = false;
}else{
modes.value=themeDataBox.read("isDark");
}
print('get kr value ${themeDataBox.read("isDark")}');
print('get kr value ${modes.value}');
return modes.value;
}

_saveThemeToBox(Future<bool> isDarkMode) async {
bool isCheck = await isDarkMode;
themeDataBox.write('isDark', isCheck);
}

void switchTheme() {
Get.changeThemeMode(
loadThemeFromBox() != null ? ThemeMode.light : ThemeMode.dark);
_saveThemeToBox(loadThemeFromBox());
}
}

					OR
When you use Provider then below link is use full.

https://drive.google.com/drive/folders/161Bw7spqMAFAE0NmcgNU1z-6gM80WfSA?usp=sharing

(Note => if You use get storage in whole App development  then set up theme data in get_storage, if you don't use any local storage in app development then you can use shared preferences).




Step 4 =>
In main.dart file you check condition and set Theme Like :

if (mode == false) {
Themes().loadThemeFromBox();
}

When you use Getx then you write below code:
GetXThemeStorage().loadThemeFromBox();

Then set up in theme in Material App which you see in main.dart and in that file, in  MyAPP class You can set the Material app for the whole app in that you got one property of material App widget  like theme mode in this property you set theme mode like :

themeMode: mode == false ? ThemeMode.light : ThemeMode.dark,
In GetMaterial App set below code.
themeMode: modes.value == false ? ThemeMode.light : ThemeMode.dark,













Step 5 =>

	for change theme on tap of icon of button you can use changenotifire or  flutter_phoenix Plugin.

flutter_phoenix Plugin provides static method : rebirth().

if you use flutter_phoenix plugin then you need setup for that Like:

in main.dart file you put this  in void main() method :

runApp(Phoenix(child: MyApp()));

then you call static method of flutter_phoenix in on tap of button or icon :

When you use Sharedpreferences use below code.

IconButton(
onPressed: () async {
await SharedPrefService()
.getBool("isDark")
.then((value) async {
await SharedPrefService()
.setBool(
value == false ? true : false, 'isDark')
.whenComplete(() async {
value = !value;
mode = value;
print(
"Between ${await SharedPrefService().getBool("isDark")}");
Phoenix.rebirth(context);
});
Get.changeTheme(
value == false ? SharedPreferenceThemeStorage.light : SharedPreferenceThemeStorage.dark,
);
});
},
iconSize: 30,
color: comboRedAndPink(),
// tooltip: mode == false? 'Light Theme' : 'Dark Theme',
icon: mode == false
? Icon(
Icons.nightlight_round,
color: comboBlackAndWhite()
)
: Icon(
Icons.light_mode_rounded,
color: comboBlackAndWhite()
),
)

When you use Getx then use below code:

Note : => In Getx these two line are compulsory in code because Phoenix.rebirth(Get.context!); // Restarting app
Get.reset(); // resetting getx

Obx(() {
return IconButton(
onPressed: (){
print('Value mali gy ===${themeDataBox.read('isDark')}');
GetXThemeStorage().loadThemeFromBox().then((value){
themeDataBox
.write('isDark', value == false ? true : false);
modes.value = themeDataBox.read('isDark');
print("Between ${themeDataBox.read('isDark')}");
print("Between 22 ${modes.value}");


       Get.changeTheme(
         value == false
             ? GetXThemeStorage.light
             : GetXThemeStorage.dark,
       );
         Phoenix.rebirth(context);
         Get.reset();
     });
},
iconSize: 30,
color: getXComboRedAndPink(),
// tooltip: mode == false? 'Light Theme' : 'Dark Theme',
icon: modes.value == false
? Icon(
Icons.nightlight_round, color: getXComboBlackAndWhite())
: Icon(
Icons.light_mode_rounded, color: getXComboBlackAndWhite()),
);
})

