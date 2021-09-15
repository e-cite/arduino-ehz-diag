#include <SoftwareSerial.h>

//#define DEBUG

// Max. size of SML message that can be read
#define MSG_BUF_SIZE 512
// Timeout for reading serial data
#define SERIAL_READ_TIMEOUT_MS 100

// ########## GLOBALS ##########
SoftwareSerial EHZ1(6, 5); // RX, TX

#ifdef DEBUG
#include "demo.h"
#endif
unsigned char msg_buf[MSG_BUF_SIZE] = {0x00};
unsigned int msg_buf_used = 0; // How many bytes in msg_buf are used


// ########## FUNCTIONS ##########


// Print a byte array to serial console
void print_array(unsigned char array[], unsigned int len){
  unsigned char nibble1, nibble2;
  char buffer1, buffer2;
  for (unsigned int i = 0; i < len; i++) {
    nibble1 = (array[i] >> 4) & 0x0F;
    nibble2 = (array[i] >> 0) & 0x0F;
    buffer1 = nibble1  < 0xA ? '0' + nibble1  : 'A' + nibble1  - 0xA;
    buffer2 = nibble2  < 0xA ? '0' + nibble2  : 'A' + nibble2  - 0xA;
    Serial.print(buffer1);
    Serial.print(buffer2);
  }
  Serial.println();
}


// Clears an array by setting every value to 0x00
void clear_buffer(unsigned char array[], unsigned int len){
  for (unsigned int i = 0; i < len; i++)
    array[i] = 0x00;
}


// Changes endianness of a len-byte array
void byteswap(unsigned char array[], unsigned int len){
  unsigned char orig[len];
  // Save the original contents
  for (unsigned int i = 0; i < len; i++)
    orig[i] = array[i];

  // Swap bytes
  for (unsigned int i = 0; i < len; i++)
    array[i] = orig[len - i - 1];

  return;
}


// Find byte-array a2 in byte-array a1.
// len1: length of a1,
// len2: length of a2
// Returns pointer to first matching char when found
// Returns NULL when not found
unsigned char* find_sequence(unsigned char* a1, unsigned int len1, unsigned char* a2, unsigned int len2) {
  int i = 0;
  int k = 0;
  while(i+k < len1 && k < len2){
    if (a1[i+k] == a2[k]) {
      k++;
    } else {
      i++;
      k=0;
    }
  }
  if (k == len2) {
    return a1 + i*sizeof(char);
  }
  return NULL;
}


// Checks validity of an SML message by searching its start and stop sequences
bool sml_is_message_valid(unsigned char message[], unsigned int len){
  unsigned char sml_startseq[] = {
    0x1b, 0x1b, 0x1b, 0x1b, 0x01, 0x01, 0x01, 0x01
  }; // SML start sequence
  unsigned char sml_stopseq[] = {
    0x1b, 0x1b, 0x1b, 0x1b, 0x1a
  }; // SML stop sequence

  // Check the length
  if (len < sizeof(sml_startseq) || len < sizeof(sml_stopseq)){
    return false;
  }

  // Search sml_startseq
  // Performance optimization: Searching in the first 'sizeof(sml_startseq)'-bytes of the message is enough
  if ( find_sequence(message, sizeof(sml_startseq), sml_startseq, sizeof(sml_startseq)) == NULL )
    return false;

  // Search sml_stopseq
  if ( find_sequence(message, len, sml_stopseq, sizeof(sml_stopseq)) == NULL )
    return false;

  return true;
}


// Extracts the meter id value from a valid sml message
unsigned char* sml_get_id(unsigned char message[], unsigned int len){
  unsigned char sml_idseq[] = {
    0x07, 0x01, 0x00, 0x00, 0x00, 0x09, 0xFF, 0x01,
    0x01, 0x01, 0x01, 0x0B
  }; // SML id sequence (Geräteidentifikation)
  const unsigned int sml_idval_size = 10; // Size of value containing id in SML message
  union {
    unsigned char raw[sml_idval_size];
    struct{
      char a;
      char b;
      char c[3];
      char d[5];
    };
  } id;
  union {
    unsigned char raw[sizeof(unsigned long long)] = {0};
    unsigned long long val;
  } tmp;
  unsigned char* pch;
  static unsigned char pid[sml_idval_size+sizeof(id.d)+1] = {0};

  // Search sml_idseq in message
  pch = find_sequence(message, len, sml_idseq, sizeof(sml_idseq));
  if (pch != NULL) {
    // Move pointer pch to raw id value
    pch = pch + sizeof(sml_idseq);

    // Extract id by copying its values to array 'id'
    for (unsigned int i = 0; i < sml_idval_size; i++){
      id.raw[i] = pch[i];
    }

    // Build correct array (shift id.d 3 bytes to the right)
    for (unsigned int i = 0; i < sizeof(id.d); i++) {
      tmp.raw[i+3] = id.d[i];
    }

    // Swap endianness
    byteswap(tmp.raw,sizeof(tmp.raw));

    // Build resulting string, since there are very different data types
    sprintf(pid, "%X%X%s%010lu\0", id.a, id.b, id.c, (unsigned long long) tmp.val);

    Serial.print("Meter ID: ");
    Serial.write(pid,sizeof(pid));
    Serial.println("");
    return pid;
  } else {
    Serial.println("Could not get id value. SML id sequence not found.");
  }
  return 0;
}


// Extracts the decimal power value from a valid sml message
unsigned long sml_get_power(unsigned char message[], unsigned int len){
  unsigned char sml_powerseq[] = {
    0x07, 0x01, 0x00, 0x10, 0x07, 0x00, 0xFF, 0x01,
    0x01, 0x62, 0x1B, 0x52, 0x00, 0x55
  }; // SML power sequence (Wirkleistung)
  const unsigned int sml_powerval_size = 4; // Size of value containing power in SML message (4 bytes = long)
  union {
    unsigned char raw[sml_powerval_size];
    unsigned long val;
  } power;
  unsigned char* pch;

  // Search sml_powerseq in message
  pch = find_sequence(message, len, sml_powerseq, sizeof(sml_powerseq));
  if (pch != NULL) {
    // Move pointer pch to raw power value
    pch = pch + sizeof(sml_powerseq);

    // Extract power by copying its values to union 'power'
    for (unsigned int i = 0; i < sml_powerval_size; i++){
      power.raw[i] = pch[i];
    }

    byteswap(power.raw, sizeof(power.raw)); // Swap endianness
    Serial.print("Current power (W): ");
    Serial.println(power.val);
    return power.val;
  } else {
    Serial.println("Could not get power value. SML power sequence not found.");
  }
  return 0;
}


// Extracts the actual meter reading (Zählerstand) value from a valid sml message
double sml_get_energy(unsigned char message[], unsigned int len){
  unsigned char sml_energyseq[] = {
    0x07, 0x01, 0x00, 0x01, 0x08, 0x00, 0xFF, 0x65,
    0x00, 0x01, 0x01, 0x82, 0x01, 0x62, 0x1E, 0x52,
    0xFF, 0x59
  }; // SML energy sequence (Zählerstand)
  const unsigned int sml_energyval_size = 8; // Size of value containing energy in SML message (8 bytes = long long)
  union {
    unsigned char raw[sml_energyval_size];
    unsigned long long val;
  } energy;
  unsigned char* pch;
  double energy_val_calc;

  // Search sml_energyseq in message
  pch = find_sequence(message, len, sml_energyseq, sizeof(sml_energyseq));
  if (pch != NULL) {
    // Move pointer pch to raw energy value
    pch = pch + sizeof(sml_energyseq);

    // Extract energy by copying its values to union 'energy'
    for (unsigned int i = 0; i < sml_energyval_size; i++){
      energy.raw[i] = pch[i];
    }

    byteswap(energy.raw, sizeof(energy.raw)); // Swap endianness

    // Calculate current energy value
    energy_val_calc = energy.val * 10e-5;

    Serial.print("Current energy / meter reading (kWh): ");
    Serial.println(energy_val_calc);
    return energy_val_calc;
  } else {
    Serial.println("Could not get energy value. SML energy sequence not found.");
  }
  return 0;
}


// ########## MAIN ##########


void setup() {
  // Open serial communications and wait for port to open:
  Serial.begin(57600);
  EHZ1.begin(9600); // EHZ EDL-21 uses 9600 baud
  while (!Serial) {
    ; // wait for serial port to connect. Needed for Native USB only
  }
  delay(1000);

  Serial.println("Program started.");
}


void loop() {
  unsigned long millis_last_reading = 0;
  unsigned long cur_power = 0;
  double cur_energy = 0;
  char cur_id[16] = {0};

  clear_buffer(msg_buf,sizeof(msg_buf));
  msg_buf_used = 0;
  EHZ1.overflow();
  EHZ1.listen();

#ifdef DEBUG
  for (unsigned int i = 0; i < sizeof(msg_buf_debugtemplate); i++){
    msg_buf[i] = msg_buf_debugtemplate[i];
    msg_buf_used++;
  }
#else
  // Wait until data is available
  while(!EHZ1.available());

  // Read, as long as data is available or until buffer is full
  millis_last_reading = millis();
  while (millis() - millis_last_reading < SERIAL_READ_TIMEOUT_MS) {
    if (EHZ1.available()) {
      if (msg_buf_used >= sizeof(msg_buf)){
        Serial.println("Size of msg_buf exceeded. Stopped reading.");
        break;
      }
      msg_buf[msg_buf_used] = EHZ1.read();
      msg_buf_used++;
      millis_last_reading = millis();
    }
  }

  // Print read data to serial console
  if (msg_buf_used > 0) {
    Serial.print("Reading finished. Message buffer is now filled with bytes: ");
    Serial.println(msg_buf_used);
    print_array(msg_buf, sizeof(msg_buf));
  }
#endif

  // Check validity of received message and extract payloads
  if ( sml_is_message_valid(msg_buf, msg_buf_used) ){
    cur_power = sml_get_power(msg_buf, sizeof(msg_buf));
    cur_energy = sml_get_energy(msg_buf, sizeof(msg_buf));
    unsigned char* pid = sml_get_id(msg_buf, sizeof(msg_buf));
    if (pid != NULL)
      for (unsigned int i = 0; i < sizeof(cur_id); i++)
        cur_id[i] = pid[i];
  } else {
    Serial.println("Could not get values. SML message not valid.");
  }

  // TODO: Upload it
# ifdef DEBUG
  delay(60000);
#endif
}
