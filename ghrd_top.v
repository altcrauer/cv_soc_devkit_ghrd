module ghrd_top (
    // FPGA peripherals ports
	input  wire [3:0]  fpga_dipsw_pio,                   
	output wire [3:0]  fpga_led_pio,                     
	input  wire [1:0]  fpga_button_pio,  
    // HPS memory controller ports
	output wire [14:0] hps_memory_mem_a,                           
	output wire [2:0]  hps_memory_mem_ba,                          
	output wire        hps_memory_mem_ck,                          
	output wire        hps_memory_mem_ck_n,                        
	output wire        hps_memory_mem_cke,                         
	output wire        hps_memory_mem_cs_n,                        
	output wire        hps_memory_mem_ras_n,                       
	output wire        hps_memory_mem_cas_n,                       
	output wire        hps_memory_mem_we_n,                        
	output wire        hps_memory_mem_reset_n,                     
	inout  wire [39:0] hps_memory_mem_dq,                          
	inout  wire [4:0]  hps_memory_mem_dqs,                         
	inout  wire [4:0]  hps_memory_mem_dqs_n,                       
	output wire        hps_memory_mem_odt,                         
	output wire [4:0]  hps_memory_mem_dm,                          
	input  wire        hps_memory_oct_rzqin,                       
    // HPS peripherals
	output wire        hps_emac1_TX_CLK,   
	output wire        hps_emac1_TXD0,     
	output wire        hps_emac1_TXD1,     
	output wire        hps_emac1_TXD2,     
	output wire        hps_emac1_TXD3,     
	input  wire        hps_emac1_RXD0,     
	inout  wire        hps_emac1_MDIO,     
	output wire        hps_emac1_MDC,      
	input  wire        hps_emac1_RX_CTL,   
	output wire        hps_emac1_TX_CTL,   
	input  wire        hps_emac1_RX_CLK,   
	input  wire        hps_emac1_RXD1,     
	input  wire        hps_emac1_RXD2,     
	input  wire        hps_emac1_RXD3,     
	inout  wire        hps_qspi_IO0,       
	inout  wire        hps_qspi_IO1,       
	inout  wire        hps_qspi_IO2,       
	inout  wire        hps_qspi_IO3,       
	output wire        hps_qspi_SS0,       
	output wire        hps_qspi_CLK,       
	inout  wire        hps_sdio_CMD,       
	inout  wire        hps_sdio_D0,        
	inout  wire        hps_sdio_D1,        
	output wire        hps_sdio_CLK,       
	inout  wire        hps_sdio_D2,        
	inout  wire        hps_sdio_D3,        
	inout  wire        hps_usb1_D0,        
	inout  wire        hps_usb1_D1,        
	inout  wire        hps_usb1_D2,        
	inout  wire        hps_usb1_D3,        
	inout  wire        hps_usb1_D4,        
	inout  wire        hps_usb1_D5,        
	inout  wire        hps_usb1_D6,        
	inout  wire        hps_usb1_D7,        
	input  wire        hps_usb1_CLK,       
	output wire        hps_usb1_STP,       
	input  wire        hps_usb1_DIR,       
	input  wire        hps_usb1_NXT,       
	output wire        hps_spim0_CLK,      
	output wire        hps_spim0_MOSI,     
	input  wire        hps_spim0_MISO,     
	output wire        hps_spim0_SS0,      
	input  wire        hps_uart0_RX,       
	output wire        hps_uart0_TX,       
	inout  wire        hps_i2c0_SDA,       
	inout  wire        hps_i2c0_SCL,       
	input  wire        hps_can0_RX,        
	output wire        hps_can0_TX,        
	output wire        hps_trace_CLK,      
	output wire        hps_trace_D0,       
	output wire        hps_trace_D1,       
	output wire        hps_trace_D2,       
	output wire        hps_trace_D3,       
	output wire        hps_trace_D4,       
	output wire        hps_trace_D5,       
	output wire        hps_trace_D6,       
	output wire        hps_trace_D7,       
	inout  wire        hps_gpio_GPIO09,    
	inout  wire        hps_gpio_GPIO35,    
	inout  wire        hps_gpio_GPIO41,    
	inout  wire        hps_gpio_GPIO42,    
	inout  wire        hps_gpio_GPIO43,    
	inout  wire        hps_gpio_GPIO44,    
	
	//fpga ddr3 memory
	output wire [14:0] fpga_memory_mem_a,
	output wire [2:0] fpga_memory_mem_ba,
	output wire fpga_memory_mem_ck,
	output wire fpga_memory_mem_ck_n,
	output wire fpga_memory_mem_cke,
	output wire fpga_memory_mem_cs_n,
	output wire [1:0] fpga_memory_mem_dm,
	output wire fpga_memory_mem_ras_n,
	output wire fpga_memory_mem_cas_n,
	output wire fpga_memory_mem_we_n,
	output wire fpga_memory_mem_reset_n,
	inout wire [15:0] fpga_memory_mem_dq,
	inout wire [1:0] fpga_memory_mem_dqs,
	inout wire [1:0] fpga_memory_mem_dqs_n,
	output wire fpga_memory_mem_odt,
	input wire fpga_memory_oct_rzqin,
	
	//HSMC Stuff
	output           top_HC_HD,
	output           top_HC_VD,
	output           top_HC_DEN,
	output  [7:0]    top_HC_LCD_DATA,

	output top_HC_NCLK,
	output top_HC_GREST,

	output [9:0] top_HC_VGA_DATA,
	output top_HC_VGA_CLOCK,
	output top_HC_VGA_HS,
	output top_HC_VGA_VS,
	output top_HC_VGA_BLANK,
	output top_HC_VGA_SYNC,
	  
	output top_HC_ADC_CS_N,
	output top_HC_ADC_DCLK,
	input  top_HC_ADC_DOUT,
	output top_HC_ADC_DIN,
	input  top_HC_ADC_PENIRQ_N,
	
   output           top_HC_SCEN,
   inout            top_HC_SDA,

	input            top_HC_TX_CLK,
	output           top_HC_ETH_RESET_N,

	inout		top_HC_PS2_DAT,
	inout		top_HC_PS2_CLK,

    // FPGA clock and reset
	input  wire        fpga_clk_50
);

//extra connections for HSMC  
  wire clk_120;
  wire clk_40;
  wire [23:0] VGA_DATA;
  wire VGA_BLANK;
  wire VGA_HS;
  wire VGA_VS;
  wire [23:0] LCD_DATA;
  wire LCD_BLANK;
  wire LCD_HS;
  wire LCD_VS;
  wire             top_SCLK_from_the_touch_panel_spi;
  wire             top_SS_n_from_the_touch_panel_spi;
  
  wire top_out_port_from_the_lcd_i2c_en;
  wire top_out_port_from_the_lcd_i2c_scl;

// internal wires and registers declaration
  wire [1:0] fpga_debounced_buttons;
  wire [3:0] fpga_led_internal;
  wire       hps_fpga_reset_n;

// connection of internal logics
  assign fpga_led_pio = fpga_led_internal;

// SoC sub-system module
soc_system soc_inst (
  .memory_mem_a                         (hps_memory_mem_a),                               
  .memory_mem_ba                        (hps_memory_mem_ba),                         
  .memory_mem_ck                        (hps_memory_mem_ck),                         
  .memory_mem_ck_n                      (hps_memory_mem_ck_n),                       
  .memory_mem_cke                       (hps_memory_mem_cke),                        
  .memory_mem_cs_n                      (hps_memory_mem_cs_n),                       
  .memory_mem_ras_n                     (hps_memory_mem_ras_n),                      
  .memory_mem_cas_n                     (hps_memory_mem_cas_n),                      
  .memory_mem_we_n                      (hps_memory_mem_we_n),                       
  .memory_mem_reset_n                   (hps_memory_mem_reset_n),                    
  .memory_mem_dq                        (hps_memory_mem_dq),                         
  .memory_mem_dqs                       (hps_memory_mem_dqs),                        
  .memory_mem_dqs_n                     (hps_memory_mem_dqs_n),                      
  .memory_mem_odt                       (hps_memory_mem_odt),                        
  .memory_mem_dm                        (hps_memory_mem_dm),                         
  .memory_oct_rzqin                     (hps_memory_oct_rzqin),                      
  .dipsw_pio_external_connection_export (fpga_dipsw_pio),    
  .led_pio_external_connection_in_port  (fpga_led_internal),
  .led_pio_external_connection_out_port (fpga_led_internal),                   
  .button_pio_external_connection_export(fpga_debounced_buttons),                
  .hps_0_hps_io_hps_io_emac1_inst_TX_CLK(hps_emac1_TX_CLK), 
  .hps_0_hps_io_hps_io_emac1_inst_TXD0  (hps_emac1_TXD0),   
  .hps_0_hps_io_hps_io_emac1_inst_TXD1  (hps_emac1_TXD1),   
  .hps_0_hps_io_hps_io_emac1_inst_TXD2  (hps_emac1_TXD2),   
  .hps_0_hps_io_hps_io_emac1_inst_TXD3  (hps_emac1_TXD3),   
  .hps_0_hps_io_hps_io_emac1_inst_RXD0  (hps_emac1_RXD0),   
  .hps_0_hps_io_hps_io_emac1_inst_MDIO  (hps_emac1_MDIO),   
  .hps_0_hps_io_hps_io_emac1_inst_MDC   (hps_emac1_MDC),    
  .hps_0_hps_io_hps_io_emac1_inst_RX_CTL(hps_emac1_RX_CTL), 
  .hps_0_hps_io_hps_io_emac1_inst_TX_CTL(hps_emac1_TX_CTL), 
  .hps_0_hps_io_hps_io_emac1_inst_RX_CLK(hps_emac1_RX_CLK), 
  .hps_0_hps_io_hps_io_emac1_inst_RXD1  (hps_emac1_RXD1),   
  .hps_0_hps_io_hps_io_emac1_inst_RXD2  (hps_emac1_RXD2),   
  .hps_0_hps_io_hps_io_emac1_inst_RXD3  (hps_emac1_RXD3),   
  .hps_0_hps_io_hps_io_qspi_inst_IO0    (hps_qspi_IO0),     
  .hps_0_hps_io_hps_io_qspi_inst_IO1    (hps_qspi_IO1),     
  .hps_0_hps_io_hps_io_qspi_inst_IO2    (hps_qspi_IO2),     
  .hps_0_hps_io_hps_io_qspi_inst_IO3    (hps_qspi_IO3),     
  .hps_0_hps_io_hps_io_qspi_inst_SS0    (hps_qspi_SS0),     
  .hps_0_hps_io_hps_io_qspi_inst_CLK    (hps_qspi_CLK),     
  .hps_0_hps_io_hps_io_sdio_inst_CMD    (hps_sdio_CMD),     
  .hps_0_hps_io_hps_io_sdio_inst_D0     (hps_sdio_D0),      
  .hps_0_hps_io_hps_io_sdio_inst_D1     (hps_sdio_D1),      
  .hps_0_hps_io_hps_io_sdio_inst_CLK    (hps_sdio_CLK),     
  .hps_0_hps_io_hps_io_sdio_inst_D2     (hps_sdio_D2),      
  .hps_0_hps_io_hps_io_sdio_inst_D3     (hps_sdio_D3),      
  .hps_0_hps_io_hps_io_usb1_inst_D0     (hps_usb1_D0),      
  .hps_0_hps_io_hps_io_usb1_inst_D1     (hps_usb1_D1),      
  .hps_0_hps_io_hps_io_usb1_inst_D2     (hps_usb1_D2),      
  .hps_0_hps_io_hps_io_usb1_inst_D3     (hps_usb1_D3),      
  .hps_0_hps_io_hps_io_usb1_inst_D4     (hps_usb1_D4),      
  .hps_0_hps_io_hps_io_usb1_inst_D5     (hps_usb1_D5),      
  .hps_0_hps_io_hps_io_usb1_inst_D6     (hps_usb1_D6),      
  .hps_0_hps_io_hps_io_usb1_inst_D7     (hps_usb1_D7),      
  .hps_0_hps_io_hps_io_usb1_inst_CLK    (hps_usb1_CLK),     
  .hps_0_hps_io_hps_io_usb1_inst_STP    (hps_usb1_STP),     
  .hps_0_hps_io_hps_io_usb1_inst_DIR    (hps_usb1_DIR),     
  .hps_0_hps_io_hps_io_usb1_inst_NXT    (hps_usb1_NXT),     
  .hps_0_hps_io_hps_io_spim0_inst_CLK   (hps_spim0_CLK),    
  .hps_0_hps_io_hps_io_spim0_inst_MOSI  (hps_spim0_MOSI),   
  .hps_0_hps_io_hps_io_spim0_inst_MISO  (hps_spim0_MISO),   
  .hps_0_hps_io_hps_io_spim0_inst_SS0   (hps_spim0_SS0),    
  .hps_0_hps_io_hps_io_uart0_inst_RX    (hps_uart0_RX),     
  .hps_0_hps_io_hps_io_uart0_inst_TX    (hps_uart0_TX),     
  .hps_0_hps_io_hps_io_i2c0_inst_SDA    (hps_i2c0_SDA),     
  .hps_0_hps_io_hps_io_i2c0_inst_SCL    (hps_i2c0_SCL),     
  .hps_0_hps_io_hps_io_can0_inst_RX     (hps_can0_RX),      
  .hps_0_hps_io_hps_io_can0_inst_TX     (hps_can0_TX),      
  .hps_0_hps_io_hps_io_trace_inst_CLK   (hps_trace_CLK),    
  .hps_0_hps_io_hps_io_trace_inst_D0    (hps_trace_D0),     
  .hps_0_hps_io_hps_io_trace_inst_D1    (hps_trace_D1),     
  .hps_0_hps_io_hps_io_trace_inst_D2    (hps_trace_D2),     
  .hps_0_hps_io_hps_io_trace_inst_D3    (hps_trace_D3),     
  .hps_0_hps_io_hps_io_trace_inst_D4    (hps_trace_D4),     
  .hps_0_hps_io_hps_io_trace_inst_D5    (hps_trace_D5),     
  .hps_0_hps_io_hps_io_trace_inst_D6    (hps_trace_D6),     
  .hps_0_hps_io_hps_io_trace_inst_D7    (hps_trace_D7),     
  .hps_0_hps_io_hps_io_gpio_inst_GPIO09 (hps_gpio_GPIO09),  
  .hps_0_hps_io_hps_io_gpio_inst_GPIO35 (hps_gpio_GPIO35),  
  .hps_0_hps_io_hps_io_gpio_inst_GPIO41 (hps_gpio_GPIO41),  
  .hps_0_hps_io_hps_io_gpio_inst_GPIO42 (hps_gpio_GPIO42),  
  .hps_0_hps_io_hps_io_gpio_inst_GPIO43 (hps_gpio_GPIO43),  
  .hps_0_hps_io_hps_io_gpio_inst_GPIO44 (hps_gpio_GPIO44),  
  .clk_clk                              (fpga_clk_50),
  .hps_0_h2f_reset_reset_n              (hps_fpga_reset_n),
  .reset_reset_n                        (hps_fpga_reset_n),
  
	//FPGA DDR3 memory stuff
	.fpga_memory_mem_a                   (fpga_memory_mem_a),
	.fpga_memory_mem_ba                  (fpga_memory_mem_ba),
	.fpga_memory_mem_ck                  (fpga_memory_mem_ck),
	.fpga_memory_mem_ck_n                (fpga_memory_mem_ck_n),
	.fpga_memory_mem_cke                 (fpga_memory_mem_cke),
	.fpga_memory_mem_cs_n                (fpga_memory_mem_cs_n),
	.fpga_memory_mem_dm                  (fpga_memory_mem_dm),
	.fpga_memory_mem_ras_n               (fpga_memory_mem_ras_n),
	.fpga_memory_mem_cas_n               (fpga_memory_mem_cas_n),
	.fpga_memory_mem_we_n                (fpga_memory_mem_we_n),
	.fpga_memory_mem_reset_n             (fpga_memory_mem_reset_n),
	.fpga_memory_mem_dq                  (fpga_memory_mem_dq),
	.fpga_memory_mem_dqs                 (fpga_memory_mem_dqs),
	.fpga_memory_mem_dqs_n               (fpga_memory_mem_dqs_n),
	.fpga_memory_mem_odt                 (fpga_memory_mem_odt),
	.fpga_memory_oct_rzqin               (fpga_memory_oct_rzqin),
	
	//LCD signals
	.display_pll_lcd_clk_clk                                       (clk_120),                                       //                           clk_120.clk
	.display_pll_lcd_vip_data_clk_clk                                        (clk_40),                                        //                            clk_40.clk

	.alt_vip_itc_lcd_clocked_video_vid_clk                   (clk_40),                   //           alt_vip_itc_1_clocked_video.vid_clk
	.alt_vip_itc_lcd_clocked_video_vid_data                  (LCD_DATA),                  //                                  .vid_data
	.alt_vip_itc_lcd_clocked_video_underflow                 (),                 //                                  .underflow
	.alt_vip_itc_lcd_clocked_video_vid_datavalid             (LCD_BLANK),             //                                  .vid_datavalid
	.alt_vip_itc_lcd_clocked_video_vid_v_sync                (LCD_VS),                //                                  .vid_v_sync
	.alt_vip_itc_lcd_clocked_video_vid_h_sync                (LCD_HS),                //                                  .vid_h_sync
	.alt_vip_itc_lcd_clocked_video_vid_f                     (),                     //                                  .vid_f
	.alt_vip_itc_lcd_clocked_video_vid_h                     (),                     //                                  .vid_h
	.alt_vip_itc_lcd_clocked_video_vid_v                     (),                      //                                  .vid_v
	
	.lcd_i2c_sdat_export                         (top_HC_SDA),                         //                   lcd_i2c_sdat.export
	.lcd_i2c_en_export                           (top_out_port_from_the_lcd_i2c_en),                           //                     lcd_i2c_en.export
	.lcd_i2c_scl_export                          (top_out_port_from_the_lcd_i2c_scl),                           //                    lcd_i2c_scl.export
	.ps2_0_signals_CLK                           (top_HC_PS2_CLK),                           //                  ps2_0_signals.CLK
	.ps2_0_signals_DAT                           (top_HC_PS2_DAT),    
	 
	.touch_panel_spi_external_MISO               (top_HC_ADC_DOUT),               //       touch_panel_spi_external.MISO
	.touch_panel_spi_external_MOSI               (top_HC_ADC_DIN),               //                               .MOSI
	.touch_panel_spi_external_SCLK               (top_SCLK_from_the_touch_panel_spi),               //                               .SCLK
	.touch_panel_spi_external_SS_n               (top_SS_n_from_the_touch_panel_spi),                //                               .SS_n
	.touch_panel_pen_irq_n_export                (top_HC_ADC_PENIRQ_N),                //          touch_panel_pen_irq_n.export
	
.alt_vip_itc_vga_clocked_video_vid_clk       (clk_40),       //  alt_vip_itc_vga_clocked_video.vid_clk
  .alt_vip_itc_vga_clocked_video_vid_data      (VGA_DATA),      //                               .vid_data
  .alt_vip_itc_vga_clocked_video_underflow     (),     //                               .underflow
  .alt_vip_itc_vga_clocked_video_vid_datavalid (VGA_BLANK), //                               .vid_datavalid
  .alt_vip_itc_vga_clocked_video_vid_v_sync    (VGA_VS),    //                               .vid_v_sync
  .alt_vip_itc_vga_clocked_video_vid_h_sync    (VGA_HS),    //                               .vid_h_sync
  .alt_vip_itc_vga_clocked_video_vid_f         (),         //                               .vid_f
  .alt_vip_itc_vga_clocked_video_vid_h         (),         //                               .vid_h
  .alt_vip_itc_vga_clocked_video_vid_v         ()          //                               .vid_v
);  

// Debounce logic to clean out glitches within 1ms
debounce debounce_inst (
  .clk                                  (fpga_clk_50),
  .reset_n                              (hps_fpga_reset_n),  
  .data_in                              (fpga_button_pio),
  .data_out                             (fpga_debounced_buttons)
);
  defparam debounce_inst.WIDTH = 2;
  defparam debounce_inst.POLARITY = "LOW";
  defparam debounce_inst.TIMEOUT = 50000;               // at 50Mhz this is a debounce time of 1ms
  defparam debounce_inst.TIMEOUT_WIDTH = 16;            // ceil(log2(TIMEOUT))
  
  //LCD Stuff
  wire hs3_wire;
  wire vs3_wire;
  assign top_HC_HD = ~hs3_wire;
  assign top_HC_VD = ~vs3_wire;
  vga_serial u_lcd_serial( 
    .data(LCD_DATA), .blank(LCD_BLANK), .hs(LCD_HS), .vs(LCD_VS),
    .clk3(clk_120), .data3(top_HC_LCD_DATA), .blank3(top_HC_DEN), .hs3(hs3_wire), .vs3(vs3_wire)
  );

  assign top_HC_GREST = 1'b1;
  assign top_HC_NCLK = clk_120;
  assign top_HC_SCEN = top_out_port_from_the_lcd_i2c_en;
  assign top_HC_ADC_CS_N = top_SS_n_from_the_touch_panel_spi;
    assign top_HC_ADC_DCLK = ~top_SS_n_from_the_touch_panel_spi ? top_SCLK_from_the_touch_panel_spi: (~top_out_port_from_the_lcd_i2c_en ? top_out_port_from_the_lcd_i2c_scl: 0);

  
  //VGA stuff      
  assign top_HC_VGA_CLOCK = clk_120;
  assign top_HC_VGA_SYNC = 1'b1;

  vga_serial u_vga_serial( 
    .data(VGA_DATA), .blank(VGA_BLANK), .hs(VGA_HS), .vs(VGA_VS),
    .clk3(clk_120), .data3(top_HC_VGA_DATA[9:2]), .blank3(top_HC_VGA_BLANK), .hs3(top_HC_VGA_HS), .vs3(top_HC_VGA_VS)
  );
  
  //hsmc ethernet
  assign top_HC_ETH_RESET_N = 1'b0;
  
endmodule
