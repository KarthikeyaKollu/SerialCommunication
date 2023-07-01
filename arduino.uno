#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27,16,2);  // set the LCD address to 0x3F for a 16 chars and 2 line display
String data1,data2,data;
void setup() {
 Serial.begin(115200);
 Serial.setTimeout(1);
  lcd.init();
  lcd.clear();         
  lcd.backlight();      // Make sure backlight is on
  
  // Print a message on both lines of the LCD.

}

void loop() {
 while (!Serial.available());
 
 data = Serial.readString();
  int colonIndex = data.indexOf(':'); 
  if (colonIndex != -1) {
    data1 = data.substring(0, colonIndex);   
    data2 = data.substring(colonIndex + 1);
  }
  lcd.setCursor(2, 0);
  lcd.print(data2);
  int textLength = data.length();
  int maxLength = 16; 
 if (textLength <= maxLength) {
    lcd.clear();
    lcd.print(data);
  
    } else {
    lcd.clear();
  
    for (int i = 0; i <= textLength - maxLength; i++) {
      lcd.setCursor(0, 0);
      lcd.print(data.substring(i, i + maxLength));
      delay(350); // Adjust the scrolling speed as desired
    
  }


  }
 

}
