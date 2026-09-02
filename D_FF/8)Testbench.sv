`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module dff_tb;
  initial begin
    inter.clk=0;
  end
  always #5 inter.clk=~inter.clk;
  inf inter();
  
  dff dut(.clk(inter.clk),.rst(inter.rst),.d(inter.d),.q(inter.q));
  initial begin
    inter.rst=1;
    #15 inter.rst=0;
  end
  test tst;
  initial begin
    tst=new(inter);
    tst.run();
  end
    
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0,dff_tb);
    #500 $finish;
  end
endmodule
