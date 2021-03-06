//An actor can send messages to itself or to other actors. 
//create new actors
//change its own state

actor PingPong
  
  var _num: U32 = 0
  let _out: OutStream
  
 new create(num: U32, out: OutStream) =>   //constructors have names 
  //Here we have our own constructor, which creates its own partner
  _num= num
  _out = out
  
 be ping(partner: PingPong) =>  //be behaviour is like a method
 //A behaviour: we've received a pong
 if _num > 0 then
 //check if ping in order to print to screen
 _out.write("Ping...\n")
 _num = _num - 1
 partner.pong(this)
 end
 
 be pong(partner: PingPong) =>
 //A behaviour: we've received a pong.
 if _num > 0 then
 _num = _num - 1
 _out.write("Pong!\n")
 partner.ping(this)
 end
