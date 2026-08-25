class monitor;
  transaction tr;
  mailbox mon_scr;
  virtual inf vif;
  
  function new(mailbox mon_scr, virtual inf vif);
    this.mon_scr = mon_scr;
    this.vif = vif;
  endfunction
  
  task run();
    forever begin
      #10;
      tr = new();
      tr.a = vif.a;
      tr.b = vif.b;
      tr.c = vif.c;
      
      #1;
      tr.sum = vif.sum;
      tr.carry = vif.carry;
      
      mon_scr.put(tr);
    end
  endtask
endclass
