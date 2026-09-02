class driver;
  transaction tr;
  mailbox gen_drv;
  virtual inf vif;
  
  function new(mailbox gen_drv,virtual inf vif);
    this.gen_drv = gen_drv;
    this.vif = vif;
  endfunction
  
  task run();
    forever begin
      gen_drv.get(tr);
      @(posedge vif.clk);
      
      vif.rst <= tr.rst;
      vif.d <= tr.d;
    end
  endtask
endclass
