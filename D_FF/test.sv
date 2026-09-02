class test;
  environment env;
  virtual inf vif;

  function new(virtual inf vif);
    this.vif = vif;
    env = new(vif);
  endfunction

  task run();
    env.run();
  endtask
endclass
