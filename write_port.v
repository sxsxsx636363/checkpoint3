module write_port (ctrl_writeEnable, ctrl_writeReg, wrt_prt_out);

 output [31:0] wrt_prt_out;
 input ctrl_writeEnable;
 input [4:0] ctrl_writeReg;
 wire [31:0] decode_out;
 
 decoder de_write(ctrl_writeReg, decode_out);
 //reg 0 read only
 and(wrt_prt_out[0],1'b0,decode_out[0]);
 genvar i;
generate
	for(i=1;i<=31;i=i+1)begin: write_p
	
		and(wrt_prt_out[i],ctrl_writeEnable,decode_out[i]);
		
	end
endgenerate
 endmodule
 