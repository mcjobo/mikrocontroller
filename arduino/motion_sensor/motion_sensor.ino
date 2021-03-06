#define LED_PIN 2
#define PWM_PIN 6

#define STEPS 50

#define BASE_TOPIC "/kueche-kuehl/"
#define ON_OFF_TOPIC BASE_TOPIC "on"
#define DUTY_TOPIC BASE_TOPIC "duty"
#define LEVEL_TOPIC BASE_TOPIC "level"
#define TIMEOUT_TOPIC BASE_TOPIC "time"
#define FADE_TOPIC BASE_TOPIC "fade"

boolean logging = false;
unsigned long oldMillis = 0;
int duty = 75;
int timeout = 5000;
int origTimeout = timeout;
int fade = 300;

unsigned long oldInterruptMillis = 0;

String inputString = "";
boolean stringComplete = false;


const uint16_t pwm_transl[256] = {
  0,   1,   1,   1,   2,   2,   2,   2,   3,   3,   3,   4,   4,   4,   4,   5,   5,   5,   5,   6,   6,   6,   7,   7,   7,
  7,   8,   8,   8,   9,   9,   9,   9,   10,  10,  10,  11,  11,  11,  11,  12,  12,  12,  13,  13,  13,  14,  14,  14,  14,
  15,  15,  15,  16,  16,  16,  17,  17,  17,  18,  18,  18,  19,  19,  19,  20,  20,  20,  21,  21,  21,  22,  22,  22,  23,
  23,  23,  24,  24,  24,  25,  25,  25,  26,  26,  27,  27,  27,  28,  28,  28,  29,  29,  30,  30,  30,  31,  31,  32,  32,
  32,  33,  33,  34,  34,  34,  35,  35,  36,  36,  37,  37,  38,  38,  38,  39,  39,  40,  40,  41,  41,  42,  42,  43,  43,
  44,  44,  45,  46,  46,  47,  47,  48,  48,  49,  49,  50,  51,  51,  52,  52,  53,  54,  54,  55,  56,  56,  57,  58,  58,
  59,  60,  60,  61,  62,  63,  63,  64,  65,  66,  67,  67,  68,  69,  70,  71,  72,  73,  73,  74,  75,  76,  77,  78,  79,
  80,  81,  82,  83,  84,  85,  87,  88,  89,  90,  91,  92,  94,  95,  96,  97,  99,  100, 101, 103, 104, 105, 107, 108, 110,
  111, 113, 114, 116, 118, 119, 121, 123, 124, 126, 128, 130, 132, 134, 135, 137, 139, 141, 144, 146, 148, 150, 152, 155, 157,
  159, 162, 164, 167, 169, 172, 174, 177, 180, 183, 185, 188, 191, 194, 197, 200, 204, 207, 210, 214, 217, 221, 224, 228, 231,
  235, 239, 243, 247, 251, 255
};

int oldDutyCycle = 0;

int runLevel = 0;
int currentLevelSet = 0;
unsigned long timeStep = 0;
int numSteps = 0;
unsigned long oldStep = 0;

void setPWM(int dutyCycle) {
  if (dutyCycle != oldDutyCycle) {
    int run = dutyCycle * 255 / 100;

    timeStep = fade;
    timeStep = timeStep * 1000;
    timeStep = timeStep / 256;
    oldStep = micros();
    numSteps = run - currentLevelSet;

    sendLogMessage("" + fade, "" + timeStep, "" + oldStep, "" + numSteps);

    sendCurrentLevel(dutyCycle);
    oldDutyCycle = dutyCycle;
  }
}
void sendLogMessage(String message) {
  if (logging) {
    String sub = "s;";
    sub += "sleep/log";
    sub += ";";
    sub += message;
    sub += ";";
    Serial.println(sub);
  }
}
void sendCurrentLevel(int duty) {
  String sub = "s;";
  sub += LEVEL_TOPIC;
  sub += ";";
  sub += duty;
  sub += ";";
  Serial.println(sub);
}
void sendLogMessage(String arg1, String arg2) {
  if (logging) {
    String s = arg1;
    s += arg2;
    sendLogMessage(s);
  }
}
void sendLogMessage(String arg1, String arg2, String arg3) {
  if (logging) {
    String s = arg1;
    s += arg2;
    s += arg3;
    sendLogMessage(s);
  }
}
void sendLogMessage(String arg1, String arg2, String arg3, String arg4) {
  if (logging) {
    String s = arg1;
    s += arg2;
    s += arg3;
    s += arg4;
    sendLogMessage(s);
  }
}
void fadeLED() {
  if (numSteps != 0 && oldStep + timeStep <= micros()) {
    oldStep = micros();
    int run = 0;
    if (numSteps > 0) {
      run = pwm_transl[++currentLevelSet];
      --numSteps;
    }
    if (numSteps < 0) {
      run = pwm_transl[--currentLevelSet];
      ++numSteps;
    }
    analogWrite(PWM_PIN, run);
  }
}

void initLed() {
  digitalWrite(LED_PIN, LOW);
  delay(300);
  digitalWrite(LED_PIN, HIGH);
  delay(300);
  digitalWrite(LED_PIN, LOW);
  delay(300);
  digitalWrite(LED_PIN, HIGH);
  delay(300);
  digitalWrite(LED_PIN, LOW);
}

void subscribeMQTT() {
  String sub = "c;";
  sub += ON_OFF_TOPIC;
  sub += ";";
  Serial.println(sub);
  delay(50);
  sub = "c;";
  sub += TIMEOUT_TOPIC;
  sub += ";";
  Serial.println(sub);
  delay(50);
  sub = "c;";
  sub += DUTY_TOPIC;
  sub += ";";
  Serial.println(sub);
  delay(50);
  sub = "c;";
  sub += FADE_TOPIC;
  sub += ";";
  Serial.println(sub);
  delay(50);
}

void waitESP8266() {
  String ready = "ready";
  while (!inputString.startsWith(ready)) {
    stringComplete = false;
    inputString = "";
    while (!stringComplete) {
      readInput();
    }
  }
  stringComplete = false;
  inputString = "";
}

void readInput() {
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

void interruptTrigger() {
  if (oldInterruptMillis + 500 < millis() && timeout > 0) {
    oldMillis = millis();
    sendLogMessage("interruptTrigger");
    if (oldDutyCycle != duty) {
      setPWM(duty);
    }
    oldInterruptMillis = millis();
  }
}

void setup() {

  Serial.begin(57600);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }
  delay(300);

  pinMode(LED_PIN, OUTPUT);
  pinMode(PWM_PIN, OUTPUT);

  digitalWrite(LED_PIN, HIGH);
  waitESP8266();

  analogWrite(LED_PIN, 0);
  initLed();

  subscribeMQTT();

  pinMode(2, INPUT_PULLUP);
  pinMode(3, INPUT_PULLUP);
  attachInterrupt(digitalPinToInterrupt(2), interruptTrigger, CHANGE);
  attachInterrupt(digitalPinToInterrupt(3), interruptTrigger, CHANGE);

}

void processInput() {
  if (stringComplete) {

    if (inputString.startsWith("r;")) {
      int oldPosition = 0;
      int position = inputString.indexOf(";", 0);
      if (position == 1) {
        oldPosition = position + 1;
        position = inputString.indexOf(";", oldPosition);
        String topic = inputString.substring(oldPosition, position);

        oldPosition = position + 1;
        position = inputString.indexOf(";", oldPosition);
        String payload = inputString.substring(oldPosition, position);

        if (topic == ON_OFF_TOPIC) {
          if (payload == "1") {
            timeout = -1;
            sendLogMessage("On Off = 1");
            setPWM(duty);
            //oldMillis = millis();
          } if (payload == "2") {
            timeout = origTimeout;
            sendLogMessage("On Off = 2");
            setPWM(0);
            //oldMillis = millis();
          } if (payload == "0") {
            timeout = -2;
            String l = "On Off = 0 ";
            l += timeout;
            sendLogMessage(l);
            setPWM(0);
            //oldMillis = 0;
          }
        } else if (topic == DUTY_TOPIC) {
          duty = payload.toInt();
          sendLogMessage("duty topic");
          setPWM(duty);
        } else if (topic == TIMEOUT_TOPIC) {
          timeout = payload.toInt();
          origTimeout = timeout;
        } else if (topic == FADE_TOPIC) {
          fade = payload.toInt();
          String s = "fade topi = ";
          s += fade;
          sendLogMessage(s);
        }
      }
    }
    stringComplete = false;
    inputString = "";
  }

}

void checkTimeout() {
  if (timeout > 0) {
    if (oldMillis + timeout <= millis()) {
      if (oldDutyCycle != 0) {
        setPWM(0);
      }
    }
  }
}

void loop() {

  readInput();
  processInput();
  checkTimeout();
  fadeLED();
}
