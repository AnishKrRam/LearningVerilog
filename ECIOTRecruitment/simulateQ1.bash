iverilog question1.v question1_test.v -o question1
vvp question1
gtkwave question1_test.vcd --rcvar 'fontname_signals Monospace 16' --rcvar 'fontname_waves Monospace 16'
