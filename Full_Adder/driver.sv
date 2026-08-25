class driver;
  transaction tr;
  mailbox gen_drv;
  virtual inf vif;
  
  function new(mailbox gen_drv, virtual inf vif);
    this.gen_drv = gen_drv;
    this.vif = vif;
  endfunction
  
  task run();
    forever begin
      gen_drv.get(tr);
      vif.a = tr.a;
      vif.b = tr.b;
      vif.c = tr.c;
      
      #10;
    end
  endtask
endclass
