const int button1Pin = 2;      // Pulsador 1 en Pin 2 (Seguro)
const int button2Pin = 4;      // Pulsador 2 en Pin 4 (Seguro)

int lastButton1State = HIGH;   // Estado anterior del botón 1
int lastButton2State = HIGH;   // Estado anterior del botón 2

void setup() {
  pinMode(button1Pin, INPUT_PULLUP); // Resistencia pull-up para botón 1
  pinMode(button2Pin, INPUT_PULLUP); // Resistencia pull-up para botón 2
  Serial.begin(9600);                // Puerto serie a 9600
}

void loop() {
  int button1State = digitalRead(button1Pin); // Lee el botón 1 (Pin 2)
  int button2State = digitalRead(button2Pin); // Lee el botón 2 (Pin 4)

  // Detección del Botón 1 (Envía '1')
  if (button1State == LOW && lastButton1State == HIGH) {
    Serial.print('1');   // Envía '1' por puerto serie
    delay(250);          // Anti-rebote (Debounce)
  }
  lastButton1State = button1State;

  // Detección del Botón 2 (Envía '2')
  if (button2State == LOW && lastButton2State == HIGH) {
    Serial.print('2');   // Envía '2' por puerto serie
    delay(250);          // Anti-rebote (Debounce)
  }
  lastButton2State = button2State;
}