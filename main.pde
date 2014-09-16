/*
  QuickShift : Open Source Motorcycle Quick Shifter
  for sport motorcycling

  Developped by Julien Levasseur

  Begin on September 15th 2014

  Visit :  https://github.com/julienlevasseur/QuickShift
*/

/* Imports */

/* Variables */
gear_switch_pin = 2;
ign_shut_pin = 1;

int gsp_state;  // gear switch pin state
int gsp_prev_state = LOW;
int ign_shut_pin_state = HIGH;

long time = 0;
long debounce = 200;

/* Setup */
void setup() {
    /* Setup the pin modes */
    pinMode(gear_switch_pin, INPUT);
    pinMode(ign_shut_pin, OUTPUT);
}

/* Main */
void loop() {
    /* Main loop */
    gear_switch_pin_state = digitalRead(gear_switch_pin);
    // if gearswitch is operated and his state was unoperated and the debounce time is passed :
    if (gsp_state == HIGH && gsp_prev_state == LOW && millis() - time > debounce) {
        if (ign_shut_pin_state == HIGH)
            ign_shut_pin_state = LOW;
        else
            ign_shut_pin_state = HIGH;

        time = millis()
    }
    digitalWrite(ign_shut_pin, ign_shut_pin_state);
    gsp_prev_state = gsp_state;
}
