const int buttonPin = 2;       // Pin digital del pulsador
int lastButtonState = HIGH;    // Guarda el estado anterior del botón

void setup() {
  pinMode(buttonPin, INPUT_PULLUP); // Activa la resistencia interna (mantiene el pin en 5V)
  Serial.begin(9600);               // Inicia el puerto serie a 9600 baudios
}

void loop() {
  int buttonState = digitalRead(buttonPin); // Lee el estado del pulsador

  // Si el botón pasa de NO presionado (HIGH) a PRESIONADO (LOW)
  if (buttonState == LOW && lastButtonState == HIGH) {
    Serial.print('1');   // Envía el carácter '1' por puerto serie (sin salto de línea)
    delay(250);          // Pausa de 250 milisegundos para evitar dobles pulsaciones (rebotes)
  }
  lastButtonState = buttonState; // Guarda el estado para la próxima lectura
}
