#include <Keyboard.h>

int red_light_pin= 9;
int green_light_pin = 5;
int blue_light_pin = 6;

int Laststate; 
int state;
int counter = 0;

#define CLK 10
#define DT 16
#define SW 21

#define encoder0PinA 16
#define encoder0PinB 10
#define encoder0Btn 21
int encoder0Pos = 0;
int mypos = 0;

unsigned long previousMillis = 0;
const long interval = 10; 

void setup() {
  Serial.begin(9600);
  pinMode(CLK,INPUT_PULLUP);
  pinMode(DT,INPUT_PULLUP);
  pinMode(SW,INPUT_PULLUP);;
  Laststate = digitalRead(CLK);
  
  pinMode(red_light_pin, OUTPUT);
  pinMode(green_light_pin, OUTPUT);
  pinMode(blue_light_pin, OUTPUT);
}
int color = 0;


void loop() {
  state = digitalRead(CLK);
  if(state != Laststate)
  {
    if(digitalRead(DT) != state)
    {
      counter++;
      }
      else
      {
        counter--;
        }
  
         Serial.println(counter);
  }
  if (counter == 2)
  {
    //Keyboard.write(0xF0);
    Keyboard.write(0xF9);
    counter=0;
  }
  if (counter == -2)
  {
    //Keyboard.write(0xF1);
    Keyboard.write(0xFA);
    counter=0;
  }
  if(digitalRead(SW) != 1)
  {
    counter=0;
    //Keyboard.write(0xF2);
    Keyboard.write(0xFB);
    delay(200);
    }
    
    Laststate= state;
  //delay(25);

  unsigned long currentMillis = millis();
  if (currentMillis - previousMillis >= interval) 
  {
  previousMillis = currentMillis;
  if(color <255)
  {
  RGB_color(255-color, color, 0); // Green
  }
  else if(color <510)
  {
  RGB_color(0, 510-color, color-255); // Green
  }
  else if(color <765)
  {
  RGB_color(color-510, 0, 765-color); // Red
  }
    else
  {
    color=0;
  }
  
  color+=1;
  }
}
  

void RGB_color(int red_light_value, int green_light_value, int blue_light_value)
 {
  analogWrite(red_light_pin, red_light_value);
  analogWrite(green_light_pin, green_light_value);
  analogWrite(blue_light_pin, blue_light_value);
}
