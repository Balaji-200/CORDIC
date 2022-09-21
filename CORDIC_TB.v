module CORDIC_TB ();

  localparam width = 16; //width of x and y

  // Inputs
  reg [width-1:0] Xin, Yin;
  reg [31:0] angle;
  reg clock;
  reg signed [63:0] i;

  wire [width-1:0] cosine, sine;

  localparam An = 32000/1.647;
  
  CORDIC TEST_RUN (.clock (clock), .cosine (cosine), .sine(sine), .Xin (Xin), .Yin (Yin), .angle (angle));

  initial begin

    //set initial values
   
	
    Xin = An;     // Xout = 32000*cos(angle)
    Yin = 0;      // Yout = 32000*sin(angle)

    //set clock
    clock = 'b0;
    forever
      #5 clock = !clock;
    end 
	 
	 initial begin
	
	$display("Angle\t\t\t Sine\t\t\t Cosine.");
	
	angle = 'b00000000000000000000000000000000;      // 0deg
	#1000;
	$display("0deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b00001010101010101010101010101010;      // 30deg
	#1000;
	$display("30deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b00101010101010101010101010101011;      // 60 deg 
   #1000;
	$display("60deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b00110101010101010101010101010101;      // 75deg
	#1000;
	$display("75deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b01000000000000000000000000000000;      // 90 deg
	#1000;
	$display("90deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b11100000000000000000000000000000;      // 135deg
	#1000;
	$display("135deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	angle = 'b01101010101010101010101010101011;      // 150 deg
	#1000;
	$display("60deg","\t\t\t ",sine,"\t\t\t ",cosine);
	
	#1000;
	$write("Simulation has finished");
	
	end
endmodule
