import processing.serial.*;  // Librería oficial para puerto serie
import processing.sound.*;   // Librería oficial para reproducir sonidos

Serial myPort;      // Objeto para controlar el puerto serie
SoundFile audio;    // Objeto para cargar el archivo de audio
String portName = "COM3"; // ¡Reemplaza por el puerto de tu Arduino!

void setup() {
  size(300, 300);
  background(40);
  
  // Imprime en consola todos los puertos COM disponibles para verificación
  printArray(Serial.list());
  
  // Conecta Processing con el Arduino
  myPort = new Serial(this, portName, 9600);
  
  // Carga tu archivo de música (debe estar dentro de la carpeta llamada 'data')
  audio = new SoundFile(this, "0001.mp3");
}

void draw() {
  // Se requiere esta función ejecutándose de fondo para escuchar el puerto
}

// Esta función se ejecuta automáticamente cuando llega un dato del Arduino
void serialEvent(Serial myPort) {
  int inByte = myPort.read(); // Lee el dato entrante
  
  // Muestra en la consola de Processing el carácter que llegó
  print("Dato recibido de Arduino: " + (char)inByte + "\n");
  
  // Si el dato es un '1'
  if (inByte == '1') {
    println("¡Botón presionado! Disparando audio...");
    
    // Si el sonido ya está sonando, lo detiene primero para reiniciarlo
    if (audio.isPlaying()) {
      audio.stop();
    }
    audio.play(); // Reproduce el sonido hacia el parlante Bluetooth predeterminado de la PC
  }
}
