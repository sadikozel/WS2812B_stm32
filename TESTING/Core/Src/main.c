/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2022 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "dma.h"
#include "spi.h"
#include "usart.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "stm32f0xx_hal.h"
#include "math.h"
#include "string.h"
#include "stdio.h"
#include "stdlib.h"
#define LED_NO    105 // farkli modlari eklemek icin led_no fazla sayildi
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */
uint8_t r;
uint16_t i, n, m, k, j;

float gamma = 0.14; // tepe noktayi belirler (daha az veya fazla koyuluk)
float beta = 0.5; // gaussiani simetrik yapar
float br, bg, bb;

#define LED_BUFFER_LENGTH (LED_NO*12) //bunun sebebi her bir led icin 4*3 bytelik yer tutulacak olmasidir.

const uint8_t leddata[256*4] = { // size = 256 * 4 ------------ '0' = 0100 // '1' = 0111
0X44 , 0X44 , 0X44 , 0X44 , // 0 degeri
0X44 , 0X44 , 0X44 , 0X47 , // 1 degeri
0X44 , 0X44 , 0X44 , 0X74 , // .
0X44 , 0X44 , 0X44 , 0X77 , // ..
0X44 , 0X44 , 0X47 , 0X44 , // ...
0X44 , 0X44 , 0X47 , 0X47 , //0x44 = 0b01000100
0X44 , 0X44 , 0X47 , 0X74 , //0x47 = 0b01000111
0X44 , 0X44 , 0X47 , 0X77 , //0x74 = 0b01110100
0X44 , 0X44 , 0X74 , 0X44 , //0x77 = 0b01110111
0X44 , 0X44 , 0X74 , 0X47 , 
0X44 , 0X44 , 0X74 , 0X74 , // örnegin bu satirda 0100 0100 , 0100 0100 , 0111 0100 , 0111 0100 olacak sekilde bir çikti verecektir buradan 00001010 elde edilir ve 10 degerine ulasilir
0X44 , 0X44 , 0X74 , 0X77 , 
0X44 , 0X44 , 0X77 , 0X44 , 
0X44 , 0X44 , 0X77 , 0X47 , 
0X44 , 0X44 , 0X77 , 0X74 , 
0X44 , 0X44 , 0X77 , 0X77 , 
0X44 , 0X47 , 0X44 , 0X44 , 
0X44 , 0X47 , 0X44 , 0X47 , 
0X44 , 0X47 , 0X44 , 0X74 , 
0X44 , 0X47 , 0X44 , 0X77 , 
0X44 , 0X47 , 0X47 , 0X44 , 
0X44 , 0X47 , 0X47 , 0X47 , 
0X44 , 0X47 , 0X47 , 0X74 , 
0X44 , 0X47 , 0X47 , 0X77 , 
0X44 , 0X47 , 0X74 , 0X44 , 
0X44 , 0X47 , 0X74 , 0X47 , 
0X44 , 0X47 , 0X74 , 0X74 , 
0X44 , 0X47 , 0X74 , 0X77 , 
0X44 , 0X47 , 0X77 , 0X44 , 
0X44 , 0X47 , 0X77 , 0X47 , 
0X44 , 0X47 , 0X77 , 0X74 , 
0X44 , 0X47 , 0X77 , 0X77 , 
0X44 , 0X74 , 0X44 , 0X44 , 
0X44 , 0X74 , 0X44 , 0X47 , 
0X44 , 0X74 , 0X44 , 0X74 , 
0X44 , 0X74 , 0X44 , 0X77 , 
0X44 , 0X74 , 0X47 , 0X44 , 
0X44 , 0X74 , 0X47 , 0X47 , 
0X44 , 0X74 , 0X47 , 0X74 , 
0X44 , 0X74 , 0X47 , 0X77 , 
0X44 , 0X74 , 0X74 , 0X44 , 
0X44 , 0X74 , 0X74 , 0X47 , 
0X44 , 0X74 , 0X74 , 0X74 , 
0X44 , 0X74 , 0X74 , 0X77 , 
0X44 , 0X74 , 0X77 , 0X44 , 
0X44 , 0X74 , 0X77 , 0X47 , 
0X44 , 0X74 , 0X77 , 0X74 , 
0X44 , 0X74 , 0X77 , 0X77 , 
0X44 , 0X77 , 0X44 , 0X44 , 
0X44 , 0X77 , 0X44 , 0X47 , 
0X44 , 0X77 , 0X44 , 0X74 , 
0X44 , 0X77 , 0X44 , 0X77 , 
0X44 , 0X77 , 0X47 , 0X44 , 
0X44 , 0X77 , 0X47 , 0X47 , 
0X44 , 0X77 , 0X47 , 0X74 , 
0X44 , 0X77 , 0X47 , 0X77 , 
0X44 , 0X77 , 0X74 , 0X44 , 
0X44 , 0X77 , 0X74 , 0X47 , 
0X44 , 0X77 , 0X74 , 0X74 , 
0X44 , 0X77 , 0X74 , 0X77 , 
0X44 , 0X77 , 0X77 , 0X44 , 
0X44 , 0X77 , 0X77 , 0X47 , 
0X44 , 0X77 , 0X77 , 0X74 , 
0X44 , 0X77 , 0X77 , 0X77 , 
0X47 , 0X44 , 0X44 , 0X44 , 
0X47 , 0X44 , 0X44 , 0X47 , 
0X47 , 0X44 , 0X44 , 0X74 , 
0X47 , 0X44 , 0X44 , 0X77 , 
0X47 , 0X44 , 0X47 , 0X44 , 
0X47 , 0X44 , 0X47 , 0X47 , 
0X47 , 0X44 , 0X47 , 0X74 , 
0X47 , 0X44 , 0X47 , 0X77 , 
0X47 , 0X44 , 0X74 , 0X44 , 
0X47 , 0X44 , 0X74 , 0X47 , 
0X47 , 0X44 , 0X74 , 0X74 , 
0X47 , 0X44 , 0X74 , 0X77 , 
0X47 , 0X44 , 0X77 , 0X44 , 
0X47 , 0X44 , 0X77 , 0X47 , 
0X47 , 0X44 , 0X77 , 0X74 , 
0X47 , 0X44 , 0X77 , 0X77 , 
0X47 , 0X47 , 0X44 , 0X44 , 
0X47 , 0X47 , 0X44 , 0X47 , 
0X47 , 0X47 , 0X44 , 0X74 , 
0X47 , 0X47 , 0X44 , 0X77 , 
0X47 , 0X47 , 0X47 , 0X44 , 
0X47 , 0X47 , 0X47 , 0X47 , 
0X47 , 0X47 , 0X47 , 0X74 , 
0X47 , 0X47 , 0X47 , 0X77 , 
0X47 , 0X47 , 0X74 , 0X44 , 
0X47 , 0X47 , 0X74 , 0X47 , 
0X47 , 0X47 , 0X74 , 0X74 , 
0X47 , 0X47 , 0X74 , 0X77 , 
0X47 , 0X47 , 0X77 , 0X44 , 
0X47 , 0X47 , 0X77 , 0X47 , 
0X47 , 0X47 , 0X77 , 0X74 , 
0X47 , 0X47 , 0X77 , 0X77 , 
0X47 , 0X74 , 0X44 , 0X44 , 
0X47 , 0X74 , 0X44 , 0X47 , 
0X47 , 0X74 , 0X44 , 0X74 , 
0X47 , 0X74 , 0X44 , 0X77 , 
0X47 , 0X74 , 0X47 , 0X44 , 
0X47 , 0X74 , 0X47 , 0X47 , 
0X47 , 0X74 , 0X47 , 0X74 , 
0X47 , 0X74 , 0X47 , 0X77 , 
0X47 , 0X74 , 0X74 , 0X44 , 
0X47 , 0X74 , 0X74 , 0X47 , 
0X47 , 0X74 , 0X74 , 0X74 , 
0X47 , 0X74 , 0X74 , 0X77 , 
0X47 , 0X74 , 0X77 , 0X44 , 
0X47 , 0X74 , 0X77 , 0X47 , 
0X47 , 0X74 , 0X77 , 0X74 , 
0X47 , 0X74 , 0X77 , 0X77 , 
0X47 , 0X77 , 0X44 , 0X44 , 
0X47 , 0X77 , 0X44 , 0X47 , 
0X47 , 0X77 , 0X44 , 0X74 , 
0X47 , 0X77 , 0X44 , 0X77 , 
0X47 , 0X77 , 0X47 , 0X44 , 
0X47 , 0X77 , 0X47 , 0X47 , 
0X47 , 0X77 , 0X47 , 0X74 , 
0X47 , 0X77 , 0X47 , 0X77 , 
0X47 , 0X77 , 0X74 , 0X44 , 
0X47 , 0X77 , 0X74 , 0X47 , 
0X47 , 0X77 , 0X74 , 0X74 , 
0X47 , 0X77 , 0X74 , 0X77 , 
0X47 , 0X77 , 0X77 , 0X44 , 
0X47 , 0X77 , 0X77 , 0X47 , 
0X47 , 0X77 , 0X77 , 0X74 , 
0X47 , 0X77 , 0X77 , 0X77 , 
0X74 , 0X44 , 0X44 , 0X44 , 
0X74 , 0X44 , 0X44 , 0X47 , 
0X74 , 0X44 , 0X44 , 0X74 , 
0X74 , 0X44 , 0X44 , 0X77 , 
0X74 , 0X44 , 0X47 , 0X44 , 
0X74 , 0X44 , 0X47 , 0X47 , 
0X74 , 0X44 , 0X47 , 0X74 , 
0X74 , 0X44 , 0X47 , 0X77 , 
0X74 , 0X44 , 0X74 , 0X44 , 
0X74 , 0X44 , 0X74 , 0X47 , 
0X74 , 0X44 , 0X74 , 0X74 , 
0X74 , 0X44 , 0X74 , 0X77 , 
0X74 , 0X44 , 0X77 , 0X44 , 
0X74 , 0X44 , 0X77 , 0X47 , 
0X74 , 0X44 , 0X77 , 0X74 , 
0X74 , 0X44 , 0X77 , 0X77 , 
0X74 , 0X47 , 0X44 , 0X44 , 
0X74 , 0X47 , 0X44 , 0X47 , 
0X74 , 0X47 , 0X44 , 0X74 , 
0X74 , 0X47 , 0X44 , 0X77 , 
0X74 , 0X47 , 0X47 , 0X44 , 
0X74 , 0X47 , 0X47 , 0X47 , 
0X74 , 0X47 , 0X47 , 0X74 , 
0X74 , 0X47 , 0X47 , 0X77 , 
0X74 , 0X47 , 0X74 , 0X44 , 
0X74 , 0X47 , 0X74 , 0X47 , 
0X74 , 0X47 , 0X74 , 0X74 , 
0X74 , 0X47 , 0X74 , 0X77 , 
0X74 , 0X47 , 0X77 , 0X44 , 
0X74 , 0X47 , 0X77 , 0X47 , 
0X74 , 0X47 , 0X77 , 0X74 , 
0X74 , 0X47 , 0X77 , 0X77 , 
0X74 , 0X74 , 0X44 , 0X44 , 
0X74 , 0X74 , 0X44 , 0X47 , 
0X74 , 0X74 , 0X44 , 0X74 , 
0X74 , 0X74 , 0X44 , 0X77 , 
0X74 , 0X74 , 0X47 , 0X44 , 
0X74 , 0X74 , 0X47 , 0X47 , 
0X74 , 0X74 , 0X47 , 0X74 , 
0X74 , 0X74 , 0X47 , 0X77 , 
0X74 , 0X74 , 0X74 , 0X44 , 
0X74 , 0X74 , 0X74 , 0X47 , 
0X74 , 0X74 , 0X74 , 0X74 , 
0X74 , 0X74 , 0X74 , 0X77 , 
0X74 , 0X74 , 0X77 , 0X44 , 
0X74 , 0X74 , 0X77 , 0X47 , 
0X74 , 0X74 , 0X77 , 0X74 , 
0X74 , 0X74 , 0X77 , 0X77 , 
0X74 , 0X77 , 0X44 , 0X44 , 
0X74 , 0X77 , 0X44 , 0X47 , 
0X74 , 0X77 , 0X44 , 0X74 , 
0X74 , 0X77 , 0X44 , 0X77 , 
0X74 , 0X77 , 0X47 , 0X44 , 
0X74 , 0X77 , 0X47 , 0X47 , 
0X74 , 0X77 , 0X47 , 0X74 , 
0X74 , 0X77 , 0X47 , 0X77 , 
0X74 , 0X77 , 0X74 , 0X44 , 
0X74 , 0X77 , 0X74 , 0X47 , 
0X74 , 0X77 , 0X74 , 0X74 , 
0X74 , 0X77 , 0X74 , 0X77 , 
0X74 , 0X77 , 0X77 , 0X44 , 
0X74 , 0X77 , 0X77 , 0X47 , 
0X74 , 0X77 , 0X77 , 0X74 , 
0X74 , 0X77 , 0X77 , 0X77 , 
0X77 , 0X44 , 0X44 , 0X44 , 
0X77 , 0X44 , 0X44 , 0X47 , 
0X77 , 0X44 , 0X44 , 0X74 , 
0X77 , 0X44 , 0X44 , 0X77 , 
0X77 , 0X44 , 0X47 , 0X44 , 
0X77 , 0X44 , 0X47 , 0X47 , 
0X77 , 0X44 , 0X47 , 0X74 , 
0X77 , 0X44 , 0X47 , 0X77 , 
0X77 , 0X44 , 0X74 , 0X44 , 
0X77 , 0X44 , 0X74 , 0X47 , 
0X77 , 0X44 , 0X74 , 0X74 , 
0X77 , 0X44 , 0X74 , 0X77 , 
0X77 , 0X44 , 0X77 , 0X44 , 
0X77 , 0X44 , 0X77 , 0X47 , 
0X77 , 0X44 , 0X77 , 0X74 , 
0X77 , 0X44 , 0X77 , 0X77 , 
0X77 , 0X47 , 0X44 , 0X44 , 
0X77 , 0X47 , 0X44 , 0X47 , 
0X77 , 0X47 , 0X44 , 0X74 , 
0X77 , 0X47 , 0X44 , 0X77 , 
0X77 , 0X47 , 0X47 , 0X44 , 
0X77 , 0X47 , 0X47 , 0X47 , 
0X77 , 0X47 , 0X47 , 0X74 , 
0X77 , 0X47 , 0X47 , 0X77 , 
0X77 , 0X47 , 0X74 , 0X44 , 
0X77 , 0X47 , 0X74 , 0X47 , 
0X77 , 0X47 , 0X74 , 0X74 , 
0X77 , 0X47 , 0X74 , 0X77 , 
0X77 , 0X47 , 0X77 , 0X44 , 
0X77 , 0X47 , 0X77 , 0X47 , 
0X77 , 0X47 , 0X77 , 0X74 , 
0X77 , 0X47 , 0X77 , 0X77 , 
0X77 , 0X74 , 0X44 , 0X44 , 
0X77 , 0X74 , 0X44 , 0X47 , 
0X77 , 0X74 , 0X44 , 0X74 , 
0X77 , 0X74 , 0X44 , 0X77 , 
0X77 , 0X74 , 0X47 , 0X44 , 
0X77 , 0X74 , 0X47 , 0X47 , 
0X77 , 0X74 , 0X47 , 0X74 , 
0X77 , 0X74 , 0X47 , 0X77 , 
0X77 , 0X74 , 0X74 , 0X44 , 
0X77 , 0X74 , 0X74 , 0X47 , 
0X77 , 0X74 , 0X74 , 0X74 , 
0X77 , 0X74 , 0X74 , 0X77 , 
0X77 , 0X74 , 0X77 , 0X44 , 
0X77 , 0X74 , 0X77 , 0X47 , 
0X77 , 0X74 , 0X77 , 0X74 , 
0X77 , 0X74 , 0X77 , 0X77 , 
0X77 , 0X77 , 0X44 , 0X44 , 
0X77 , 0X77 , 0X44 , 0X47 , 
0X77 , 0X77 , 0X44 , 0X74 , 
0X77 , 0X77 , 0X44 , 0X77 , 
0X77 , 0X77 , 0X47 , 0X44 , 
0X77 , 0X77 , 0X47 , 0X47 , 
0X77 , 0X77 , 0X47 , 0X74 , 
0X77 , 0X77 , 0X47 , 0X77 , 
0X77 , 0X77 , 0X74 , 0X44 , 
0X77 , 0X77 , 0X74 , 0X47 , 
0X77 , 0X77 , 0X74 , 0X74 , // ...
0X77 , 0X77 , 0X74 , 0X77 , // ..
0X77 , 0X77 , 0X77 , 0X44 , // .  
0X77 , 0X77 , 0X77 , 0X47 , //253
0X77 , 0X77 , 0X77 , 0X74 , //254
0X77 , 0X77 , 0X77 , 0X77 , //255

};

uint8_t ws_buffer[LED_BUFFER_LENGTH];

void encode_byte( uint8_t data, int16_t buffer_index )
{
   int index = (uint16_t) data * 4;
   ws_buffer[buffer_index++ ] = leddata[index++];
   ws_buffer[buffer_index++ ] = leddata[index++];
   ws_buffer[buffer_index++ ] = leddata[index++];
   ws_buffer[buffer_index++ ] = leddata[index++]; // datayi 4 ile çarpip istenen indexten yukari dogru artirilarak buffera kaydedilir
}

void generate_ws_buffer( uint8_t RData,uint8_t GData,uint8_t BData, int16_t led_no )
{
	//ws2812b
//G--R--B
//MSB first	
   int offset = led_no * 12; // 12 ile çarpmamizin sebebi 3 bytelik verinin R,G,B için tutulacak olmasidir ve 4 bytelik veri ise leddata içinde tutulmaktadir buradan 3*4 = 12
   encode_byte( GData, offset );	
   encode_byte( RData, offset+4 );
   encode_byte( BData, offset+8 ); // her bir renk icin 4 bytelik veri leddata mapinde tutuldugu icin led numarasindan sonra 4 byte artirarak diger renkler icin data kodlanir   
}

void Send_2812(void)
 {   
#if 1    
    HAL_SPI_Transmit_DMA( &hspi1, ws_buffer, LED_BUFFER_LENGTH ); 
    // wait until finished
    while(__HAL_SPI_GET_FLAG(&hspi1, SPI_FLAG_BSY ));
#else
    HAL_SPI_Transmit( &hspi1, ws_buffer, LED_BUFFER_LENGTH, 300 );
#endif
 } 
 
 
void resetPixelColors(void){
	 
	 int i;
   for(i=0;i< LED_NO;i++) {
      generate_ws_buffer( 0, 0, 0, i );
   }
   Send_2812();

 }
	
void setAllPixelColor(uint8_t r, uint8_t g, uint8_t b)
{ 
   int i;
   for(i=0;i< LED_NO;i++) {
      generate_ws_buffer( r, g, b, i );
		 
   }
   Send_2812();
}

 void setPixelColor(uint16_t n, uint8_t r, uint8_t g, uint8_t b)
 {	 
   generate_ws_buffer( r, g, b, n );
	 HAL_Delay(10);
   Send_2812();
}
 
void PreSetPixelColor(uint16_t n, uint8_t r, uint8_t g, uint8_t b)
 { 
   generate_ws_buffer( r, g, b, n );
 //  Send_2812(); don't use here
}

/**
 * initialize MOSI pin to LOW.  Without this, first time transmit for first LED might be wrong.
 *
 */
void initLEDMOSI(void)
{
   uint8_t buffer0[2] = { 0, 0 };
   HAL_SPI_Transmit(&hspi1, buffer0, 1, 100 );
	 HAL_Delay(10);
}

uint16_t effStep = 0;

uint8_t rainbow_effect_right() {
    // Strip ID: 0 - Effect: Rainbow - LEDS: 60
    // Steps: 60 - Delay: 20
    // Colors: 3 (255.0.0, 0.255.0, 0.0.255)
    // Options: rainbowlen=60, toLeft=true, 
  //if(millis() - strip_0.effStart < 20 * (strip_0.effStep)) return 0x00;
  float factor1, factor2;
  uint16_t ind;
  for(uint16_t j=0;j<60;j++) {
    ind = effStep + j * 2.5;
    switch((int)((ind % 150) / 50)) {
      case 0: factor1 = 1.0 - ((float)(ind % 150 - 0 * 50) / 50);
              factor2 = (float)((int)(ind - 0) % 150) / 50;
              PreSetPixelColor(j, 255 * factor1 + 0 * factor2, 0 * factor1 + 255 * factor2, 0 * factor1 + 0 * factor2);
              break;
      case 1: factor1 = 1.0 - ((float)(ind % 150 - 1 * 50) / 50);
              factor2 = (float)((int)(ind - 50) % 150) / 50;
              PreSetPixelColor(j, 0 * factor1 + 0 * factor2, 255 * factor1 + 0 * factor2, 0 * factor1 + 255 * factor2);
              break;
      case 2: factor1 = 1.0 - ((float)(ind % 150 - 2 * 50) / 50);
              factor2 = (float)((int)(ind - 100) % 150) / 50;
              PreSetPixelColor(j, 0 * factor1 + 255 * factor2, 0 * factor1 + 0 * factor2, 255 * factor1 + 0 * factor2);
              break;
    }
  }
	Send_2812();  
  if(effStep >= 150) {effStep=0; return 0x03; }
  else effStep++;
  return 0x01;
}

uint8_t breathe_effect(){
	resetPixelColors();
	
	for(br = 0;br<255;br++){
		float br = 255.0*(exp(-(pow(((br/255)-beta)/gamma,2.0))/2.0));
		setAllPixelColor(br,k,j);
		HAL_Delay(100);
		
  }
	
	if(br >= 255){
			for(br = 255;br<1;br--){
			float br = 255.0*(exp(-(pow(((br/255)-beta)/gamma,2.0))/2.0));
			setAllPixelColor(br,k,j);
			HAL_Delay(100);
			}		
		}
	
	return 0x01;
}


void breathe_effectv2(){
	
}



/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */

  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_DMA_Init();
  MX_SPI1_Init();
  MX_USART1_UART_Init();
  /* USER CODE BEGIN 2 */
__HAL_UART_ENABLE_IT(&huart1, UART_IT_RXNE);
	initLEDMOSI();
	resetPixelColors();
	
  /* USER CODE END 2 */

  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
	

  while (1)
  {
		
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */

				

				if(n==101){
					resetPixelColors();
				}
				
				setPixelColor(n,m,k,j);
	
				if(n==102){
					rainbow_effect_right();
				}
				
				if(n==103){
					setAllPixelColor(m, k, j);
				}
				
				if(n==104){
					breathe_effect();
				}

  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};
  RCC_PeriphCLKInitTypeDef PeriphClkInit = {0};

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI;
  RCC_OscInitStruct.HSIState = RCC_HSI_ON;
  RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSI;
  RCC_OscInitStruct.PLL.PLLMUL = RCC_PLL_MUL12;
  RCC_OscInitStruct.PLL.PREDIV = RCC_PREDIV_DIV1;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_1) != HAL_OK)
  {
    Error_Handler();
  }
  PeriphClkInit.PeriphClockSelection = RCC_PERIPHCLK_USART1;
  PeriphClkInit.Usart1ClockSelection = RCC_USART1CLKSOURCE_PCLK1;
  if (HAL_RCCEx_PeriphCLKConfig(&PeriphClkInit) != HAL_OK)
  {
    Error_Handler();
  }
}

/* USER CODE BEGIN 4 */
void HAL_UART_RxCpltCallback(UART_HandleTypeDef *huart){
	
	switch(r){
		
		case 'A': n = i - 1; i = 0; break;
		case 'B': m = i; i = 0; break;
		case 'C': k = i; i = 0; break;
		case 'D': j = i; i = 0; break;
		default: i = 10 * i + r - 0x30;
	}
	
	if(n>60 && n!=101 && n!=102 && n!=103 && n!=104){
		n = 59; //geçerli led sayisindan fazla girildiginde hatayla karsilasmamak icin

	}

	
	
}
/* USER CODE END 4 */

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
