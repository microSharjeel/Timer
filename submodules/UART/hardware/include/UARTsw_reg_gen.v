//This file was generated by script mkregs.py



//write registers
`REG_ARE(clk, rst, 0, valid & wstrb & (address == 0), UART_SOFTRESET, wdata[1-1:0])
`REG_ARE(clk, rst, 0, valid & wstrb & (address == 1), UART_DIV, wdata[DATA_W/2-1:0])
`REG_ARE(clk, rst, 0, valid & wstrb & (address == 2), UART_TXDATA, wdata[DATA_W/4-1:0])
`REG_ARE(clk, rst, 0, valid & wstrb & (address == 3), UART_TXEN, wdata[1-1:0])
`REG_ARE(clk, rst, 0, valid & wstrb & (address == 6), UART_RXEN, wdata[1-1:0])


//read registers
`SIGNAL(rdata_int, DATA_W)
`SIGNAL2OUT(rdata, rdata_int)

always @* begin
   rdata_int = 1'b0;
   case(address)
     4: rdata_int = UART_TXREADY;
     5: rdata_int = UART_RXDATA;
     7: rdata_int = UART_RXREADY;
     default: rdata_int = 1'b0;
   endcase
end
`SIGNAL(ready_int, 1)
`REG_AR(clk, rst, 0, ready_int, valid)
`SIGNAL2OUT(ready, ready_int)
