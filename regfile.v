module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
   /* YOUR CODE HERE */

	wire [31:0] wrt_prt_out,decode_out_a, decode_out_b;
	wire [1023:0] q_out1;
  // tri [31:0] data_readRegA, data_readRegB;
  
 write_port write_p(ctrl_writeEnable, ctrl_writeReg[4:0], wrt_prt_out[31:0]);	
	genvar i;
generate

	for(i=0;i<=31;i=i+1)begin: w

	dffe_ref r(q_out1[((i+1)*32-1):i*32], data_writeReg[31:0],clock,wrt_prt_out[i], 1'b0);
		
	end
endgenerate
		 
  decoder de_read_a(ctrl_readRegA[4:0], decode_out_a[31:0]);
 genvar j;
generate
	for(j=0;j<=31;j=j+1)begin: read_a
	
		assign data_readRegA[31:0] = decode_out_a[j] ? q_out1[((j+1)*32-1):j*32] : 32'hzzzzzzzz;
		
	end
endgenerate

  decoder de_read_b(ctrl_readRegB[4:0], decode_out_b[31:0]);
genvar k;
generate
	for(k=0;k<=31;k=k+1)begin: read_b
	
		assign data_readRegB[31:0] = decode_out_b[k] ? q_out1[((k+1)*32-1):k*32] : 32'hzzzzzzzz;
		
	end
endgenerate
		

endmodule
