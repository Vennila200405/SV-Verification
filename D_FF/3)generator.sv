class generator;
  transaction tr;
  mailbox gen_drv;
  
  function new(mailbox gen_drv);
    this.gen_drv = gen_drv;
  endfunction
  
  task run();
    repeat(10)begin
    tr = new();
    tr.randomize();
      gen_drv.put(tr);
    end
  endtask
  endclass
