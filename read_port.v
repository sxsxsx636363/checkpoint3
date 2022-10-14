module read_port (read_prt_in, ctrl_readReg, read_prt_out);
 input [31:0] read_prt_in;
 output [31:0] read_prt_out;
 input [4:0] ctrl_readReg;
 wire [31:0] decode_out;
 
 //tri [31:0] read_prt_out;
 decoder de_read(ctrl_readReg, decode_out);
 genvar i;
generate
	for(i=0;i<=31;i=i+1)begin: read_p
	
	bufif1(read_prt_out,read_prt_in, decode_out[i] );
		//assign read_prt_out = decode_out[i] ? read_prt_in : 1'bz;
		
	end
endgenerate
 endmodule
 