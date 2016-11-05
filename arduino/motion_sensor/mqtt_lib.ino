#include <ESP8266WiFi.h>
#include <PubSubClient.h>

#define wifi_ssid "bolay family"
#define wifi_password "74741606441889230741"

#define mqtt_server "openhab-r0"
#define mqtt_user "mcjobo"
#define mqtt_password "mcjobo"


WiFiClient espClient;
PubSubClient client(espClient);

String inputString = "";         // a string to hold incoming data
boolean stringComplete = false;  // whether the string is complete

int numberSubscription = 0;
const char* subscription[6];

void callback(char* topic, byte* payload, unsigned int length) {

  payload[length]='\0';
  String payloadStr = String((char *)payload);
  Serial.print("r;");
  Serial.print(topic);
  Serial.print(";");
  Serial.print(payloadStr);
  Serial.println(";");
  
}

void setup() {
  Serial.begin(57600);
  setup_wifi();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  Serial.println("ready");
}

void setup_wifi() {
  delay(10);
  // We start by connecting to a WiFi network
  Serial.println();
  Serial.print("Connecting to ");
  Serial.println(wifi_ssid);

  WiFi.begin(wifi_ssid, wifi_password);

  while (WiFi.status() != WL_CONNECTED) {
    delay(500);
    Serial.print(".");
  }

  Serial.println("");
  Serial.println("WiFi connected");
  Serial.println("IP address: ");
  Serial.println(WiFi.localIP());
}

void reconnect() {
  // Loop until we're reconnected
  while (!client.connected()) {
    // Attempt to connect
    // If you do not want to use a username and password, change next line to
    if (client.connect("ESP8266Client", mqtt_user, mqtt_password)) {
      for(int i = 0; i<numberSubscription; ++i){
        client.subscribe(subscription[i]);
      }
    } else {
      Serial.print("e;");
      Serial.println(client.state());
      // Wait 5 seconds before retrying
      delay(50);
    }
  }
}

void loop() {
  if (!client.connected()) {
    reconnect();
  }
  client.loop();

  if (stringComplete) {
    sendData(inputString);
    // clear the string:
    inputString = "";
    stringComplete = false;
  }

  serialEvent();
}

void sendData(String data){
  if(data.startsWith("s;")){
    int oldPosition = 0;
    int position = data.indexOf(";", 0);
    if(position == 1){
      oldPosition = position+1;
      position = data.indexOf(";", oldPosition);
      String topic = data.substring(oldPosition, position);
      
      oldPosition = position+1;
      position = data.indexOf(";", oldPosition);
      String payload = data.substring(oldPosition, position);

      /*Serial.print("topic: ");
      Serial.print(topic);
      Serial.print(" payload: ");
      Serial.println(payload);*/

      client.publish(topic.c_str(), payload.c_str(), true);
    }
  }
  if(data.startsWith("c;")){
    int oldPosition = 0;
    int position = data.indexOf(";", 0);
    if(position == 1){
      oldPosition = position+1;
      position = data.indexOf(";", oldPosition);
      String topic = data.substring(oldPosition, position);

      if(numberSubscription < 6){
        subscription[numberSubscription] = topic.c_str();
        ++numberSubscription;
        client.subscribe(topic.c_str());
      }
    }
  }
}

void serialEvent() {
  while (Serial.available()) {
    // get the new byte:
    char inChar = (char)Serial.read();
      if (inChar != '\n') {
      // if the incoming character is a newline, set a flag
      // so the main loop can do something about it:
      if (inChar == '\r') {
        stringComplete = true;
      } else {
        // add it to the inputString:
        inputString += inChar;
      }
    }
  }
}
