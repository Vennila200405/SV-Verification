`include "interface.sv"
`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module full_adder_tb;
  inf inter();
  
  full_adder dut (
    .a     (inter.a),
    .b     (inter.b),
    .c     (inter.c),
    .sum   (inter.sum),
    .carry (inter.carry)
  );

  test tst;
  
  initial begin
    tst = new(inter);
    tst.run();
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, full_adder_tb);                                    

    #100;
    $finish;
  end
endmodule
