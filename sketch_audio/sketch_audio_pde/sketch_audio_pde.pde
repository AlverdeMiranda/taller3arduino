import processing.serial.*;  // Librería para comunicación serie
import processing.sound.*;   // Librería para reproducir audios

Serial myPort;      
SoundFile audio1;    // Objeto para el primer audio (0001.mp3)
SoundFile audio2;    // Objeto para el segundo audio (0002.mp3)
String portName = "COM4"; // Puerto COM de tu Arduino

void setup() {
  size(300, 300);
  background(40);
  
  // Conexión serie con el Arduino
  myPort = new Serial(this, portName, 9600);
  
  // Carga de los dos archivos de audio
  audio1 = new SoundFile(this, "0001.mp3");
  audio2 = new SoundFile(this, "0002.mp3");
}

void draw() {
}

void serialEvent(Serial myPort) {
  int inByte = myPort.read(); // Lee el dato del puerto serie
  
  print("Dato recibido de Arduino: " + (char)inByte + "\n");
  
  // Lógica si se presiona el Botón 1 (Carácter '1')
  if (inByte == '1') {
    println("¡Pulsador 1 presionado! Reproduciendo Audio 1...");
    
    // Detiene el audio 2 si estaba sonando para que no se superpongan
    if (audio2.isPlaying()) {
      audio2.stop();
    }
    // Si el audio 1 ya estaba sonando, lo detiene para reiniciarlo
    if (audio1.isPlaying()) {
      audio1.stop();
    }
    audio1.play(); // Reproduce el primer audio
  } 
  
  // Lógica si se presiona el Botón 2 (Carácter '2')
  else if (inByte == '2') {
    println("¡Pulsador 2 presionado! Reproduciendo Audio 2...");
    
    // Detiene el audio 1 si estaba sonando para que no se superpongan
    if (audio1.isPlaying()) {
      audio1.stop();
    }
    // Si el audio 2 ya estaba sonando, lo detiene para reiniciarlo
    if (audio2.isPlaying()) {
      audio2.stop();
    }
    audio2.play(); // Reproduce el segundo audio
  }
}
