import processing.video.*;

Movie movie;
Punto arrayDiPunti[];

color targetColor = color(255, 0, 0);

void setup() {
  size(1920, 1080);
  
  movie = new Movie(this, "./test_croce.mp4"); // filmato  
  movie.play();
  
  arrayDiPunti = new Punto[1];
  
  //noLoop();
}

void draw() {
  image(movie, 0, 0);
  loadPixels();
  
  // scan the entire frame until red dot is found
  for (int i = 0; i < width; i++) {
    for (int j = 0; j < height; j++) {
      int p = j*width + i;
      if (pixels[p] == targetColor) {
        store(i, j);
        //println("Trovato: " + i + ", " + j);
        return;
      }
    }
  }
  
  // trovare il modo di chiamare writePuntiToFile
  // una volta terminato il filmato
  if (!movie.available()) {
    writePuntiToFile("posizioni.dat");
    noLoop();
    println(" FINITO !");
  }
}

void writePuntiToFile(String filename) {
  // TODO
  println("writePuntiToFile");
}

void store(int i, int j) {
  Punto p = new Punto(i, j);
  append(arrayDiPunti, p);
}

void movieEvent(Movie m) {
  m.read();
}
