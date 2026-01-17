# Reset button from daughterboard
set_property IOSTANDARD LVCMOS33 [get_ports {reset_in}]
set_property PACKAGE_PIN U20 [get_ports {reset_in}]

# Button for toggling I2S audio output on/off
set_property IOSTANDARD LVCMOS33 [get_ports {audio_enable_in}]
set_property PACKAGE_PIN U19 [get_ports {audio_enable_in}]

# Green LED
set_property IOSTANDARD LVCMOS33 [get_ports {leds[1]}]
set_property PACKAGE_PIN W13 [get_ports {leds[1]}]

# Red LED
set_property IOSTANDARD LVCMOS33 [get_ports {leds[0]}]
set_property PACKAGE_PIN W14 [get_ports {leds[0]}]

# I2S bit clock out
set_property IOSTANDARD LVCMOS33 [get_ports {bit_clk_out}]
set_property PACKAGE_PIN M17 [get_ports {bit_clk_out}]

# I2S left/right channel clock out
set_property IOSTANDARD LVCMOS33 [get_ports {lr_clk_out}]
set_property PACKAGE_PIN P18 [get_ports {lr_clk_out}]

# I2S data out
set_property IOSTANDARD LVCMOS33 [get_ports {i2s_data_out}]
set_property PACKAGE_PIN M19 [get_ports {i2s_data_out}]

# 50MHz crystal X5: R1372 and L29 have to be soldered for it to work
set_property IOSTANDARD LVCMOS33 [get_ports {sys_clk_in}]
set_property PACKAGE_PIN N18 [get_ports {sys_clk_in}]
